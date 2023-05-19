pkgname=candy-git
pkgver=1.10.r1.g10721db
pkgrel=1
pkgdesc="A WebSocket and TUN based VPN for Linux"
url="https://github.com/lanthora/candy"
license=('MIT')
arch=('x86_64' 'aarch64' 'armv7h' 'riscv64')
source=("$pkgname::git+https://github.com/lanthora/candy.git" )
sha256sums=('SKIP')
makedepends=('cmake' 'make' 'pkgconf' 'clang')
depends=('spdlog' 'openssl' 'libconfig' 'uriparser')
conflicts=('candy')
backup=('etc/candy.conf')

pkgver() {
        cd "$pkgname"
        git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
        cd "$pkgname/build"
        cmake -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release -DUSE_TLS=1 ..
        make
}

package() {
        cd "$pkgname"
        install -D -m 600 candy.conf "$pkgdir/etc/candy.conf"
        install -D -m 644 candy.service "$pkgdir/usr/lib/systemd/system/candy.service"
        install -D -m 644 candy@.service "$pkgdir/usr/lib/systemd/system/candy@.service"
        cd build
        make DESTDIR="$pkgdir/" install
}
