# Maintainer: Allen Zhong <pdev@zhoal.pw>
# Contributor: Gaetan Bisson <bisson@archlinux.org>
# Contributor:  Daenyth <Daenyth [at] gmail [dot] com>
# Contributor: Jeff Mickey <jeff@archlinux.org>
# Contributor: sh__

_pkgname=rtorrent
pkgname=rtorrent-ipv6
pkgver=0.15.1
pkgrel=1
pkgdesc='Ncurses BitTorrent client based on libTorrent, with IPv6 patch'
url='http://rakshasa.github.io/rtorrent/'
license=('GPL-2.0-only')
arch=('x86_64')
depends=("libtorrent-ipv6=$pkgver" "tinyxml2")
makedepends=('git')
conflicts=("${_pkgname}")
provides=("${_pkgname}")
source=("$_pkgname::git+https://github.com/rakshasa/${_pkgname}.git#tag=v$pkgver")
sha256sums=('6d09484a12dc8699749daf29e2461990e0a1134e41e741e90aca39ed720cad3f')

prepare() {
    cd "${srcdir}/${_pkgname}"
    sed '/PKG_CHECK_EXISTS/d' -i scripts/ax_with_curses.m4
    aclocal -I ./scripts -I .
    autoheader
    libtoolize --automake --copy --force
    automake --add-missing --copy --gnu
    autoconf -fiv
}

build() {
    cd "${srcdir}/${_pkgname}"
    export CXXFLAGS="${CXXFLAGS} -std=c++17 -fno-strict-aliasing"
    ./configure \
        --prefix=/usr \
        --disable-debug \
        --with-xmlrpc-tinyxml2 \
        --enable-ipv6

    make
}

package() {
    cd "${srcdir}/${_pkgname}"
    make DESTDIR="${pkgdir}" install
    install -D doc/rtorrent.rc "${pkgdir}"/usr/share/doc/rtorrent/rtorrent.rc
}
