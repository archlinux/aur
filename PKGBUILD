pkgname=trick-or-treat-git
pkgver=1.5.r0.g1d61076
pkgrel=1
pkgdesc="WebSocket-based virtual private network"
url="https://github.com/lanthora/trick-or-treat"
license=('MIT')
arch=('x86_64' 'aarch64' 'armv7h' 'riscv64')
source=("$pkgname::git+https://github.com/lanthora/trick-or-treat.git" )
sha256sums=('SKIP')
makedepends=('cmake' 'make' 'pkgconf')
depends=('spdlog' 'openssl' 'libconfig' 'ixwebsocket' 'uriparser')
conflicts=('trick-or-treat')
backup=('etc/candy.conf')

pkgver() {
        cd "$pkgname"
        git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
        cd "$pkgname/build"
        cmake -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release ..
        make
}

package() {
        cd "$pkgname"
        install -D -m 644 candy.conf "$pkgdir/etc/candy.conf"
        install -D -m 644 candy.service "$pkgdir/usr/lib/systemd/system/candy.service"
        cd build
        make DESTDIR="$pkgdir/" install
}
