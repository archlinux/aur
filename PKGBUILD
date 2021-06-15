# Maintainer: Hexhu <i@hexhu.net>
# Maintainer: Lucas Magalhães <whoisroot@national.shitposting.agency>
_pkgname=passivedns
pkgname=${_pkgname}-git
pkgver=r287.d757713
pkgrel=1
pkgdesc="A network sniffer that logs all DNS server replies for use in a passive DNS setup"
arch=('x86_64')
url="https://github.com/gamelinux/passivedns"
license=('GPLv2')
depends=('ldns' 'libpcap')
makedepends=('git' 'binutils')
provides=("${_pkgname}")
source=("passivedns::git+git://github.com/gamelinux/passivedns.git"
        passivedns.service)
sha256sums=('SKIP'
            '49eccbd5e9f5a78d444abd5b0282af3143de5a4c8105203a3270724685a47a73')

pkgver() {
    cd "${srcdir}/${_pkgname}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "${srcdir}/${_pkgname}"
    autoreconf --install
    ./configure --prefix=/usr
    make
}

package() {
    cd "${srcdir}/${_pkgname}"
    make DESTDIR="${pkgdir}" install

    install -D -m 0644 "${srcdir}/${_pkgname}"/tools/* -t "$pkgdir"/usr/share/doc/passivedns/tools/

    install -D -m 0644 "${srcdir}/${_pkgname}"/doc/* -t "$pkgdir"/usr/share/doc/passivedns/doc/

    install -D -m 0644 README "$pkgdir"/usr/share/doc/passivedns/README

    install -D -m 0644 ../passivedns.service "$pkgdir"/usr/lib/systemd/system/passivedns.service
}
