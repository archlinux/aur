# Maintainer: Mohamed Amine Zghal (medaminezghal) <medaminezghal at outlook dot com>

_name=pytest-asyncio-concurrent
pkgname=python-$_name
pkgver=0.5.2
pkgrel=1
pkgdesc='Pytest plugin to execute python async tests concurrently.'
arch=('any')
url='https://github.com/czl9707/pytest-asyncio-concurrent'
license=('MIT')
depends=('python' 'python-pytest')
makedepends=('python-setuptools' 'python-build' 'python-installer' 'python-wheel')
checkdepends=('python-pytest' 'python-pytest-asyncio')
source=("$url/archive/refs/tags/$pkgver.tar.gz"
        "python314-event-loop.patch")
sha256sums=('63ee2f8313e3cb6e7421221a6acc06b33fe2f597c192ca2d49fb586f36ab9278'
            'dc481f6b4da3aad4a07317846e08beb3263f600f17f38d94d762d30b16f9d15a')

prepare() {
  cd "$srcdir/$_name-$pkgver"
  patch -Np1 -i ../python314-event-loop.patch
}

build() {
  cd "$srcdir"/$_name-$pkgver
  python -m build --wheel --no-isolation
}

check() {
  local pytest_options=(
    -vv
    --disable-warnings
  )
  cd "$srcdir"/$_name-$pkgver
  PYTHONPATH=$PWD pytest "${pytest_options[@]}" tests
}

package() {
  cd "$srcdir"/$_name-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
}
