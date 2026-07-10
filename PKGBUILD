pkgname=gitnexus
pkgver=1.6.9
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
sha256sums=('468138d074bb1c3bf4c0094a813d426a2146510d13a5f747c51b950a1f877c90')

build() {
  local _root="${srcdir}/${_upstream}-${pkgver}"
  local _shared="${_root}/gitnexus-shared"
  local _src="${_root}/gitnexus"

  export HOME="${srcdir}/.home"
  export npm_config_cache="${srcdir}/npm-cache"
  export npm_config_userconfig=/dev/null
  export npm_config_audit=false
  export npm_config_fund=false
  export npm_config_yes=true
  export npm_config_ignore_scripts=false
  export CI=true

  unset GITNEXUS_SKIP_OPTIONAL_GRAMMARS
  unset npm_config_production NPM_CONFIG_PRODUCTION

  mkdir -p "$HOME" "$npm_config_cache"

  cd "$_shared"
  npm install
  npm run build

  cd "$_src"

  npm ci --include=dev --include=optional
  PATH="$PWD/node_modules/.bin:$PATH" npm run build

  npm prune --omit=dev --include=optional

  node node_modules/@ladybugdb/core/install.js

  local _lbug
  _lbug="$(find node_modules/@ladybugdb/core -type f -name 'lbugjs.node' -print -quit)"
  if [[ -z "$_lbug" ]]; then
    echo "error: LadybugDB native binary lbugjs.node was not installed" >&2
    exit 1
  fi

  echo "Found LadybugDB native binary: $_lbug"
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

export GITNEXUS_LBUG_EXTENSION_INSTALL="${GITNEXUS_LBUG_EXTENSION_INSTALL:-auto}"
exec node /usr/lib/node_modules/gitnexus/dist/cli/index.js "$@"
EOF
  chmod 755 "${pkgdir}/usr/bin/${pkgname}"

  install -Dm644 "${srcdir}/${_upstream}-${pkgver}/LICENSE" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
