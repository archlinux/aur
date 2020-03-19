# Maintainer: David Runge <dvzrv@archlinux.org>

_name=pytest-html
pkgname=python-pytest-html
pkgver=2.1.1
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
sha512sums=('a35eb141d90b82e713e11b022a788adb9f097910dd267f207afdf3b6fc06f40fc6ca308e70098d7aa48d866aad8495aad25bbf566c301f789749f1791a7fa802')

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
