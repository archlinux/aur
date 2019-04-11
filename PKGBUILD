# Maintainer: Kaizhao Zhang <zhangkaizhao@gmail.com>

pkgname=pyright
pkgver=1.0.10
pkgrel=1
pkgdesc="Type checker for the Python language"
arch=('any')
url="https://github.com/Microsoft/pyright"
license=('MIT')
depends=('nodejs')
makedepends=('npm')
source=(
  "https://github.com/Microsoft/pyright/archive/${pkgver}.tar.gz"
  01-fixed-print-compatible-in-python3.patch
)
sha256sums=(
  '9ba5b4d5697ad1fd84f659b7cf034c8e062a72e43af557a56bb25299394d3149'
  '05fd7c1f123bff3cd507e5a3c2272bef42fa67303aca6a03c9dd79c2626b68bc'
)

prepare() {
  rm -rf "${pkgdir}/usr/lib/node_modules/${pkgname}"

  cd "${srcdir}/${pkgname}-${pkgver}"
  patch -p0 -i ../01-fixed-print-compatible-in-python3.patch
}

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  npm run install:all
  npm run build
}

package() {
  install -d "${pkgdir}/usr/bin"
  install -d "${pkgdir}/usr/lib/node_modules/${pkgname}"
  install -d "${pkgdir}/usr/share/doc/${pkgname}"
  install -d "${pkgdir}/usr/share/licenses/${pkgname}"

  cd "${srcdir}/${pkgname}-${pkgver}"

  cp -r dist "${pkgdir}/usr/lib/node_modules/${pkgname}/dist"
  install -Dm755 index.js "${pkgdir}/usr/lib/node_modules/${pkgname}/index.js"
  ln -s "/usr/lib/node_modules/${pkgname}/index.js" "${pkgdir}/usr/bin/pyright"

  install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -Dm644 CONTRIBUTING.md "${pkgdir}/usr/share/doc/${pkgname}/CONTRIBUTING.md"
  cp -r docs "${pkgdir}/usr/share/doc/${pkgname}/docs"
  install -Dm644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt"
}

# vim:set ts=2 sw=2 et:
