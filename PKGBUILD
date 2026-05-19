pkgname=gitnexus
pkgver=1.6.5
pkgrel=1
pkgdesc='Zero-server code intelligence engine for exploring repositories as a knowledge graph'
arch=('x86_64' 'aarch64')
url='https://github.com/abhigyanpatwari/GitNexus'
license=('PolyForm-Noncommercial-1.0.0')
depends=('nodejs>=22')
makedepends=('npm')
options=('!strip')

_upstream=GitNexus

source=(
  "${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz"
)
sha256sums=('731bfb2928166c361005f508f21d82100f68d47d1b793f8b5a1b327a9bcf8e06')

prepare() {
  local _root="${srcdir}/${_upstream}-${pkgver}"
  local _src="${_root}/gitnexus"

  cd "$_src"

  # Prevent npm ci from running the package build too early.
  node -e '
    const fs = require("node:fs");
    const pkg = JSON.parse(fs.readFileSync("package.json", "utf8"));
    delete pkg.scripts.prepare;
    fs.writeFileSync("package.json", JSON.stringify(pkg, null, 2) + "\n");
  '

  # Upstream build.js runs `npx tsc` from ../gitnexus-shared.
  # Expose gitnexus/node_modules there as well so `npx` can find `tsc`.
  ln -sfn ../gitnexus/node_modules "${_root}/gitnexus-shared/node_modules"
}

build() {
  local _root="${srcdir}/${_upstream}-${pkgver}"
  local _src="${_root}/gitnexus"

  export HOME="${srcdir}/.home"
  export npm_config_cache="${srcdir}/npm-cache"
  export npm_config_userconfig=/dev/null
  export npm_config_audit=false
  export npm_config_fund=false
  export npm_config_production=false
  export npm_config_yes=true
  export CI=true
  export GITNEXUS_SKIP_OPTIONAL_GRAMMARS=1

  mkdir -p "$HOME" "$npm_config_cache"

  cd "$_src"

  npm ci --include=dev
  PATH="$PWD/node_modules/.bin:$PATH" npm run build
  npm prune --omit=dev
}

package() {
  local _src="${srcdir}/${_upstream}-${pkgver}/gitnexus"
  local _moddir="${pkgdir}/usr/lib/node_modules/${pkgname}"

  install -dm755 "$_moddir"

  cp -a \
    "$_src/dist" \
    "$_src/hooks" \
    "$_src/scripts" \
    "$_src/skills" \
    "$_src/vendor" \
    "$_src/web" \
    "$_src/node_modules" \
    "$_src/package.json" \
    "$_moddir/"

  install -dm755 "${pkgdir}/usr/bin"
  cat >"${pkgdir}/usr/bin/${pkgname}" <<'EOF'
#!/bin/sh
exec node /usr/lib/node_modules/gitnexus/dist/cli/index.js "$@"
EOF
  chmod 755 "${pkgdir}/usr/bin/${pkgname}"

  install -Dm644 "${srcdir}/${_upstream}-${pkgver}/LICENSE" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
