pkgname=candy
pkgver=1.11
pkgrel=1
pkgdesc="A WebSocket and TUN based VPN for Linux"
url="https://github.com/lanthora/candy"
license=('MIT')
arch=('x86_64' 'aarch64' 'armv7h' 'riscv64')
source=("https://github.com/lanthora/candy/archive/refs/tags/v$pkgver.tar.gz" )
sha256sums=('49d81865ba7b109ebc15226a516efbed233df1a33fe5eceb7a70c6010b05e1e0')
makedepends=('cmake' 'make' 'pkgconf' 'clang')
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
