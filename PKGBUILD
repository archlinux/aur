# Maintainer: Felix Yan <felixonmars@archlinux.org>

_name=memory_profiler
pkgname=python-memory-profiler
pkgver=0.61
pkgrel=3
pkgdesc="A module for monitoring memory usage of a python program"
url="https://github.com/pythonprofilers/memory_profiler"
license=('BSD')
arch=('any')
depends=('python-psutil')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
checkdepends=('python-numpy')
optdepends=('python-numpy: for mprof')
source=("https://github.com/pythonprofilers/memory_profiler/archive/v$pkgver/$pkgname-$pkgver.tar.gz")
sha512sums=('02c70a049107ad4df635e20e22eaaa91fd4e4fd29690b0a7c314e08ed6e076bbb81f85dd97924ed35f7f0133cfd3c7e55b35400449489733beb172debe592c4e')
b2sums=('418ae6e7433dd58b00c8706209a7172c31ccf57d74255aa670b271bc9d76b339bd582b48886bed7b53062abd8eb421678c911b3495de4d541b949f340aad7091')

build() {
  cd $_name-$pkgver
  python -m build --wheel --no-isolation
}

check() {
  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")

  cd $_name-$pkgver
  # install to temporary location, as importlib is used
  python -m installer --destdir=test_dir dist/*.whl
  export PYTHONPATH="test_dir/$site_packages:$PYTHONPATH"
  export PATH="$PWD/test_dir/usr/bin:$PATH"
  make test
}

package() {
  cd $_name-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -vDm644 COPYING -t "$pkgdir"/usr/share/licenses/$pkgname/
}
