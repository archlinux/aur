# Maintainer:  nemesys <nemstar [at] zoho [dot] com>
# Contributor: randomize46 <randomize46 [at] gmail [dot] com>
# Contributor:  tjwoosta <tjwoosta@gmail.com>
# Contributor: Lucky <archlinux@builds.lucky.li>
# Contributor: Ashren <edgar [at] archlinux [dot] us>
# Contributor: Gaetan Bisson <bisson@archlinux.org>
# Contributor: Jeff Mickey <jeff@archlinux.org>

pkgname="rtorrent-vi-color"
_pkgname="rtorrent"
pkgver=0.9.7
pkgrel=1
pkgdesc='Ncurses BitTorrent client based on libTorrent with vi like keybindings and color patch.'
url="http://libtorrent.rakshasa.no"
arch=('i686' 'x86_64')
license=('GPL')
depends=("curl" "libtorrent>=0.13.7" "xmlrpc-c" "libsigc++")
conflicts=("${_pkgname}")
provides=("${_pkgname}")
install="${pkgname}.install"
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/rakshasa/${_pkgname}/archive/v${pkgver}.tar.gz"
        "${_pkgname}-${pkgver}_vi_keybinding_tjwoosta.patch"
        "${_pkgname}-${pkgver}_color.patch"
        "${_pkgname}-${pkgver}_compact_display.patch")
sha1sums=('6c4f13288b36a868ca777f3ae5a39928ddbf6426'
          '491be68e005124bd61efcaab5dcfc0ddb3a2059a'
          'f32cc1c0622155f4c47d99fbb52f0e918476188f'
          '58e625a458033d85ac642c39213455c41ab63b9f')

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"

  patch -uNp1 -i "${srcdir}/${_pkgname}-${pkgver}_vi_keybinding_tjwoosta.patch"
  patch -uNp1 -i "${srcdir}/${_pkgname}-${pkgver}_color.patch"
  patch -uNp1 -i "${srcdir}/${_pkgname}-${pkgver}_compact_display.patch"

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
#  install -Dm644 doc/faq.xml "${pkgdir}/usr/share/doc/rtorrent/faq.xml"
#  install -Dm644 doc/rtorrent.1 "${pkgdir}/usr/share/man/man1/rtorrent.1"
#  install -Dm644 doc/rtorrent.rc "${pkgdir}/usr/share/doc/rtorrent/rtorrent.rc"

}
