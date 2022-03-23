# Maintainer: Allen Zhong <moeallenz@gmail.com>
# Contributor: Gaetan Bisson <bisson@archlinux.org>
# Contributor:  Daenyth <Daenyth [at] gmail [dot] com>
# Contributor: Jeff Mickey <jeff@archlinux.org>
# Contributor: sh__

_pkgname=rtorrent
pkgname=rtorrent-ipv6
pkgver=0.9.8
pkgrel=2
pkgdesc='Ncurses BitTorrent client based on libTorrent, with IPv6 patch'
url='http://rakshasa.github.io/rtorrent/'
license=('GPL')
arch=('x86_64')
depends=('libtorrent-ipv6=0.13.8' 'xmlrpc-c')
makedepends=('git')
conflicts=("${_pkgname}")
provides=("${_pkgname}")
source=("$_pkgname::git+https://github.com/rakshasa/${_pkgname}.git#commit=52ceb39ca38a68b0faa25d5050a41f431b7f2069")
sha256sums=('SKIP')

prepare() {
    cd "${srcdir}/${_pkgname}"
    sed '/AM_PATH_CPPUNIT/d' -i configure.ac
    ./autogen.sh
}

build() {
    cd "${srcdir}/${_pkgname}"
    export CXXFLAGS="${CXXFLAGS} -std=c++11 -fno-strict-aliasing"
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
