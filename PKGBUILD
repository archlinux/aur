# Contributor: Felix Yan <felixonmars@archlinux.org>

_name=memory_profiler
pkgname=python-memory-profiler
pkgver=0.61
pkgrel=4
pkgdesc="A module for monitoring memory usage of a python program"
url="https://github.com/pythonprofilers/memory_profiler"
license=('BSD')
arch=('any')
depends=('python-psutil')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
checkdepends=('python-numpy')
optdepends=('python-numpy: for mprof')
source=("https://github.com/pythonprofilers/memory_profiler/archive/v$pkgver/$pkgname-$pkgver.tar.gz"
	"https://github.com/pythonprofilers/memory_profiler/commit/940aa76f5da8b7cba5938f17990da054e013de0a.patch"
        "remove-test_async.py.patch")
b2sums=('418ae6e7433dd58b00c8706209a7172c31ccf57d74255aa670b271bc9d76b339bd582b48886bed7b53062abd8eb421678c911b3495de4d541b949f340aad7091'
        '8d8e71a5ccde70a61102f4cebc15db33b88dbbd22c351fdc6595519c6aa169e1436331b119cebe41dda6b020ff963a343c62420b7215f262c0caa68d8df89f6a'
        '9925807075d96a8f709cf8a4a55fea7d2e4a822a29210f5680c32e8e30db0c6e4dad7d79f7ece8bb22edad0d587823ae37ee06dde4710e0375ebaf013336f221')

prepare() {
  cd $_name-$pkgver
   patch -p1 -i ../940aa76f5da8b7cba5938f17990da054e013de0a.patch
   patch -p1 -i ../remove-test_async.py.patch
}

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
