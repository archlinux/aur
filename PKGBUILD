# Maintainer: Hannele Ruiz <justlemoncl [at] gmail [dot] com>
# Maintainer: Wijnand Modderman-Lenstra <maze [at] pyth0n [dot] org>

pkgname=direwolf
pkgver=1.8.1
pkgrel=1
pkgdesc="Dire Wolf is a software modem/TNC and APRS encoder/decoder"
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
url="https://github.com/wb2osz/direwolf"
license=('GPL')
depends=('alsa-lib' 'gpsd' 'hamlib')
makedepends=('cmake' 'gcc' 'patch')
source=(
    "$pkgname-$pkgver.tar.gz::https://github.com/wb2osz/direwolf/archive/refs/tags/$pkgver.tar.gz"
    'direwolf.service'
    'direwolf-kiss.service'
)
sha1sums=('299e5df57a08acf735d37f3909fc66d9a2d56062'
          '66366c7a4e8d3768013f9036f2681a86d4b8ad88'
          'eea3a3fb334645cd8a1e2604dc6c6b024148722a')
sha256sums=('89d5f7992ae1e74d8cf26ec6479dde74d1f480bde950043756e875a689d065d7'
            'a1efe2bb96470bc52faa747708b195a685dc454f3d9c91f6bf4d39ab94d3608a'
            '2a2e4acc769a20afebdfdcd21640fd17b0c4217ceb7ecb3378f9ee5c45fadc68')

prepare() {
    cd "$pkgname-$pkgver"
    sed -i 's/cmake_minimum_required(VERSION 3.1.0)/cmake_minimum_required(VERSION 3.5)/' CMakeLists.txt
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
