# Maintainer: Mohamed Amine Zghal (medaminezghal) <medaminezghal at outlook dot com>

_name=asgi-lifespan
pkgname=python-$_name
pkgver=2.1.0
pkgrel=5
pkgdesc='Programmatic startup/shutdown of ASGI apps.'
arch=('any')
license=('MIT')
url='https://github.com/florimondmanca/asgi-lifespan'
depends=('python' 'python-sniffio')
makedepends=('python-setuptools' 'python-setuptools-scm' 'python-build' 'python-installer' 'python-wheel')
checkdepends=('python-attrs' 'python-pytest' 'python-pytest-asyncio'  'python-pytest-trio' 'python-starlette' 'python-trio' 'python-httpx')
source=("$url/archive/refs/tags/$pkgver.tar.gz"
        "fix-tests.patch")
sha256sums=('6e541007c546d35e91d4eb9b353fec8f921386cd5ca1fddac5380616ac1e42dc'
            '84a5434e40b64f0d599973e24c5d7638eaf0c3993154e80bd09182ca8416021d')

prepare() {
  cd "$srcdir"/$_name-$pkgver
  patch -Np1 -i ../fix-tests.patch
}

build() {
  cd "$srcdir"/$_name-$pkgver
  python -m build --wheel --no-isolation
} 

check() {
  local pytest_options=(
    -vv
    --disable-warnings
    -o "addopts="
  )
  cd "$srcdir"/$_name-$pkgver
  PYTHONPATH=$PWD/src pytest "${pytest_options[@]}" tests
}

package_python-asgi-lifespan() {
  cd "$srcdir"/$_name-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
}
