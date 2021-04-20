# Maintainer: Kaizhao Zhang <zhangkaizhao@gmail.com>

pkgname=pyright
pkgver=1.1.131
pkgrel=1
pkgdesc="Type checker for the Python language"
arch=('any')
url="https://github.com/microsoft/pyright"
license=('MIT')
depends=('nodejs>=12')
makedepends=('npm')
provides=('pyright' 'pyright-langserver')
source=(
  "${url}/archive/${pkgver}.tar.gz"
)
sha256sums=(
  '5dc08a480c1c631b9bd6d1b2ee8a74ae6f48cdcf17bb0552952f92a3cb22c8ec'
)

prepare() {
  rm -rf "${pkgdir}/usr/lib/node_modules/${pkgname}"
}

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  npm install
  cd "${srcdir}/${pkgname}-${pkgver}/packages/pyright/"
  npm run build
}

package() {
  install -d "${pkgdir}/usr/bin"
  install -d "${pkgdir}/usr/lib/node_modules/${pkgname}"
  install -d "${pkgdir}/usr/share/doc/${pkgname}"
  install -d "${pkgdir}/usr/share/licenses/${pkgname}"

  cd "${srcdir}/${pkgname}-${pkgver}/packages/pyright/"

  cp -r dist "${pkgdir}/usr/lib/node_modules/${pkgname}/dist"
  install -Dm755 index.js "${pkgdir}/usr/lib/node_modules/${pkgname}/index.js"
  install -Dm755 langserver.index.js "${pkgdir}/usr/lib/node_modules/${pkgname}/langserver.index.js"
  ln -s "/usr/lib/node_modules/${pkgname}/index.js" "${pkgdir}/usr/bin/pyright"
  ln -s "/usr/lib/node_modules/${pkgname}/langserver.index.js" "${pkgdir}/usr/bin/pyright-langserver"

  cd "${srcdir}/${pkgname}-${pkgver}"

  install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -Dm644 CONTRIBUTING.md "${pkgdir}/usr/share/doc/${pkgname}/CONTRIBUTING.md"
  cp -r docs "${pkgdir}/usr/share/doc/${pkgname}/docs"
  install -Dm644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt"
}

# vim:set ts=2 sw=2 et:
