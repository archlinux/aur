# Maintainer: Yakov Till <yakov.till@gmail.com>

pkgname=chrome-devtools-axi
pkgver=0.1.15
pkgrel=1
pkgdesc="AXI-compliant chrome-devtools-mcp wrapper with contextual suggestions"
arch=('any')
url="https://github.com/kunchenguid/chrome-devtools-axi"
license=('MIT')
depends=('nodejs' 'chrome-devtools-mcp')
makedepends=('npm')
options=('!debug')
source=(
  "${pkgname}-${pkgver}.tgz::https://registry.npmjs.org/${pkgname}/-/${pkgname}-${pkgver}.tgz"
  "${pkgname}-runtime.patch"
)
sha512sums=('fcb639c0b1028a4476782e1cde60bc2a4e7fe9a85e161db46d5ab46c3f7a54b3c85cf3fe9d8b6f1aff552209733930299a3809f12f40e4ee84726c252056d642'
            '2433d630f4f7f20d141dd3753f151de4bd61301e8ed5bbbd384151874bf67c7a972f734d6a7b55596da07bfdb52f40fc5cf588685e10ba792a737e6258a9c843')

latestver() {
  curl -fsSL "https://registry.npmjs.org/${pkgname}/latest" | jq -r '.version'
}

prepare() {
  cd "${srcdir}/package"

  patch -Np1 -i "${srcdir}/${pkgname}-runtime.patch"
}

build() {
  cd "${srcdir}/package"
  npm install --cache "${srcdir}/npm-cache" --omit=dev --ignore-scripts
}

package() {
  local node_root="${pkgdir}/usr/lib/node_modules/${pkgname}"

  install -dm755 "${pkgdir}/usr/lib/node_modules"
  cp -a "${srcdir}/package" "${node_root}"
  chmod 755 "${node_root}/dist/bin/chrome-devtools-axi.js"

  install -dm755 "${pkgdir}/usr/bin"
  ln -s "../lib/node_modules/${pkgname}/dist/bin/chrome-devtools-axi.js" "${pkgdir}/usr/bin/${pkgname}"

  install -Dm644 "${node_root}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
