# Maintainer:
# Contributor: Alexander F. Rødseth <xyproto@archlinux.org>
# Contributor: Kevin Piche <kevin@archlinux.org>
# Contributor: Jason Chu <jchu@xentac.net>

pkgname=mahjong
pkgver=1.14
pkgrel=3
pkgdesc='The classical game of Mah Jong (multiplayer)'
arch=('x86_64')
url='http://mahjong.julianbradfield.org/'
license=('GPL' 'custom')
depends=('gtk2')
makedepends=('gendesk' 'imagemagick' 'setconf')
source=("http://mahjong.julianbradfield.org/Source/mj-$pkgver-src.tar.gz")
sha256sums=('976c9e0e11b78066cd74568992ff5382930711d7536bb11c9fa6877366c63dd6')

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
