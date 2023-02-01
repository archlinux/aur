# Maintainer: Alexander Fasching <fasching.a91@gmail.com>
pkgname=direwolf-git
_pkgname=direwolf
pkgver=1.7.dev.A.r70.gc25629a
pkgrel=1
pkgdesc="Software modem/TNC and APRS encoder/decoder"
arch=('i686' 'x86_64' 'armv6h' 'armv7h' 'aarch64')
url="https://github.com/wb2osz/direwolf"
license=('GPL')
depends=('alsa-lib')
optdepends=('gpsd' 'hamlib')
makedepends=('git' 'cmake')
provides=('direwolf')
conflicts=('direwolf')
source=('git+https://github.com/wb2osz/direwolf.git#branch=dev'
        'direwolf.service'
        'direwolf-kiss.service')
#        'gpsd-version.patch')
sha1sums=('SKIP'
          '66366c7a4e8d3768013f9036f2681a86d4b8ad88'
          'eea3a3fb334645cd8a1e2604dc6c6b024148722a')
#          '2853da5d0e00f9603a8dc5fd78cf9837158c303e')
sha256sums=('SKIP'
            'a1efe2bb96470bc52faa747708b195a685dc454f3d9c91f6bf4d39ab94d3608a'
            '2a2e4acc769a20afebdfdcd21640fd17b0c4217ceb7ecb3378f9ee5c45fadc68')
#            '57e7eea1b355fd4e8a0ea984c74cfa4f9c9a990b03df9ee8c17dfc13d925a67c')

pkgver() {
    cd "$_pkgname"
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

#prepare() {
#    patch --directory="$_pkgname" --forward --strip=1 --input="${srcdir}/gpsd-version.patch"
#}

build() {
    cd "$_pkgname"
    mkdir -p build
    cd build
    cmake -DCMAKE_INSTALL_PREFIX="/usr" \
          -DCMAKE_BUILD_TYPE=Release \
          ..
    make
}

package() {
    cd "$_pkgname/build"
    make DESTDIR="$pkgdir" install

    mkdir -p "$pkgdir/etc/direwolf"
    install -D -m 644 direwolf.conf "$pkgdir/etc/direwolf/direwolf.conf"

    cd "$srcdir"
    mkdir -p "$pkgdir/usr/lib/systemd/system"
    install -D -m 644 ../direwolf.service "$pkgdir/usr/lib/systemd/system"
    install -D -m 644 ../direwolf-kiss.service "$pkgdir/usr/lib/systemd/system"
}
