# Contributor: Angelo Theodorou <encelo@users.sourceforge.net>
# Maintainer: Angelo Theodorou <encelo@users.sourceforge.net>

pkgname=dunelegacy
pkgver=0.98.4
pkgrel=1
pkgdesc="Updated clone of Westood Studios' Dune2"
arch=('i686' 'x86_64')
url="http://dunelegacy.sourceforge.net"
license=('GPL-2.0-or-later')
depends=('sdl2_mixer' 'sdl2_ttf' 'xdg-utils' 'hicolor-icon-theme')
makedepends=('git' 'cmake')
changelog=dunelegacy.changelog
source=($pkgname::git+https://git.code.sf.net/p/dunelegacy/code#commit=3edb7922a8188913b522b118feba2a1e6749ebf8 enet_unix.patch)
md5sums=('SKIP' '66e94d1bca32a9b1819ea63336bd7f03')

prepare() {
  cd $pkgname
  patch --forward --strip=1 --input="${srcdir}/enet_unix.patch"
}

build() {
  cd $pkgname

  cmake -S . -B build -D CMAKE_BUILD_TYPE=Release
  make -C build
}

package() {
  cd $pkgname

  install -Dm755 "build/bin/dunelegacy" "$pkgdir/usr/bin/dunelegacy"

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
  install -Dm644 "$pkgname.png" "$pkgdir/usr/share/icons/hicolor/48x48/apps/$pkgname.png"
  install -Dm644 "$pkgname-128x128.png" "$pkgdir/usr/share/icons/hicolor/128x128/apps/$pkgname.png"
  install -Dm644 "$pkgname.svg" "$pkgdir/usr/share/icons/hicolor/scalable/apps/$pkgname.png"
  install -Dm644 "$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
}
