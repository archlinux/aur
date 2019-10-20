# Maintainer:  Chris Severance aur.severach aATt spamgourmet dott com
# Contributor: Alexander F. Rødseth <xyproto@archlinux.org>
# Contributor: Kevin Piche <kevin@archlinux.org>
# Contributor: Jason Chu <jchu@xentac.net>

pkgname=mahjong
pkgver=1.15
pkgrel=1
pkgdesc='The classical game of Mah Jong (multiplayer)'
arch=('x86_64')
url='http://mahjong.julianbradfield.org/'
license=('GPL' 'custom')
depends=('gtk2')
makedepends=('gendesk' 'imagemagick' 'setconf')
source=("http://mahjong.julianbradfield.org/Source/mj-$pkgver-src.tar.gz")
md5sums=('52eb521f5276a4057e0e44f84d3b27e4')
sha256sums=('d115a1769b41a32cced0b236e4dbca9d9b0f30827032b507a18216896ef6da92')

prepare() {
  gendesk -f -n --pkgname "$pkgname" --pkgdesc "$pkgdesc" \
    --categories 'Application;Game' --exec xmj
  convert +set date:create +set date:modify \
    "mj-$pkgver-src/icon.ico" "$pkgname.png"
  sed -i 's/& Calling/Calling/' "mj-$pkgver-src/gui-dial.c"
  setconf "mj-$pkgver-src/Makefile" \
    CFLAGS="$CFLAGS $(pkg-config gtk+-2.0 --cflags) \
    -DTILESET=NULL -DTILESETPATH=NULL -DGTK2=1 -w"
}

build() {
  make -C "mj-$pkgver-src" LDLIBS="-lm"
}

package() {
  make DESTDIR="$pkgdir/usr/" MANDIR=share/man/man1 \
    -C "mj-$pkgver-src" install install.man
  install -Dm644 "mj-$pkgver-src/tiles-v1/README" \
    "$pkgdir/usr/share/licenses/$pkgname/tiles-license.txt"
  install -Dm644 "$srcdir/$pkgname.desktop" \
    "$pkgdir/usr/share/applications/$pkgname.desktop"
  install -Dm644 "$srcdir/$pkgname.png" \
    "$pkgdir/usr/share/pixmaps/$pkgname.png"
}

# vim: ts=2 sw=2 et:
