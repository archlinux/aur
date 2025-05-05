# Maintainer:  nemesys <nemstar [at] zoho [dot] com>
# Contributor: randomize46 <randomize46 [at] gmail [dot] com>
# Contributor:  tjwoosta <tjwoosta@gmail.com>
# Contributor: Lucky <archlinux@builds.lucky.li>
# Contributor: Ashren <edgar [at] archlinux [dot] us>
# Contributor: Gaetan Bisson <bisson@archlinux.org>
# Contributor: Jeff Mickey <jeff@archlinux.org>

pkgname="rtorrent-vi-color"
_pkgname="rtorrent"
pkgver=0.15.3
pkgrel=2
pkgdesc='Ncurses BitTorrent client based on libTorrent with vi like keybindings and color patch.'
url="http://libtorrent.rakshasa.no"
arch=('i686' 'x86_64')
license=('GPL')
depends=("curl" "libtorrent>=0.15.3" "xmlrpc-c" "libsigc++" "autoconf-archive" "libtool")
conflicts=("${_pkgname}")
provides=("${_pkgname}")
install="${pkgname}.install"
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/rakshasa/${_pkgname}/archive/v${pkgver}.tar.gz"
        "${_pkgname}-${pkgver}_vi_keybinding_tjwoosta.patch"
        "${_pkgname}-${pkgver}_compact_display.patch")
sha1sums=('0db45db082c13639f1a5be9aa4be0f7db81c4773'
          '7423c2eee0933f572b5e921330ce622843f14765'
          'a82a73c999058cb6552ecd0be8fa9b945b154558')

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"

  patch -uNp1 -i "${srcdir}/${_pkgname}-${pkgver}_vi_keybinding_tjwoosta.patch"
  patch -uNp1 -i "${srcdir}/${_pkgname}-${pkgver}_compact_display.patch"

  libtoolize

  # generate the configure scripts
  aclocal -I scripts && autoconf -i && autoheader && automake --add-missing

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
#  install -Dm644 doc/rtorrent.rc "${pkgdir}/usr/share/doc/rtorrent/rtorrent.rc"
  install -Dm644 doc/faq.xml "${pkgdir}/usr/share/doc/rtorrent/faq.xml"
#  install -Dm644 doc/rtorrent.1 "${pkgdir}/usr/share/man/man1/rtorrent.1"
  install -Dm644 doc/rtorrent.rc "${pkgdir}/usr/share/doc/rtorrent/rtorrent.rc"
}
