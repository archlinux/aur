# Contributor: Angelo Theodorou <encelo@users.sourceforge.net>

pkgname=dunelegacy
pkgver=0.97.02
pkgrel=1
pkgdesc="Updated clone of Westood Studios' Dune2"
arch=('i686' 'x86_64')
url="http://dunelegacy.sourceforge.net"
license=('GPL')
depends=('sdl2_mixer' 'sdl2_ttf' 'xdg-utils')
makedepends=('git' 'autoconf')
changelog=dunelegacy.changelog
source=($pkgname::git+https://git.code.sf.net/p/dunelegacy/code#commit=6ea9ac96854daa8c75ba429e78dc6716b147e106 text_manager.patch)
md5sums=('SKIP' ee5ade548d7d5bbf1145b63be47183db)

prepare() {
  cd $pkgname
  patch --forward --strip=1 --input="${srcdir}/text_manager.patch"
}

build() {
  cd $pkgname

  autoreconf --install
  mkdir -p build
  cd build
  ../configure --prefix="/usr" && make $1 && cp src/dunelegacy ../
}

package() {
  cd $pkgname

  install -Dm755 "dunelegacy" "$pkgdir/usr/bin/dunelegacy"

  mkdir -p "$pkgdir/usr/share/dunelegacy"
  install -m644 "data/LEGACY.PAK" "data/OPENSD2.PAK" "data/GFXHD.PAK" "data/Dune2-Versions.txt" "$pkgdir/usr/share/dunelegacy/"

  mkdir -p "$pkgdir/usr/share/dunelegacy/locale"
  cp -p data/locale/*.pot "$pkgdir/usr/share/dunelegacy/locale/"
  cp -p data/locale/*.po "$pkgdir/usr/share/dunelegacy/locale/"

  mkdir -p "$pkgdir/usr/share/dunelegacy/maps/singleplayer"
  cp -p data/maps/singleplayer/*.ini "$pkgdir/usr/share/dunelegacy/maps/singleplayer/"

  mkdir -p "$pkgdir/usr/share/dunelegacy/maps/multiplayer"
  cp -p data/maps/multiplayer/*.ini "$pkgdir/usr/share/dunelegacy/maps/multiplayer/"

  # install icon and desktop files
  install -Dm644 "$pkgname.png" "$pkgdir/usr/share/pixmaps/$pkgname.png"
  install -Dm644 "$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
}
