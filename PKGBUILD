# Maintainer: Sebba <sebba at cock dot li>
pkgname=arena-tracker-git
_pkgname=arena-tracker
pkgver=r475.61c3927
pkgrel=1
pkgdesc="Hearthstone tool to track cards in Arena."
arch=(x86_64)
url="https://github.com/supertriodo/Arena-Tracker/"
license=('GPL')
depends=('opencv2' 'qt5-base')
provides=('arena-tracker-git' 'arena-tracker')
conflicts=('arena-tracker')
source=("$pkgname::git+https://github.com/supertriodo/Arena-Tracker.git"
		"$_pkgname.desktop"
    "unixpaths.patch")
md5sums=('SKIP'
         '5a5e0e1296da4fe10c3cc78d1123060c'
         'b413c68e9e247f35f583c55bcbfe4608')
install=$_pkgname.install

pkgver() {
  cd "$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  patch -p0 "$srcdir/$pkgname/Sources/utility.cpp" < unixpaths.patch
}

build() {
	cd "$pkgname"
	qmake .
	make
}

package() {
  cd "$srcdir/$pkgname/"
  install -d -m 755 ${pkgdir}/usr/share/${_pkgname}/extra
  install -d -m 755 ${pkgdir}/usr/share/doc/${_pkgname}
  install -D -m 755 ArenaTracker ${pkgdir}/usr/bin/${_pkgname}
  install -D -m 644 ArenaTracker.ico $pkgdir/usr/share/pixmaps/${_pkgname}.ico
  install -D -m 644 Extra/arenaTemplate.png ${pkgdir}/usr/share/${_pkgname}/extra/arenaTemplate.png
  install -D -m 644 Extra/collectionTemplate.png ${pkgdir}/usr/share/${_pkgname}/extra/collectionTemplate.png
  install -D -m 644 Extra/deckBuilder.py ${pkgdir}/usr/share/${_pkgname}/extra/deckBuilder.py
  install -D -m 644 $srcdir/$_pkgname.desktop $pkgdir/usr/share/applications/$_pkgname.desktop
  install -D -m 644 Fonts/hsFont.ttf $pkgdir/usr/share/fonts/TTF/hsFont.ttf
  install -D -m 644 README.md ${pkgdir}/usr/share/doc/${_pkgname}
}
