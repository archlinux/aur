# Maintainer: Yakov Till <yakov.till@gmail.com>

pkgname=chiasmus
pkgver=0.1.19
pkgrel=1
pkgdesc="MCP server for formal verification with Z3, Prolog, and tree-sitter"
arch=('x86_64')
url="https://github.com/yogthos/chiasmus"
license=('Apache-2.0')
depends=('nodejs>=20')
makedepends=('npm')
options=('!debug')
source=("${pkgname}-${pkgver}.tgz::https://registry.npmjs.org/${pkgname}/-/${pkgname}-${pkgver}.tgz")
sha256sums=('44356f0b976c51861ddc46e54afd1181bd662a563a2f6352dd794f0a8752102c')
noextract=("${pkgname}-${pkgver}.tgz")

latestver() {
  curl -s "https://registry.npmjs.org/${pkgname}" | jq -r '."dist-tags".latest'
}

build() {
  npm install --cache "${srcdir}/npm-cache" \
    --prefix "${srcdir}/staging" \
    --global \
    "${srcdir}/${pkgname}-${pkgver}.tgz"
}

package() {
  local node_root="${pkgdir}/usr/lib/node_modules/${pkgname}"

  install -d "${pkgdir}/usr/lib/node_modules"
  cp -a "${srcdir}/staging/lib/node_modules/${pkgname}" "${node_root}"

  install -d "${pkgdir}/usr/bin"
  ln -s "/usr/lib/node_modules/${pkgname}/dist/mcp-server.js" "${pkgdir}/usr/bin/${pkgname}"

  install -Dm644 "${node_root}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  find "${node_root}" -type f -name '*.node' \
    \( -name '*darwin*' -o -name '*win32*' -o -name '*win64*' -o -name '*android*' -o -name '*freebsd*' -o -name '*-musl*' \) \
    -delete 2>/dev/null || true

  find "${node_root}" -type d \( -name darwin-arm64 -o -name darwin-x64 -o -name win32-arm64 -o -name win32-x64 \) \
    -exec rm -rf {} + 2>/dev/null || true

  find "${node_root}" -type d -path '*/linux-arm64' -exec rm -rf {} + 2>/dev/null || true

  find "${node_root}/node_modules/@yogthos/tree-sitter-clojure/build" -mindepth 1 \
    ! -path '*/build/Release' \
    ! -path '*/build/Release/tree_sitter_clojure_binding.node' \
    -delete 2>/dev/null || true

  rm -rf "${node_root}/node_modules/better-sqlite3/build/Release/obj.target"

  find "${node_root}/node_modules/better-sqlite3/build" -type f ! -name '*.node' -delete 2>/dev/null || true
  find "${node_root}/node_modules/better-sqlite3/build" -type d -empty -delete 2>/dev/null || true
}
