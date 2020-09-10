# Maintainer: Hexhu <i@hexhu.net>
# Maintainer: Lucas Magalhães <whoisroot@national.shitposting.agency>
_pkgname=passivedns
pkgname=${_pkgname}-git
pkgver=r275.e126cbb
pkgrel=3
pkgdesc="A network sniffer that logs all DNS server replies for use in a passive DNS setup"
arch=('x86_64')
url="https://github.com/gamelinux/passivedns"
license=('GPLv2')
depends=('ldns' 'libpcap')
makedepends=('git' 'binutils') 
provides=("${_pkgname}")
source=("passivedns::git+git://github.com/gamelinux/passivedns.git"
        "https://github.com/gamelinux/passivedns/files/5089290/gcc-10_patch.txt")
sha256sums=('SKIP'
            '575fafb4642073ee326894382bf7dd422dd180726b107a602a69ea1a61ea03fc')

pkgver() {
    cd "${srcdir}/${_pkgname}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "${srcdir}/${_pkgname}"
    patch -Np1 -i "$srcdir/gcc-10_patch.txt"
    autoreconf --install
    ./configure
    make
}

package() {
    cd "${srcdir}/${_pkgname}"
    make DESTDIR="${pkgdir}" install
}
