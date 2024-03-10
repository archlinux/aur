# Maintainer: Marco Rubin <marco.rubin@protonmail.com>
# Contributor: Sachin Krishnan T V <sachu92@gmail.com>
# Contributor: ZWindL <zwindl@protonmail.com>

_name=gdbgui
pkgname=python-$_name
pkgver=0.15.2.0
pkgrel=2
pkgdesc="Browser-based frontend to gdb. Debug C, C++, Go, or Rust."
arch=('any')
url='https://www.gdbgui.com'
license=('GPL')
depends=('python>=3.6'
         'python-brotli'
         'python-gevent'
         'python-gevent-websocket'
         'python-flask'
         'python-flask-compress>1.10'
         'python-flask-socketio>5.3'
         'python-pygdbmi>=0.10.0.2'
         'python-pygments>=2.2.0')
makedepends=(python-build python-installer python-setuptools python-wheel yarn)
checkdepends=(python-nox python-pytest python-pytest-cov)
source=("https://github.com/cs01/gdbgui/archive/$pkgver.tar.gz")
b2sums=('ffdce1923aead7d5cf202aa6954bbedcfa55cb27351b7635dd9636a8b398e4d9d8baa1c59789ba47e80ae581fa6510cae2017d0639cc7f9137d8ce5e0324172b')

prepare() {
    cd $_name-$pkgver
    yarn install # download dependencies
}

build() {
    cd $_name-$pkgver
    yarn build
    python -m build --wheel --no-isolation
}

check() {
    cd $_name-$pkgver
    nox -s python_tests
    nox -s js_tests
}

package() {
    cd $_name-$pkgver
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
