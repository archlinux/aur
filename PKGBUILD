# Maintainer: David Runge <dvzrv@archlinux.org>

_name=senf
pkgname=python-senf
pkgver=1.4.1
pkgrel=1
pkgdesc="Python module for handling platform native strings"
arch=('any')
url="https://github.com/quodlibet/senf"
license=('MIT')
depends=('python')
checkdepends=('python-hypothesis' 'python-pytest')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha512sums=('2362c0c9572135bb5394c077385388b887a431d79f6b190c0444a4d0cf52580e79f71f2825a697ec71e1453f6d7d36d713708728f4572ce5955806e45cae2ce0')

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
