# Maintainer: Marco Rubin <marco.rubin@protonmail.com>
# Contributor: Sachin Krishnan T V <sachu92@gmail.com>
# Contributor: ZWindL <zwindl@protonmail.com>

_name=gdbgui
pkgname=python-$_name
pkgver=0.15.3.0
pkgrel=3
pkgdesc="Browser-based frontend to gdb. Debug C, C++, Go, or Rust."
arch=('any')
url='https://www.gdbgui.com'
license=('GPL')
depends=('python>=3.13'
         'python-brotli'
         'python-gevent'
         'python-gevent-websocket'
         'python-flask'
         'python-flask-compress>1.10'
         'python-flask-socketio>5.3'
         'python-pygdbmi>=0.10.0.2'
         'python-pygments>=2.2.0')
makedepends=(python-build python-installer python-setuptools python-wheel yarn)
checkdepends=(python-greenlet python-nox python-pytest python-pytest-cov)
source=("https://github.com/cs01/gdbgui/archive/$pkgver.tar.gz")
b2sums=('06015f5a5d6d51d83eace9be492869898a4f35cc43c4e99459cc42490b5b66a3beea8123b7afb3aa4edd2ed7f47652abcc368f625c43337d7676e079b3120faa')

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
