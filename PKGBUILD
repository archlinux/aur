# Maintainer: Alexander Fasching <fasching.a91@gmail.com>
pkgname=direwolf-git
_pkgname=direwolf
pkgver=1.3.r2.g6207e2e
pkgrel=1
pkgdesc="Dire Wolf is a software modem/TNC and APRS encoder/decoder"
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
url="https://github.com/wb2osz/direwolf"
license=('GPL')
depends=('alsa-lib' 'gpsd')
makedepends=('make' 'gcc' 'patch')
provides=('direwolf')
conflicts=('direwolf')
source=("git+https://github.com/wb2osz/direwolf.git"
        'Makefile.patch'
        'direwolf.service'
        'direwolf-kiss.service')
sha1sums=('SKIP'
          'f94b193a8e49bae073de3cedff4394821d6148fa'
          '66366c7a4e8d3768013f9036f2681a86d4b8ad88'
          'eea3a3fb334645cd8a1e2604dc6c6b024148722a')
sha256sums=('SKIP'
            '5a4bee3543da1bbe9cd8bd5edb3bb9b502728841c4c34da332a19f34f876a140'
            'a1efe2bb96470bc52faa747708b195a685dc454f3d9c91f6bf4d39ab94d3608a'
            '2a2e4acc769a20afebdfdcd21640fd17b0c4217ceb7ecb3378f9ee5c45fadc68')

pkgver() {
    cd "$_pkgname"
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    cd "$_pkgname"
    patch -p1 < ../Makefile.patch
}

build() {
    cd "$_pkgname"
    make
}

check() {
    :
}

package() {
    cd "$_pkgname"
    mkdir -p "$pkgdir/usr/bin"
    mkdir -p "$pkgdir/usr/share/doc/$_pkgname"
    mkdir -p "$pkgdir/var/log/direwolf"
    make INSTALLDIR="$pkgdir/usr" install

    mkdir -p "$pkgdir/etc/direwolf"
    install -D -m 644 direwolf.conf "$pkgdir/etc/direwolf/direwolf.conf"

    mkdir -p "$pkgdir/usr/lib/systemd/system"
    install -D -m 644 ../direwolf.service "$pkgdir/usr/lib/systemd/system"
    install -D -m 644 ../direwolf-kiss.service "$pkgdir/usr/lib/systemd/system"
}
