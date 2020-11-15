# Maintainer: David Runge <dvzrv@archlinux.org>

_name=pytest-html
pkgname=python-pytest-html
pkgver=3.0.0
pkgrel=1
pkgdesc="Plugin for generating HTML reports for pytest results"
arch=('any')
url="https://github.com/pytest-dev/pytest-html"
license=('MPL2')
depends=('python-pytest' 'python-pytest-metadata')
makedepends=('python-setuptools-scm')
checkdepends=('python-ansi2html' 'python-pytest-mock'
'python-pytest-rerunfailures' 'python-pytest-xdist')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha512sums=('1db78a0ec3114da9b2268fab37935349063d67f18a473939979499ddf8b1b228b9c879ce1fe2c1740166c63be56edbc4f8de8e9878790954426d344525dbc55f')

prepare() {
  mv -v "${_name}-${pkgver}" "$pkgname-$pkgver"
}

build() {
  cd "$pkgname-$pkgver"
  python setup.py build
}

check() {
  cd "$pkgname-$pkgver"
  export PYTHONPATH="build:${PYTHONPATH}"
  pytest -v -k 'not test_environment_xdist and not test_css'
}

package() {
  cd "$pkgname-$pkgver"
  python setup.py install --skip-build \
    --optimize=1 \
    --prefix=/usr \
    --root="${pkgdir}"
  install -vDm 644 {CHANGES,README}.rst -t "${pkgdir}/usr/share/doc/${pkgname}"
}
