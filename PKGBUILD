# Maintainer: David Runge <dvzrv@archlinux.org>

_name=senf
pkgname=python-senf
pkgver=1.5.0
pkgrel=5
pkgdesc="Python module for handling platform native strings"
arch=('any')
url="https://github.com/quodlibet/senf"
license=('MIT')
depends=('python')
makedepends=('python-setuptools')
checkdepends=('python-hypothesis' 'python-pytest')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha512sums=('4a474e3bb7ceae07980e27c4d86240b862ec829e7b73fdf0fb43cfd1529cdff7fa7839fa56c354bb37adc950e848612bfd6e90234c8d4a7c143e302361ac7fe4')

prepare() {
  mv -v "${_name}-${pkgver}" "${pkgname}-${pkgver}"
  cd "$pkgname-$pkgver"
}

build() {
  cd "$pkgname-$pkgver"
  python setup.py build
}

check() {
  cd "$pkgname-$pkgver"
  export PYTHONPATH="build:${PYTHONPATH}"
  # disabling failing tests, that assume a specific user HOME layout:
  # https://github.com/quodlibet/senf/issues/12
  pytest -v -k 'not test_getuserdir and not test_expanduser_user'
}

package() {
  cd "$pkgname-$pkgver"
  python setup.py install --skip-build \
    --optimize=1 \
    --prefix=/usr \
    --root="${pkgdir}"
  install -vDm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -vDm 644 README.rst -t "${pkgdir}/usr/share/doc/${pkgname}"
  install -vDm 644 examples/*.py \
    -t "${pkgdir}/usr/share/doc/${pkgname}/examples"
}
