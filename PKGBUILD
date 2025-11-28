# Maintainer:  Chris Severance aur.severach aATt spamgourmet dott com
# Contributor: Alexander F. Rødseth <xyproto@archlinux.org>
# Contributor: Kevin Piche <kevin@archlinux.org>
# Contributor: Jason Chu <jchu@xentac.net>

set -u
pkgname='mahjong'
pkgver='1.17.2'
pkgrel='1'
pkgdesc='The classical game of Mah Jong (multiplayer)'
arch=('x86_64')
url='https://mahjong.julianbradfield.org/'
license=('GPL-2.0-or-later')
depends=('glibc' 'gtk2' 'pango' 'atk' 'cairo' 'gdk-pixbuf2' 'glib2' 'harfbuzz' 'fontconfig' 'freetype2')
makedepends=('gendesk' 'imagemagick' 'setconf')
_srcdir="mj-${pkgver}-src"
source=("http://mahjong.julianbradfield.org/Source/${_srcdir}.tar.gz")
md5sums=('fec3dc03dc9496b0ed6e0bbb82af395e')
sha256sums=('f701a51704a55adde83e75670096841835cf1878e6a33623ea7894476d2d83c6')

prepare() {
  set -u
  cd "${_srcdir}"
  gendesk -f -n --pkgname "${pkgname}" --pkgdesc "${pkgdesc}" --categories 'Application;Game' --exec 'xmj'
  magick 'icon.ico' +set 'date:create' +set 'date:modify' "${pkgname}.png"
  sed -e 's/& Calling/Calling/' -i 'gui-dial.c'
  setconf 'Makefile' CFLAGS="${CFLAGS} $(pkg-config gtk+-2.0 --cflags) -DTILESET=NULL -DTILESETPATH=NULL -DGTK2=1 -w"
  set +u
}

build() {
  set -u
  cd "${_srcdir}"
  make LDLIBS='-lm'
  set +u
}

package() {
  set -u
  cd "${_srcdir}"
  make DESTDIR="${pkgdir}/usr/" MANDIR='share/man/man1' install 'install.man'
  install -Dpm644 'tiles-v1/README' "${pkgdir}/usr/share/licenses/${pkgname}/tiles-license.txt"
  install -Dpm644 "${pkgname}.desktop" -t "${pkgdir}/usr/share/applications/"
  install -Dpm644 "${pkgname}.png" -t "${pkgdir}/usr/share/pixmaps/"
  set +u
}
set +u
