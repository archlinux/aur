# Maintainer: Carlo Teubner <carlo.teubner@gmail.com>

# Please note that this package currently tracks branch 'feature/libkickpass'.
# You may wish to change this to track a different branch (e.g., 'master' or
# 'develop').

pkgname=kickpass-git
pkgver=v0.0.0.r220.gfafef62
pkgrel=1
pkgdesc="Stupid simple password safe"
arch=('x86_64' 'i686')
url="http://kickpass.pw/"
license=('MIT')
depends=('libsodium' 'libbsd' 'libevent' 'libx11')
# makedepends=('cmake' 'python' 'python-pexpect' 'check' 'valgrind')
#   'python', 'python-pexpect', 'valgrind' are only needed by the integration
#   tests, which we don't run (see below in 'check()' function).
makedepends=('cmake' 'check')
provides=('kickpass')
conflicts=('kickpass')
source=("git+https://github.com/kickpass/kickpass.git#branch=feature/libkickpass")
sha256sums=('SKIP')

pkgver() {
    cd kickpass
    git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd kickpass
    cmake -DCMAKE_INSTALL_PREFIX=/usr .
    cmake --build .
}

check() {
    cd kickpass
    # ctest  # Running all tests takes a bit long. So run only unit tests:
    ctest -R '^test-unit-.*'
}

package() {
    cd kickpass
    cmake --build . --target install -- DESTDIR="$pkgdir"
}
