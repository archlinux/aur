# $Id$
# Maintainer: Allen Zhong <pdev@zhoal.pw>
# Contributor: Gaetan Bisson <bisson@archlinux.org>
# Contributor: Jaroslav Lichtblau <svetlemodry@archlinux.org>
# Contributor: Daenyth <Daenyth+Arch [at] gmail [dot] com>
# Contributor: Jeff Mickey <jeff@archlinux.org>
# Contributor: sh__

_pkgname=libtorrent
pkgname=libtorrent-ipv6
pkgver=0.15.1
pkgrel=1
pkgdesc='BitTorrent library with a focus on high performance and good code, with ipv6 support'
url='https://github.com/rakshasa/libtorrent'
arch=('x86_64')
license=('GPL-2.0-onl')
depends=('openssl' 'zlib')
makedepends=('git')
conflicts=("${_pkgname}")
provides=("${_pkgname}")
source=("$_pkgname::git+https://github.com/rakshasa/libtorrent.git#tag=v$pkgver"
        tracker-ipv6.patch)
sha256sums=('8a8395a8a7042f4b3ec5b1b08f02cc44921bd1b10296f9cc5e7f17209d686cde'
            '9d4d3a0e0a5a128d5a28cbff097aba731c78b90113260612dd646c7747f4f844')

prepare() {
    cd "${srcdir}/${_pkgname}"
    patch -Np1 -i ../tracker-ipv6.patch
    sed '/AM_PATH_CPPUNIT/d' -i configure.ac
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
        --disable-debug

    make
}

package() {
    cd "${srcdir}/${_pkgname}"
    make DESTDIR="${pkgdir}" install
}
