# Maintainer: Daniel Moch <daniel@danielmoch.com>
pkgname=nncli
pkgver=0.3.4
pkgrel=2
pkgdesc="NextCloud Notes Command Line Interface"
arch=('any')
url="https://nncli.org"
license=('MIT' 'BSD')
depends=('python'
         'python-urwid'
         'python-requests'
         'python-appdirs'
         'python-click')
makedepends=('python-pip' 'flit' 'python-sphinx' 'python-sphinx-sitemap' 'git')
checkdepends=('python-pytest'
              'python-pytest-cov'
              'python-pytest-mock'
              'python-pylint'
              'python-mock')
source=("${pkgname}-${pkgver}::git://git.danielmoch.com/nncli.git#tag=v${pkgver}")
sha256sums=('SKIP')

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
