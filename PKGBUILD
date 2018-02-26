# Maintainer: Daniel Hillenbrand <codeworkx at bbqlinux dot org>

_pkgbase=stubby
pkgname=stubby-git
pkgver=2718.8797280
pkgrel=1
pkgdesc="DNS Privacy stub resolver"
arch=('x86_64')
url="https://dnsprivacy.org/wiki/display/DP/DNS+Privacy+Daemon+-+Stubby"
license=('BSD')
backup=('etc/stubby/stubby.yml')
makedepends=('libtool' 'git')
conflicts=('getdns' 'stubby')
source=("$_pkgbase::git+https://github.com/getdnsapi/getdns.git"
        "${_pkgbase}.sysusers")
sha256sums=('SKIP'
            '2acedcf2b65d6e802a70deb55a5befbb71ff83be68a0ba5231a09c126910142b')

pkgver() {
  cd ${srcdir}/${_pkgbase}
  printf "%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    cd ${srcdir}/${_pkgbase}
    git submodule update --init
    libtoolize -ci
    autoreconf -fi
    ./configure \
        --prefix=/usr \
        --sysconfdir=/etc \
        --localstatedir=/var \
        --without-libidn \
        --with-ssl=/usr \
        --enable-stub-only \
        --with-stubby
}

build() {
    cd ${srcdir}/${_pkgbase}
    make
}

package() {
    cd ${srcdir}/${_pkgbase}

    make DESTDIR="${pkgdir}" install

    install -Dm644 COPYING -t "${pkgdir}"/usr/share/licenses/${_pkgbase}
    rmdir "${pkgdir}"/var{/run,}

    install -Dm644 stubby/systemd/${_pkgbase}.service -t "${pkgdir}"/usr/lib/systemd/system/
    install -Dm644 stubby/systemd/${_pkgbase}.conf -t "${pkgdir}"/usr/lib/tmpfiles.d/
    install -Dm644 ../../${_pkgbase}.sysusers "${pkgdir}"/usr/lib/sysusers.d/${_pkgbase}.conf
}
