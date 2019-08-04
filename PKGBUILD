# Maintainer: Alexander Fasching <fasching.a91@gmail.com>
pkgname=direwolf-git
_pkgname=direwolf
pkgver=1.5.beta4.r63.ge219426
pkgrel=1
pkgdesc="Software modem/TNC and APRS encoder/decoder"
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
url="https://github.com/wb2osz/direwolf"
license=('GPL')
depends=('alsa-lib' 'gpsd')
makedepends=('make' 'gcc' 'patch')
provides=('direwolf')
conflicts=('direwolf')
source=('git+https://github.com/wb2osz/direwolf.git#branch=dev'
        '0001-Makefile.patch'
        'direwolf.service'
        'direwolf-kiss.service')
sha1sums=('SKIP'
          '749c44b5060e911ea0b647ee4dc4af1ed0544fc8'
          '66366c7a4e8d3768013f9036f2681a86d4b8ad88'
          'eea3a3fb334645cd8a1e2604dc6c6b024148722a')
sha256sums=('SKIP'
            'ad4eae3a6d0c8d6703cace8b956fc3e338ef7b6e951fd116dc75a81786b88fc2'
            'a1efe2bb96470bc52faa747708b195a685dc454f3d9c91f6bf4d39ab94d3608a'
            '2a2e4acc769a20afebdfdcd21640fd17b0c4217ceb7ecb3378f9ee5c45fadc68')


pkgver() {
    cd "$_pkgname"
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    cd "$_pkgname"
    git apply ../0001-Makefile.patch
}

build() {
    cd "$_pkgname"
    make
}

package() {
    cd "$_pkgname"
    mkdir -p "$pkgdir/usr/bin"
    mkdir -p "$pkgdir/usr/share/doc/$_pkgname"
    mkdir -p "$pkgdir/var/log/direwolf"
    make DESTDIR="$pkgdir/usr" ROOTDIR="$pkgdir" install

    mkdir -p "$pkgdir/etc/direwolf"
    install -D -m 644 direwolf.conf "$pkgdir/etc/direwolf/direwolf.conf"

    mkdir -p "$pkgdir/usr/lib/systemd/system"
    install -D -m 644 ../direwolf.service "$pkgdir/usr/lib/systemd/system"
    install -D -m 644 ../direwolf-kiss.service "$pkgdir/usr/lib/systemd/system"
}
