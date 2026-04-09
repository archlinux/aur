# Maintainer: Yakov Till <yakov.till@gmail.com>

pkgname=chrome-devtools-axi
pkgver=0.1.12
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
sha512sums=('b435f635c3b24433f0dd7f62cba8d868d3bc835758a0dec6291d6d06a67b0963e638aa22efe4f495e89b72a911bc506dd979806eb4a48e33d8b2f42c73ee54e8'
            '5566576a575b6d1933b89f6f541c38b7a53c50137851272c1de165b9ed5d02bcfde791b7aad71e52c951b498f5b5908be5f6923836412ae46344416a9b6645e1')

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
