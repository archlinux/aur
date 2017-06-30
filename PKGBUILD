# Maintainer:    KopfKrieg <archlinux [at] absolem [dot] cc>
# Contributor:   Ashren <edgar [at] archlinux [dot] us>
# Contributors:  Lucky <archlinux@builds.lucky.li> and Hleem
# Based on rtorrent-color from AUR

pkgname=rtorrent-color
_pkgname="rtorrent"
pkgver=0.9.6
pkgrel=4
pkgdesc="Ncurses BitTorrent client based on libTorrent with color patch."
url="http://rakshasa.github.io/rtorrent/"
url="https://github.com/KopfKrieg/rtorrent/tree/colorpatch"
arch=("i686" "x86_64")
license=("GPL")
depends=("curl" "libtorrent>=0.13.6" "xmlrpc-c" "libsigc++")
conflicts=("${_pkgname}")
provides=("${_pkgname}")
install="${pkgname}.install"
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/rakshasa/${_pkgname}/archive/${pkgver}.tar.gz"
        "${_pkgname}-${pkgver}_color.patch")
sha1sums=('27505081254618077c291eb1ee36bfb41f974834'
          '78429b5cf5976270dc1a55d8dc0ef4644675512b')

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
