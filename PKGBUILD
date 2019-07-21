# Maintainer:    KopfKrieg <archlinux [at] absolem [dot] cc>
# Contributor:   Ashren <edgar [at] archlinux [dot] us>
# Contributors:  Lucky <archlinux@builds.lucky.li> and Hleem
# Based on rtorrent-color from AUR

pkgname=rtorrent-color
_pkgname="rtorrent"
pkgver=0.9.8
pkgrel=1
pkgdesc="Ncurses BitTorrent client based on libTorrent with color patch."
url="http://rakshasa.github.io/rtorrent/"
url="https://github.com/KopfKrieg/rtorrent/tree/colorpatch"
arch=("i686" "x86_64")
license=("GPL")
depends=("curl" "libtorrent>=0.13.6" "xmlrpc-c" "libsigc++")
conflicts=("${_pkgname}")
provides=("${_pkgname}")
install="${pkgname}.install"
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/rakshasa/${_pkgname}/releases/download/v${pkgver}/rtorrent-${pkgver}.tar.gz"
        "${_pkgname}-${pkgver}_color.patch")
sha1sums=('ed4f150ea8bb8f57af2042190512391a118e2302'
          '15f4885924cf74bb97c87a14c0c2f6d9c8c4c6db')

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"

  patch -uNp1 -i "${srcdir}/${_pkgname}-${pkgver}_color.patch"

  sed '/AM_PATH_CPPUNIT/d' -i configure.ac
  ./autogen.sh

  export CXXFLAGS="${CXXFLAGS} -fno-strict-aliasing"
  ./configure \
    --prefix=/usr \
    --enable-debug \
    --with-xmlrpc-c \

  make
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
  install -Dm644 doc/rtorrent.rc  "${pkgdir}/usr/share/doc/rtorrent/rtorrent.rc"
}
