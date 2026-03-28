# Maintainer: Hannele Ruiz <justlemoncl [at] gmail [dot] com>
# Maintainer: Wijnand Modderman-Lenstra <maze [at] pyth0n [dot] org>

_pkgname=direwolf
pkgname=$_pkgname
pkgver=1.8.1
pkgrel=1
pkgdesc="Software modem/TNC and APRS encoder/decoder"
arch=('i686' 'x86_64' 'armv6h' 'armv7h' 'aarch64')
url="https://github.com/wb2osz/direwolf"
license=('GPL-2.0-only')
depends=('alsa-lib' 'gpsd' 'hamlib')
optdepends=()
makedepends=('cmake')
provides=()
conflicts=()
source=("$_pkgname.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz"
        'direwolf.service'
        'direwolf-kiss.service'
        'icon-fix.patch')
sha1sums=('299e5df57a08acf735d37f3909fc66d9a2d56062'
          '66366c7a4e8d3768013f9036f2681a86d4b8ad88'
          'eea3a3fb334645cd8a1e2604dc6c6b024148722a'
          'e165778d51ff0f0390eddf13fcd32229d1dcdcf3')
sha256sums=('89d5f7992ae1e74d8cf26ec6479dde74d1f480bde950043756e875a689d065d7'
            'a1efe2bb96470bc52faa747708b195a685dc454f3d9c91f6bf4d39ab94d3608a'
            '2a2e4acc769a20afebdfdcd21640fd17b0c4217ceb7ecb3378f9ee5c45fadc68'
            'b4b458e9a2ed988d1be38d8a5fb5a6c7b8e477c13f4264fc15bb931293c1eee5')

prepare() {
    patch --directory="$_pkgname-$pkgver" --forward --strip=1 --input="${srcdir}/icon-fix.patch"
}

build() {
    cd "$_pkgname-$pkgver"
    mkdir -p build
    cd build
    cmake -DCMAKE_INSTALL_PREFIX="/usr" \
          -DCMAKE_BUILD_TYPE=Release \
          ..
    make
}

package() {
    cd "$_pkgname-$pkgver/build"
    make DESTDIR="$pkgdir" install

    mkdir -p "$pkgdir/etc/direwolf"
    install -D -m 644 direwolf.conf "$pkgdir/etc/direwolf/direwolf.conf"

    cd "$srcdir"
    mkdir -p "$pkgdir/usr/lib/systemd/system"
    install -D -m 644 ../direwolf.service "$pkgdir/usr/lib/systemd/system"
    install -D -m 644 ../direwolf-kiss.service "$pkgdir/usr/lib/systemd/system"
}
