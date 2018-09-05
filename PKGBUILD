# Maintainer: Daniel Moch <daniel@danielmoch.com>
pkgname=nncli
pkgver=0.2.0
pkgrel=2
pkgdesc="NextCloud Notes Command Line Interface"
arch=('any')
url="https://github.com/djmoch/${pkgname}"
license=('MIT')
depends=('python' 'python-urwid' 'python-requests' 'python-appdirs')
makedepends=('python-pip' 'flit' 'python-sphinx' 'gzip')
source=("${pkgname}-${pkgver}.tar.gz::https://files.pythonhosted.org/packages/source/${pkgname::1}/${pkgname}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('f6264b49937eeaf8861829dd8b071c73923066b5ecff9cfb29f3784ed9524667')

build()
{
  cd "${srcdir}/${pkgname}-${pkgver}"
  flit build --format wheel
  cd "${srcdir}/${pkgname}-${pkgver}/docs"
  sphinx-build -M man source build
  gzip build/man/nncli.1
}

package()
{
  cd "${srcdir}/${pkgname}-${pkgver}"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 docs/build/man/nncli.1.gz "${pkgdir}/usr/share/man/man1/nncli.1.gz"
  pip install -I --no-warn-script-location --isolated --no-deps --compile --root="${pkgdir}" dist/${pkgname}-${pkgver}-py3-none-any.whl
}

# vim: ft=PKGBUILD sts=2 sw=2 et
