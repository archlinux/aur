pkgname=candy
pkgver=2.1
pkgrel=1
pkgdesc="A WebSocket and TUN based VPN for Linux"
url="https://github.com/lanthora/candy"
license=('MIT')
arch=('x86_64' 'aarch64' 'armv7h' 'riscv64')
source=("https://github.com/lanthora/candy/archive/refs/tags/v$pkgver.tar.gz" )
sha256sums=('4893ffaece52108cfa04bab7ac855e0b38d6148e4f2abeca97dd5e6f28ace1e4')
makedepends=('cmake' 'make' 'pkgconf' 'gcc')
depends=('spdlog' 'openssl' 'libconfig' 'uriparser')
backup=('etc/candy.conf')

build() {
        cd "$pkgname-$pkgver/build"
        cmake -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release ..
        make
}

package() {
        cd "$pkgname-$pkgver"
        install -D -m 600 candy.conf "$pkgdir/etc/candy.conf"
        install -D -m 644 candy.service "$pkgdir/usr/lib/systemd/system/candy.service"
        install -D -m 644 candy@.service "$pkgdir/usr/lib/systemd/system/candy@.service"
        cd build
        make DESTDIR="$pkgdir/" install
}
