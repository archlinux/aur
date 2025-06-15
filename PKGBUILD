# Maintainer:  Chris Severance aur.severach aATt spamgourmet dott com
# Contributor: Alexander F. Rødseth <xyproto@archlinux.org>
# Contributor: Kevin Piche <kevin@archlinux.org>
# Contributor: Jason Chu <jchu@xentac.net>

set -u
pkgname='mahjong'
pkgver='1.17'
pkgrel='1'
pkgdesc='The classical game of Mah Jong (multiplayer)'
arch=('x86_64')
url='https://mahjong.julianbradfield.org/'
license=('GPL-2.0-or-later')
depends=('glibc' 'gtk2' 'pango' 'atk' 'cairo' 'gdk-pixbuf2' 'glib2' 'harfbuzz' 'fontconfig' 'freetype2')
makedepends=('gendesk' 'imagemagick' 'setconf')
source=("http://mahjong.julianbradfield.org/Source/mj-${pkgver}-src.tar.gz")
md5sums=('075963063ece871be1845d6fe7fb5972')
sha256sums=('ec21fb35715130ee647c18e64b9b030a089265fdf03ba141f09701b3be6889d9')

prepare() {
  set -u
  gendesk -f -n --pkgname "${pkgname}" --pkgdesc "$pkgdesc" --categories 'Application;Game' --exec 'xmj'
  convert +set 'date:create' +set 'date:modify' "mj-${pkgver}-src/icon.ico" "${pkgname}.png"
  sed -e 's/& Calling/Calling/' -i "mj-${pkgver}-src/gui-dial.c"
  setconf "mj-${pkgver}-src/Makefile" CFLAGS="$CFLAGS $(pkg-config gtk+-2.0 --cflags) -DTILESET=NULL -DTILESETPATH=NULL -DGTK2=1 -w -std=gnu17"
  set +u
}

build() {
  set -u
  make -C "mj-${pkgver}-src" LDLIBS='-lm'
  set +u
}

package() {
  set -u
  make DESTDIR="${pkgdir}/usr/" MANDIR='share/man/man1' -C "mj-${pkgver}-src" install 'install.man'
  install -Dpm644 "mj-${pkgver}-src/tiles-v1/README" "${pkgdir}/usr/share/licenses/${pkgname}/tiles-license.txt"
  install -Dpm644 "${srcdir}/${pkgname}.desktop" -t "${pkgdir}/usr/share/applications/"
  install -Dpm644 "${srcdir}/${pkgname}.png" -t "${pkgdir}/usr/share/pixmaps/"
  set +u
}
set +u
