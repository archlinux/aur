# Maintainer: Sachin Krishnan T V <sachu92@gmail.com>
# Contributor: ZWindL <zwindl@protonmail.com>

_name='gdbgui'
pkgname=python-gdbgui
pkgver=0.15.1.0
pkgrel=2
pkgdesc="Browser-based frontend to gdb. Debug C, C++, Go, or Rust."
url='https://www.gdbgui.com'
license=('GPL')
depends=('python'
         'python-brotli'
         'python-gevent'
         'python-gevent-websocket'
         'python-flask'
         'python-flask-compress'
         'python-flask-socketio'
         'python-pygdbmi>=0.10.0.0'
         'python-pygments')
makedepends=('python-setuptools' 'yarn')
checkdepends=('python-nox' 'python-pytest' 'python-pytest-cov')
arch=('any')
source=("https://github.com/cs01/gdbgui/archive/v$pkgver.tar.gz")
b2sums=('9076e31eb0b0e19c81e5ec0346baf7c253f2fabdc904936d9b7e4aa7eef6d40989e911b991af5fe64aca07c13aa84a9c93b5216b5b1227c444a528979ae25ba8')

prepare() {
    cd $_name-$pkgver
    yarn install # download dependencies
}

build() {
    cd $_name-$pkgver
    export NODE_OPTIONS=--openssl-legacy-provider # otherwise it fails to build
    yarn build
    python setup.py build
}

check() {
    cd $_name-$pkgver
    nox -s python_tests
    nox -s js_tests
}

package() {
    cd $_name-$pkgver
    python setup.py install --root="$pkgdir" --optimize=1 --skip-build
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
