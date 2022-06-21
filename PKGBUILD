# Maintainer:  nemesys <nemstar [at] zoho [dot] com>
# Contributor: randomize46 <randomize46 [at] gmail [dot] com>
# Contributor:  tjwoosta <tjwoosta@gmail.com>
# Contributor: Lucky <archlinux@builds.lucky.li>
# Contributor: Ashren <edgar [at] archlinux [dot] us>
# Contributor: Gaetan Bisson <bisson@archlinux.org>
# Contributor: Jeff Mickey <jeff@archlinux.org>

pkgname="rtorrent-vi-color"
_pkgname="rtorrent"
pkgver=0.9.8
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
sha1sums=('897ab36a4e6769df2984930cae0991da83818237'
          '732f4b6b9d0a699018fe5e5a974c430c0d09d061'
          'a086d12ed3f57d766ee0752b23cb025f1127dde4'
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
