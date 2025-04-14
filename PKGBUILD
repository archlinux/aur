# $Id$
# Maintainer: Allen Zhong <pdev@zhoal.pw>
# Contributor: Gaetan Bisson <bisson@archlinux.org>
# Contributor: Jaroslav Lichtblau <svetlemodry@archlinux.org>
# Contributor: Daenyth <Daenyth+Arch [at] gmail [dot] com>
# Contributor: Jeff Mickey <jeff@archlinux.org>
# Contributor: sh__

_pkgname=libtorrent
pkgname=libtorrent-ipv6
pkgver=0.15.2
_commit=215547d9e361f9932752af54fb9cf66dc3cd6ced
pkgrel=1
pkgdesc='BitTorrent library with a focus on high performance and good code, with ipv6 support'
url='https://github.com/rakshasa/libtorrent'
arch=('x86_64')
license=('GPL-2.0-only')
depends=('openssl' 'zlib')
makedepends=('git')
conflicts=("${_pkgname}")
provides=("${_pkgname}")
source=("$_pkgname::git+https://github.com/rakshasa/libtorrent.git#commit=$_commit"
        tracker-ipv6.patch)
sha256sums=('fc9dda567236408f104d9dd29032a5e3ff5f4d94dcc2abf526fa68b858fe9b85'
            'e28c4fbb8bdc5322467726eff66c778029609724bb192f920bc4e249db6ebfdf')

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
