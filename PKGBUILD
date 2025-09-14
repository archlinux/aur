# Contributor: Angelo Theodorou <encelo@users.sourceforge.net>
# Maintainer: Angelo Theodorou <encelo@users.sourceforge.net>

pkgname=dunelegacy
pkgver=0.98.5
pkgrel=1
pkgdesc="Updated clone of Westood Studios' Dune2"
arch=('i686' 'x86_64')
url="http://dunelegacy.sourceforge.net"
license=('GPL-2.0-or-later')
depends=('sdl2_mixer' 'sdl2_ttf' 'xdg-utils' 'hicolor-icon-theme')
makedepends=('git' 'cmake')
changelog=dunelegacy.changelog
source=($pkgname::git+https://git.code.sf.net/p/dunelegacy/code#commit=df3075e348413a3e7888125a86830517a966fd91 discord.patch)
md5sums=('SKIP' 'fb0e143ffae552f5f8864b078e50ba64')

prepare() {
  cd $pkgname
  patch --forward --strip=1 --input="${srcdir}/discord.patch"
}

build() {
  cd $pkgname

  cmake -S . -B build -D CMAKE_BUILD_TYPE=Release -D CMAKE_INSTALL_PREFIX=/usr
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
