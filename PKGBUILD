# Maintainer: Daniel Wallace <danielwallace at gtmanfred dot com>
# Contributor: TDY <tdy@gmx.com>

pkgname=clonekeen
pkgver=8.4
pkgrel=2
pkgdesc="A clone of the classic DOS game, Commander Keen: Invasion of the Vorticons"
arch=('i686' 'x86_64')
url="http://clonekeen.sourceforge.net/"
license=('GPL3')
depends=('gcc-libs' 'sdl')
install=$pkgname.install
source=(http://$pkgname.sourceforge.net/files/$pkgname-src-${pkgver/.}.tar.gz
        http://$pkgname.sourceforge.net/files/1keen131.zip
        $pkgname.desktop $pkgname.png $pkgname.sh)
noextract=(1keen131.zip)
md5sums=('0179c34727d044f07a1c00df340134bd'
         '0561dd3e32ea4a0f965bd2288a3e64b3'
         '73d81bb50749f1f8b3b0fa55a724cca5'
         '77f4c659fc773abb297e4f5cf1bbbe70'
         'dbbb923232b390def47eb8f4eca966a8')

build() {
  cd "$srcdir/keen/src"
  sed -i "s#gcc -O2#gcc $CFLAGS#g" Makefile
  sed -i "s#-lSDL -lSDLmain -lstdc++#-lm -lSDL -lSDLmain -lstdc++#g" Makefile 
  make
}

package() {
  cd "$srcdir/keen"
  install -Dm755 "$srcdir/$pkgname.sh" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 "$srcdir/$pkgname.png" "$pkgdir/usr/share/pixmaps/$pkgname.png"
  install -Dm644 "$srcdir/$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"

  install -Dm755 src/keen "$pkgdir/usr/lib/$pkgname/keen"
  cp -rf bin/* "$pkgdir/usr/lib/$pkgname"
  bsdtar -xf "$srcdir/1keen131.zip" -C "$pkgdir/usr/lib/$pkgname/data"
  find "$pkgdir/usr/lib/$pkgname" -type f ! -name keen -exec chmod 644 '{}' \;
  find "$pkgdir/usr/lib/$pkgname" -type d -exec chmod 755 '{}' \;
}
