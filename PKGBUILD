# $Id$
# Maintainer: Allen Zhong <moeallenz@gmail.com>
# Contributor: Gaetan Bisson <bisson@archlinux.org>
# Contributor: Jaroslav Lichtblau <svetlemodry@archlinux.org>
# Contributor: Daenyth <Daenyth+Arch [at] gmail [dot] com>
# Contributor: Jeff Mickey <jeff@archlinux.org>
# Contributor: sh__

_pkgname=libtorrent
pkgname=libtorrent-ipv6
pkgver=0.13.8
pkgrel=3
pkgdesc='BitTorrent library with a focus on high performance and good code, with ipv6 support'
url='http://rakshasa.github.io/rtorrent/'
arch=('x86_64')
license=('GPL')
depends=('openssl' 'zlib')
makedepends=('git')
conflicts=("${_pkgname}")
provides=("${_pkgname}")
source=("$_pkgname::git+https://github.com/rakshasa/libtorrent.git#commit=ac8d6d1be5341e8dfa4ac33fef0bf8940a00c8f3")
sha256sums=('SKIP')

prepare() {
    cd "${srcdir}/${_pkgname}"
    sed '/AM_PATH_CPPUNIT/d' -i configure.ac
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
        --disable-debug

    make
}

package() {
    cd "${srcdir}/${_pkgname}"
    make DESTDIR="${pkgdir}" install
}
