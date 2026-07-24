# Maintainer: wyf9661 <wyf9661@hotmail.com>
pkgname=metapi
pkgver=1.3.7
pkgrel=1
pkgdesc='Meta-layer management and unified proxy for AI API aggregation platforms'
arch=('any')
url='https://github.com/wyf9661/metapi'
license=('MIT')
options=('!debug')
depends=(
  'nodejs>=25'
)
makedepends=('npm')
optdepends=(
  # Client drivers (mysql2 / pg) ship inside the package via npm node_modules.
  # These are only the optional local DB *servers* if you self-host them.
  'mariadb: local MySQL-compatible server (set DB_TYPE=mysql + DB_URL)'
  'postgresql: local PostgreSQL server (set DB_TYPE=postgres + DB_URL)'
)
source=("${pkgname}-v${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz"
        "${pkgname}.service"
        "${pkgname}.conf"
        "${pkgname}.install"
        "${pkgname}.sysusers"
        "${pkgname}.tmpfiles"
        "${pkgname}-backup.service"
        "${pkgname}-backup.timer")
sha256sums=(
            '8408796dc1c3361092d41882a89f4cc73ce219de6ca05b23f406bf3849f32673'
            '1f5dede1712658ac3e276d83ac4cad541a636c54f084b07d8c7778b8c69bce95'
            '885b68e552440009d1fa8802650ad9af283f3eec641e9c22bd6a505832b0a177'
            '9ea3f6da87f5a204c792c94707423ab657ee1ba0df729a05204f004b3576b75e'
            '355b30e8ae273a87d14bd7afcac367cee0d44f01d57d41eac6747c67d17afb40'
            '6f52d5800aa5cd0c8e5eb5a463fb09711c7460bcf9f6c95a477c3303f37f067c'
            '325e934978093ffd944e0959d7dbda0a2b435ecbc357d5e882cf005ff973e247'
            '2d93e88ae563499ec9c5d51601584e1839681b71c3c30a495e50c851034c3ccb'
)

backup=("etc/${pkgname}/env")
install="${pkgname}.install"

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  # Isolate npm cache to srcdir to avoid polluting the user's ~/.npm/ cache
  # with build artifacts.
  export npm_config_cache="${srcdir}/npm-cache"
  mkdir -p "${npm_config_cache}"

  # Install all dependencies, skip lifecycle scripts (native modules
  # are compiled explicitly in the next step — much faster than letting
  # npm ci compile every transitive native dep during install).
  npm ci --ignore-scripts --include=dev --no-audit --no-fund 2>&1

  # npm >= 12 blocks install-scripts unless approved. Approve only the
  # modules we actually need, then rebuild them so better_sqlite3.node
  # is present at runtime.
  if npm install-scripts --help >/dev/null 2>&1; then
    npm install-scripts approve better-sqlite3 esbuild 2>&1 || true
  fi
  npm rebuild esbuild better-sqlite3 --no-audit --no-fund 2>&1

  # Fail early if the SQLite native binding was not produced.
  if ! find node_modules/better-sqlite3 -name 'better_sqlite3.node' | grep -q .; then
    echo "ERROR: better_sqlite3.node missing after rebuild" >&2
    # Fallback: direct node-gyp rebuild inside the package
    if [ -d node_modules/better-sqlite3 ]; then
      (cd node_modules/better-sqlite3 && npm run build-release 2>&1 || npx --yes node-gyp rebuild --release 2>&1 || true)
    fi
  fi
  if ! find node_modules/better-sqlite3 -name 'better_sqlite3.node' | grep -q .; then
    echo "ERROR: better_sqlite3.node still missing" >&2
    exit 1
  fi

  # Build frontend (Vite) and backend (TypeScript)
  # desktop:icons step skipped — the icon files are already in the source tarball.
  npx vite build --config vite.config.ts 2>&1
  npm run build:server 2>&1

  # Strip devDependencies — production only
  npm prune --omit=dev --no-audit --no-fund 2>&1

  # Clean up build artifacts
  rm -rf node_modules/.cache
  find node_modules -type f \( -name '*.map' -o -name '*.d.ts' -o -name '*.test.*' \) -delete 2>/dev/null || true
  find node_modules -type d -name 'test' -prune -exec rm -rf {} + 2>/dev/null || true
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  _destdir="${pkgdir}/usr/share/${pkgname}"

  install -d "${_destdir}"
  install -d "${pkgdir}/usr/lib/systemd/system"
  install -d "${pkgdir}/etc/${pkgname}"
  install -d "${pkgdir}/var/lib/${pkgname}"

  # Copy built application — dist/server (backend), dist/web (frontend), dist/desktop
  cp -a dist "${_destdir}/"
  cp -a node_modules "${_destdir}/"
  cp package.json "${_destdir}/"
  cp -a drizzle "${_destdir}/" 2>/dev/null || true

  # Install systemd service and config
  install -Dm644 "${srcdir}/${pkgname}.service" "${pkgdir}/usr/lib/systemd/system/${pkgname}.service"
  install -Dm644 "${srcdir}/${pkgname}-backup.service" "${pkgdir}/usr/lib/systemd/system/${pkgname}-backup.service"
  install -Dm644 "${srcdir}/${pkgname}-backup.timer" "${pkgdir}/usr/lib/systemd/system/${pkgname}-backup.timer"
  install -Dm644 "${srcdir}/${pkgname}.conf" "${pkgdir}/etc/${pkgname}/env"

  # Install sysusers and tmpfiles for automatic user/directory creation
  install -Dm644 "${srcdir}/${pkgname}.sysusers" "${pkgdir}/usr/lib/sysusers.d/${pkgname}.conf"
  install -Dm644 "${srcdir}/${pkgname}.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/${pkgname}.conf"

  # Create a symlink in /usr/bin for convenience
  mkdir -p "${pkgdir}/usr/bin"
  cat > "${pkgdir}/usr/bin/${pkgname}" << SCRIPT
#!/bin/sh
exec /usr/bin/node /usr/share/${pkgname}/dist/server/index.js "\$@"
SCRIPT
  chmod +x "${pkgdir}/usr/bin/${pkgname}"

  # Fix permissions
  chmod -R a+rX "${_destdir}"
  chmod 755 "${_destdir}/node_modules/.bin"/* 2>/dev/null || true

  # Strip build intermediate files that embed $srcdir paths
  find "${_destdir}" -type f \( -name '*.mk' -o -name 'Makefile' -o -name '*.d' \
    -o -name 'config.gypi' -o -name '*.o' -o -name '*.obj' -o -name '*.intermediate' \) -delete 2>/dev/null || true
  # also remove path leak from package.json metadata
  find "${_destdir}" -name package.json -print0 | xargs -r -0 sed -i '/_where/d' 2>/dev/null || true

  # Ensure data directory is writable by the service user
  chmod 755 "${pkgdir}/var/lib/${pkgname}"
}

