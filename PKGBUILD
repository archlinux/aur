# Maintainer: Wijnand Modderman-Lenstra <maze@pyth0n.org>
pkgname=direwolf
pkgver=1.6
pkgrel=1
pkgdesc="Dire Wolf is a software modem/TNC and APRS encoder/decoder"
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
url="https://github.com/wb2osz/direwolf"
license=('GPL')
depends=('alsa-lib' 'gpsd')
makedepends=('cmake' 'gcc' 'patch')
source=(
    "$pkgname-$pkgver.tar.gz::https://github.com/wb2osz/direwolf/archive/refs/tags/1.6.tar.gz"
    'dwgpsd.patch'
    'direwolf.service'
    'direwolf-kiss.service'
)
sha1sums=('4290155b96289409a6d3a0a93cf9eb821829136e'
          '5e77ccc6d861a60fb73c9c16423cf4894e1434e2'
          '66366c7a4e8d3768013f9036f2681a86d4b8ad88'
          'eea3a3fb334645cd8a1e2604dc6c6b024148722a')
sha256sums=('208b0563c9b339cbeb0e1feb52dc18ae38295c40c0009d6381fc4acb68fdf660'
            '8cacecc740bf067bec8f6daa834f591ca02da54a85cdf4367e2e827a8758df22'
            'a1efe2bb96470bc52faa747708b195a685dc454f3d9c91f6bf4d39ab94d3608a'
            '2a2e4acc769a20afebdfdcd21640fd17b0c4217ceb7ecb3378f9ee5c45fadc68')

prepare() {
    cd "$pkgname-$pkgver"
    patch -p1 < "$srcdir/dwgpsd.patch"
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
