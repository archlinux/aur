# Maintainer: Wijnand Modderman-Lenstra <maze@pyth0n.org>
pkgname=direwolf
pkgver=1.7
pkgrel=1
pkgdesc="Dire Wolf is a software modem/TNC and APRS encoder/decoder"
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
url="https://github.com/wb2osz/direwolf"
license=('GPL')
depends=('alsa-lib' 'gpsd')
makedepends=('cmake' 'gcc' 'patch')
source=(
    "$pkgname-$pkgver.tar.gz::https://github.com/wb2osz/direwolf/archive/refs/tags/1.7.tar.gz"
    'direwolf.service'
    'direwolf-kiss.service'
)
sha1sums=('a0dd836c682f6162d88ed5650eb6156a5ef4dcd0'
          '66366c7a4e8d3768013f9036f2681a86d4b8ad88'
          'eea3a3fb334645cd8a1e2604dc6c6b024148722a')
sha256sums=('6301f6a43e5db9ef754765875592a58933f6b78585e9272afc850acf7c5914be'
            'a1efe2bb96470bc52faa747708b195a685dc454f3d9c91f6bf4d39ab94d3608a'
            '2a2e4acc769a20afebdfdcd21640fd17b0c4217ceb7ecb3378f9ee5c45fadc68')

prepare() {
    cd "$pkgname-$pkgver"
}

build() {
    cd "$pkgname-$pkgver"
    mkdir -p build
    cd build
    cmake -DCMAKE_INSTALL_PREFIX="/usr" \
          -DCMAKE_BUILD_TYPE=Release \
          ..
    make
}

package() {
    cd "$pkgname-$pkgver/build"
    make DESTDIR="$pkgdir" install

    mkdir -p "$pkgdir/etc/direwolf"
    install -D -m 644 direwolf.conf "$pkgdir/etc/direwolf/direwolf.conf"

    cd "$srcdir"
    mkdir -p "$pkgdir/usr/lib/systemd/system"
    install -D -m 644 ../direwolf.service "$pkgdir/usr/lib/systemd/system"
    install -D -m 644 ../direwolf-kiss.service "$pkgdir/usr/lib/systemd/system"
}
