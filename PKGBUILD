# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-pycapnp
pkgver=1.1.1
pkgrel=1
pkgdesc="A cython wrapping of the C++ Cap'n Proto library"
url="https://github.com/capnproto/pycapnp"
license=('BSD')
arch=('x86_64')
depends=('capnproto' 'python')
makedepends=('cython' 'python-build' 'python-installer' 'python-pkgconfig' 'python-setuptools' 'python-wheel')
checkdepends=('python-pytest')
source=("https://github.com/capnproto/pycapnp/archive/v$pkgver/$pkgname-$pkgver.tar.gz")
sha512sums=('649271e5fa64fe4b3c23897f96896b2790b13bca634b07f4d5e155e263ef919615d39daceb8b167918b7e4375b2b2d89df95fb9e78166768591e053b93e54940')

build() {
  cd pycapnp-$pkgver
  python -m build --wheel --no-isolation
}

check() {
  local python_version=$(python -c 'import sys; print(".".join(map(str, sys.version_info[:2])))')

  cd pycapnp-$pkgver
  PYTHONPATH="build/lib.linux-$CARCH-$python_version" pytest
}

package() {
  cd pycapnp-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl

  install -Dm644 LICENSE.md -t "$pkgdir"/usr/share/licenses/$pkgname/
}
