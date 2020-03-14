# Maintainer: David Runge <dvzrv@archlinux.org>

_name=pytest-html
pkgname=python-pytest-html
pkgver=2.1.0
pkgrel=2
pkgdesc="Plugin for generating HTML reports for pytest results"
arch=('any')
url="https://github.com/pytest-dev/pytest-html"
license=('MPL2')
depends=('python-pytest' 'python-pytest-metadata')
makedepends=('python-setuptools-scm')
checkdepends=('python-ansi2html' 'python-pytest-mock'
'python-pytest-rerunfailures' 'python-pytest-xdist')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha512sums=('be63a6d6c2ade9a9b83492a961d1c2cd5e0b8dfbbd5ef6a8fd4b0af46d1e3bed2bd48e93154f2a0ad5dda6681f6afc3c29ed626a81aad8d82ed15178fb21bd82')

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
