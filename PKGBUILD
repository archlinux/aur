# Maintainer:  nemesys <nemstar [at] zoho [dot] com>
# Contributor: randomize46 <randomize46 [at] gmail [dot] com>
# Contributor:  tjwoosta <tjwoosta@gmail.com>
# Contributor: Lucky <archlinux@builds.lucky.li>
# Contributor: Ashren <edgar [at] archlinux [dot] us>
# Contributor: Gaetan Bisson <bisson@archlinux.org>
# Contributor: Jeff Mickey <jeff@archlinux.org>

pkgname="rtorrent-vi-color"
_pkgname="rtorrent"
pkgver=0.15.1
pkgrel=1
pkgdesc='Ncurses BitTorrent client based on libTorrent with vi like keybindings and color patch.'
url="http://libtorrent.rakshasa.no"
arch=('i686' 'x86_64')
license=('GPL')
depends=("curl" "libtorrent>=0.15.1" "xmlrpc-c" "libsigc++" "autoconf-archive" "libtool")
conflicts=("${_pkgname}")
provides=("${_pkgname}")
install="${pkgname}.install"
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/rakshasa/${_pkgname}/archive/v${pkgver}.tar.gz"
        "${_pkgname}-${pkgver}_vi_keybinding_tjwoosta.patch"
        "${_pkgname}-${pkgver}_color.patch"
        "${_pkgname}-${pkgver}_compact_display.patch")
sha1sums=('cbcd2ea27aed025bc7a000fcf86cb37dbd4bf0a2'
          '2d8db5148af372b93ddbf7a2a5d410adc049612b'
          'db94e94d78c006179124199bc0728fcfb786aaa1'
          'fee2ca15f4e802672d82b1203a0783146c9fb344')

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"

  patch -uNp1 -i "${srcdir}/${_pkgname}-${pkgver}_vi_keybinding_tjwoosta.patch"
  patch -uNp1 -i "${srcdir}/${_pkgname}-${pkgver}_color.patch"
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
