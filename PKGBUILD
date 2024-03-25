# $Id$
# Maintainer: Allen Zhong <pdev@zhoal.pw>
# Contributor: Gaetan Bisson <bisson@archlinux.org>
# Contributor: Jaroslav Lichtblau <svetlemodry@archlinux.org>
# Contributor: Daenyth <Daenyth+Arch [at] gmail [dot] com>
# Contributor: Jeff Mickey <jeff@archlinux.org>
# Contributor: sh__

_pkgname=libtorrent
pkgname=libtorrent-ipv6
pkgver=0.13.8
pkgrel=4
pkgdesc='BitTorrent library with a focus on high performance and good code, with ipv6 support'
url='https://github.com/rakshasa/libtorrent'
arch=('x86_64')
license=('GPL')
depends=('openssl' 'zlib')
makedepends=('git')
conflicts=("${_pkgname}")
provides=("${_pkgname}")
source=("$_pkgname::git+https://github.com/rakshasa/libtorrent.git#commit=91f8cf4b0358d9b4480079ca7798fa7d9aec76b5"
        tracker-ipv6.patch)
sha256sums=('a5dcc71582ab775981cb9133bf07392926f482843972c8874743f92f7f305851'
            'c0b08f7dec58136ed705c46a07fcd10b1c2b828462486b7e1df25c499b910a15')

prepare() {
    cd "${srcdir}/${_pkgname}"
    patch -Np1 -i ../tracker-ipv6.patch
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
