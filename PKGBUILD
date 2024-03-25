# Maintainer: Allen Zhong <pdev@zhoal.pw>
# Contributor: Gaetan Bisson <bisson@archlinux.org>
# Contributor:  Daenyth <Daenyth [at] gmail [dot] com>
# Contributor: Jeff Mickey <jeff@archlinux.org>
# Contributor: sh__

_pkgname=rtorrent
pkgname=rtorrent-ipv6
pkgver=0.9.8
pkgrel=4
pkgdesc='Ncurses BitTorrent client based on libTorrent, with IPv6 patch'
url='http://rakshasa.github.io/rtorrent/'
license=('GPL')
arch=('x86_64')
depends=('libtorrent-ipv6=0.13.8' 'xmlrpc-c')
makedepends=('git')
conflicts=("${_pkgname}")
provides=("${_pkgname}")
source=("$_pkgname::git+https://github.com/rakshasa/${_pkgname}.git#commit=1da0e3476dcabbf74b2e836d6b4c37b4d96bde09"
        tracker-ipv6.patch)
sha256sums=('8cdeba8958f9a035f5d6a5015dc43bcbefa1a2cb6b585fe0e1d598a5bdec9720'
            'e8209b8ed89a1f7b40d2d0c5616be44c6fe072995c8420b17f5fa3dd4e3bcad1')

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
