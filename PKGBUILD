# $Id$
# Maintainer: Allen Zhong <moeallenz@gmail.com>
# Contributor: Gaetan Bisson <bisson@archlinux.org>
# Contributor: Jaroslav Lichtblau <svetlemodry@archlinux.org>
# Contributor: Daenyth <Daenyth+Arch [at] gmail [dot] com>
# Contributor: Jeff Mickey <jeff@archlinux.org>
# Contributor: sh__

_pkgname=libtorrent
pkgname=libtorrent-ipv6
pkgver=0.13.6
pkgrel=2
pkgdesc='BitTorrent library with a focus on high performance and good code, with ipv6 support'
url='http://rakshasa.github.io/rtorrent/'
arch=('i686' 'x86_64')
license=('GPL')
depends=('openssl')
conflicts=("${_pkgname}")
provides=("${_pkgname}")
source=("$_pkgname-$pkgver.tar.gz::https://github.com/rakshasa/${_pkgname}/archive/${pkgver}.tar.gz"
        "${_pkgname}-ipv6.patch"
        "fixing-memleak-with-getifaddrs.patch")
sha1sums=('9ca6ca9698f81c758fe934b52374f23588a7cc78'
          '3a0925101ada86a4b0cff03ce1c704fd8dfd80a3'
          '933a94ca664fd98b05d4a326e683dbc0a7e250bd')

prepare() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    patch -uNp1 -i "${srcdir}/${_pkgname}-ipv6.patch"
    # https://github.com/inste/libtorrent/commit/bdf086234cc6ea07364c6ef20e08c5fc504b70db
    patch -uNp1 -i "${srcdir}/fixing-memleak-with-getifaddrs.patch"
    sed '/AM_PATH_CPPUNIT/d' -i configure.ac
}

build() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    ./autogen.sh

    export CXXFLAGS="${CXXFLAGS} -std=c++11 -fno-strict-aliasing"
    ./configure \
        --prefix=/usr \
        --disable-debug \
        --enable-ipv6

    make
}

package() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    make DESTDIR="${pkgdir}" install
}
