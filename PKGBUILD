pkgname=candy
pkgver=3.0
pkgrel=1
pkgdesc="A easy-to-deploy and peer-to-peer virtual private network"
url="https://github.com/lanthora/candy"
license=('MIT')
arch=('x86_64' 'aarch64' 'armv7h' 'riscv64')
source=("https://github.com/lanthora/candy/archive/refs/tags/v$pkgver.tar.gz" )
sha256sums=('52ff47211b0b3f406ad3d54e618dd721e154bd978abf1940fc289b228e6c98bb')
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
