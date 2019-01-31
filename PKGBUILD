# Maintainer: misson20000 <xenotoad at xenotoad dot n e t>
pkgname=twib-git
pkgver=r75.ea97589
pkgrel=1
pkgdesc="Twili debug monitor bridge client and daemon"
arch=("any")
url="https://github.com/misson20000/twili"
license=("GPL3")
depends=("libusb" "systemd")
makedepends=("git" "gcc" "cmake" "make")
provides=("twib")
source=("git+https://github.com/misson20000/twili.git")
md5sums=("SKIP")
install="twib.install"

pkgver() {
    cd "$srcdir/twili"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    cd "$srcdir/twili"
    git submodule update --init --recursive
}

build() {
    cd "$srcdir/twili/twib"
    mkdir build
    cd build
    cmake -G "Unix Makefiles" .. -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr -DWITH_SYSTEMD=ON
    make
}

package() {
    cd "$srcdir/twili/twib/build"
    make DESTDIR="$pkgdir/" install
}
