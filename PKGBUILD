# Maintainer: Allen Zhong <pdev@zhoal.pw>
# Contributor: Gaetan Bisson <bisson@archlinux.org>
# Contributor:  Daenyth <Daenyth [at] gmail [dot] com>
# Contributor: Jeff Mickey <jeff@archlinux.org>
# Contributor: sh__

_pkgname=rtorrent
pkgname=rtorrent-ipv6
pkgver=0.10.0
pkgrel=1
pkgdesc='Ncurses BitTorrent client based on libTorrent, with IPv6 patch'
url='http://rakshasa.github.io/rtorrent/'
license=('GPL')
arch=('x86_64')
depends=('libtorrent-ipv6=0.14.0' 'xmlrpc-c')
makedepends=('git')
conflicts=("${_pkgname}")
provides=("${_pkgname}")
source=("$_pkgname::git+https://github.com/rakshasa/${_pkgname}.git#commit=f929594763f675d6eb160690c71187b23611a4b7"
        tracker-ipv6.patch)
sha256sums=('02f2cd3acc986a81d64e25d5340964a4119f8b4bcfb16b7c38010e3b3020a709'
            '526c2471b51a08a6520f1716f323a7c12bebc45d416e154afc68be7f86f410cf')

prepare() {
    cd "${srcdir}/${_pkgname}"
    patch -Np1 -i ../tracker-ipv6.patch
    sed '/PKG_CHECK_EXISTS/d' -i scripts/ax_with_curses.m4
    aclocal -I ./scripts -I .
    autoheader
    libtoolize --automake --copy --force
    automake --add-missing --copy --gnu
    autoconf
}

build() {
    cd "${srcdir}/${_pkgname}"
    export CXXFLAGS="${CXXFLAGS} -std=c++14 -fno-strict-aliasing"
    ./configure \
        --prefix=/usr \
        --disable-debug \
        --with-xmlrpc-c \
        --enable-ipv6

    make
}

package() {
    cd "${srcdir}/${_pkgname}"
    make DESTDIR="${pkgdir}" install
    install -D doc/rtorrent.rc "${pkgdir}"/usr/share/doc/rtorrent/rtorrent.rc
}
