# Maintainer: David Runge <dvzrv@archlinux.org>

_name=pytzdata
pkgname=python-pytzdata
pkgver=2019.3
pkgrel=1
pkgdesc="Official timezone database for Python."
arch=('any')
url="https://github.com/sdispater/pytzdata"
license=('MIT')
depends=('python')
makedepends=('python-dephell')
checkdepends=('python-pytest')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/sdispater/${_name}/archive/${pkgver}.tar.gz")
sha512sums=('75f212712794e3931592cc47cb636c908cee1d5cbb85d703aaadaaa4b9dd096c6b7f1205f3783b71bacc4477d68d39c13ea9f9027a39924e706c140047ed5585')

prepare() {
  mv -v "${_name}-$pkgver" "$pkgname-$pkgver"
  cd "$pkgname-$pkgver"
  dephell deps convert --from pyproject.toml --to setup.py
}

build() {
  cd "$pkgname-$pkgver"
  python setup.py build
}

check() {
  cd "$pkgname-$pkgver"
  export PYTHONPATH="build:${PYTHONPATH}"
  pytest -v
}

package() {
  cd "$pkgname-$pkgver"
  python setup.py install --skip-build \
    --optimize=1 \
    --prefix=/usr \
    --root="${pkgdir}"
  install -vDm 644 README.rst -t "${pkgdir}/usr/share/doc/${pkgname}"
  install -vDm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
