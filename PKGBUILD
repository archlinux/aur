# Maintainer: David Runge <dvzrv@archlinux.org>

_name=pytzdata
pkgname=python-pytzdata
pkgver=2020.1
pkgrel=3
pkgdesc="Official timezone database for Python."
arch=('any')
url="https://github.com/sdispater/pytzdata"
license=('MIT')
depends=('python')
makedepends=('python-cleo' 'python-dephell')
checkdepends=('python-pytest')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/sdispater/${_name}/archive/${pkgver}.tar.gz")
sha512sums=('fd154bfbe90ce07a90f769063b772234036d2627c1e6d78a465d9ddbc894e50cb9d821c04ebff1a7cc6a327266f7843fe54e5592d37c41db023329d6e0f668c2')
b2sums=('6f07a7577edc87030fd70e720b32146e9044a8c6f74d0bafb9239ad666d0d6fd0ac7c3cca070914701af301b1a3368ace2985f8169b9747937fa6ed066be7302')

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
  local python_version=$(python -c 'import sys; print(".".join(map(str, sys.version_info[:2])))')
  python setup.py install --skip-build \
    --optimize=1 \
    --prefix=/usr \
    --root="${pkgdir}"
  cp -av ${_name}/zoneinfo/* \
    "${pkgdir}/usr/lib/python${python_version}/site-packages/${_name}/zoneinfo/"
  install -vDm 644 README.rst -t "${pkgdir}/usr/share/doc/${pkgname}"
  install -vDm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
