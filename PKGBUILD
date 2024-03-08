# Maintainer: Retro Gamer <https://github.com/eGax> 
# Previous Maintainers: Hilton Medeiros & Quentin Aniere

_pkgname=TrenchBroom
pkgname=trenchbroom-bin
pkgver=2024.1
_pkgver=Linux-ubuntu-22.04-v$pkgver-Release.$CARCH
pkgrel=2
pkgdesc="TrenchBroom is a free (GPLv3+), cross platform level editor for Quake-engine based games. It supports Quake, Quake 2, and Hexen 2 and runs on Windows (XP and newer), Mac OS X (10.6 and newer) and Linux.x86_64.
This is the Ubuntu Release version of TrenchBroom 2024.1 repackaged for Arch. For a current commit build use trenchbroom-git."
arch=("x86_64")
url="https://trenchbroom.github.io/"
license=('GPL3')
provides=('trenchbroom')
conflicts=('trenchbroom' 'trenchbroom-git')
depends=("freeimage" "freetype2" "mesa" "libgl" "freeglut" "libxxf86vm" "glew" "glm" "tinyxml2")
source=("https://github.com/TrenchBroom/TrenchBroom/releases/download/v$pkgver/$_pkgname-$_pkgver.deb")
noextract=("$_pkgname-$_pkgver.deb")
sha256sums=('7e2b59dfcdfc94841d62a29a01581672a47935138f9b21f9faa113fbbf1ca7ce')

prepare() {
  mkdir -p "$pkgname-$pkgver"
  mkdir -p "$pkgname-$pkgver-files"
  bsdtar xvf "$srcdir/$_pkgname-$_pkgver.deb" -C "$pkgname-$pkgver"
  bsdtar xvf "$pkgname-$pkgver/data.tar.gz" -C "$pkgname-$pkgver-files"
  # Ubuntu TB2024.1 requires libtinyxml2.so.9 / Arch is on 10, look for a valid symlink of 9, if none, create one from current libtinyxml2.10.0.0
  if [ ! -e "/usr/lib/libtinyxml2.so.9" ]; then sudo ln -s "/usr/lib/libtinyxml2.so.10.0.0" "/usr/lib/libtinyxml2.so.9"; else echo "complete"; fi
}

package() {
  cd "$srcdir/$pkgname-$pkgver-files"
  install -Dm644 "usr/share/$_pkgname/trenchbroom.desktop" "$pkgdir/usr/share/applications/trenchbroom.desktop"
  install -Dm644 "usr/share/$_pkgname/icons/icon_512.png" "$pkgdir/usr/share/icons/hicolor/512x512/apps/trenchbroom.png"
  cp -rf "." "$pkgdir"
  rm -f "$pkgdir/usr/share/$_pkgname/trenchbroom.desktop"
}