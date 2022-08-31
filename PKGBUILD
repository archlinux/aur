# Maintainer: Felix Yan <felixonmars@archlinux.org>

_name=pycapnp
pkgname=python-pycapnp
pkgver=1.1.1
pkgrel=4
pkgdesc="A cython wrapping of the C++ Cap'n Proto library"
url="https://github.com/capnproto/pycapnp"
license=(BSD)
arch=(x86_64)
depends=(capnproto python)
makedepends=(cython python-build python-installer python-pkgconfig python-setuptools python-wheel)
checkdepends=(python-pytest)
source=(https://github.com/capnproto/$_name/archive/v$pkgver/$pkgname-$pkgver.tar.gz)
sha512sums=('649271e5fa64fe4b3c23897f96896b2790b13bca634b07f4d5e155e263ef919615d39daceb8b167918b7e4375b2b2d89df95fb9e78166768591e053b93e54940')

build() {
  cd $_name-$pkgver
  python -m build --wheel --no-isolation
}

check() {
  local _site_packages=$(python -c "import site; print(site.getsitepackages()[0])")

  cd $_name-$pkgver
  python -m installer --destdir=test_dir dist/*.whl
  export PYTHONPATH="test_dir/$_site_packages:$PYTHONPATH"
  pytest -vv
}

package() {
  cd $_name-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl

  install -vDm 644 LICENSE.md -t "$pkgdir"/usr/share/licenses/$pkgname/
}
