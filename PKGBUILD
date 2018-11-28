# Maintainer: Daniel Moch <daniel@danielmoch.com>
pkgname=nncli
pkgver=0.3.1
pkgrel=1
pkgdesc="NextCloud Notes Command Line Interface"
arch=('any')
url="https://nncli.org"
license=('MIT')
depends=('python'
         'python-urwid'
         'python-requests'
         'python-appdirs'
         'python-click')
makedepends=('python-pip' 'flit' 'python-sphinx')
checkdepends=('python-pytest'
              'python-pytest-cov'
              'python-pytest-mock'
              'python-pylint'
              'python-mock')
source=("${pkgname}-${pkgver}.tar.gz::https://files.pythonhosted.org/packages/source/${pkgname::1}/${pkgname}/${pkgname}-${pkgver}.tar.gz"
        "${pkgname}-${pkgver}.tar.gz.asc::https://files.pythonhosted.org/packages/source/${pkgname::1}/${pkgname}/${pkgname}-${pkgver}.tar.gz.asc")
validpgpkeys=('72A97F7072DDCE28058DEF30323C9F1784BDDD43')
sha256sums=('df2f6a857f86fe69da0d59d4c8dc40a5457ffd81ab7496dbbd06f106b9a431d3'
            'SKIP')

build()
{
  cd "${srcdir}/${pkgname}-${pkgver}"
  flit build --format wheel
  cd "${srcdir}/${pkgname}-${pkgver}/docs"
  sphinx-build -M man source build
}

check()
{
  cd "${srcdir}/${pkgname}-${pkgver}"
  python -m pytest
}

package()
{
  cd "${srcdir}/${pkgname}-${pkgver}"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 docs/build/man/nncli.1 "${pkgdir}/usr/share/man/man1/nncli.1"
  pip install -I --no-warn-script-location --isolated --no-deps --compile --root="${pkgdir}" dist/${pkgname}-${pkgver}-py3-none-any.whl
}

# vim: ft=PKGBUILD sts=2 sw=2 et
