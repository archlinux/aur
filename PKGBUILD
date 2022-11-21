# Maintainer: David Runge <dvzrv@archlinux.org>

_name=pytest-vcr
pkgname=python38-pytest-vcr
pkgver=1.0.2
pkgrel=6
pkgdesc="Py.test plugin for managing VCR.py cassettes"
arch=('any')
url="https://github.com/ktosiek/pytest-vcr"
license=('MIT')
depends=('python38-pytest' 'python38-vcrpy')
makedepends=('python38-setuptools')
checkdepends=('python38-coverage' 'python38-pytest')
# the pypi sdist for 1.0.2 doesn't have the tests (yet)
# https://github.com/ktosiek/pytest-vcr/issues/26
# source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
source=("${_name}-${pkgver}.tar.gz::https://github.com/ktosiek/${_name}/archive/${pkgver}.tar.gz")
sha512sums=('29dceb51092d73f2190b89e82e88b59506591a35cfe4f141bb877c05420d67a8ab2f21f63c2630972c35697d01b242891917d1be19b14fdfa810c1799f8542c2')

prepare() {
  mv -v "${_name}-${pkgver}" "$pkgname-$pkgver"
  cd "$pkgname-$pkgver"
  sed -e '/pytest.config/d' -i tests/test_vcr.py
}

build() {
  cd "$pkgname-$pkgver"
  python3.8 setup.py build
}

check() {
  cd "$pkgname-$pkgver"
  local python_stdlib_basepath="$(python3.8 -m "from sysconfig import get_path; print(get_path('stdlib'))")"
  # Hack entry points by installing it
  python3.8 setup.py install --root="${PWD}/tmp_install" --optimize=1
  export PYTHONPATH="${PWD}/tmp_install/${python_stdlib_basepath/\//}/site-packages:${PYTHONPATH}:${PWD}/tests"
  pytest -v
}

package() {
  cd "$pkgname-$pkgver"
  python3.8 setup.py install --skip-build \
    --optimize=1 \
    --prefix=/usr \
    --root="${pkgdir}"
  install -vDm 644 README.rst -t "${pkgdir}/usr/share/doc/${pkgname}"
  install -vDm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
