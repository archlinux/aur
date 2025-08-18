# Maintainer: Sunny <brainworms2002 at gmail dot com>

_pkgname="kanji-dojo"
pkgname="$_pkgname-appimage"

pkgver=2.1.9
pkgrel=1
pkgdesc="Practice writing Japanese letters, learn their meanings and related words (AppImage version)"
url="https://github.com/syt0r/Kanji-Dojo"
license=("GPL3")
arch=("x86_64")
provides=("$_pkgname")
conflicts=("$_pkgname"
	   "$_pkgname-git")
replaces=()

_source_main() {
  _appimage="Kanji_Dojo-x86_64.AppImage"
  source=("https://github.com/syt0r/Kanji-Dojo/releases/download/v$pkgver/$_appimage")
  sha256sums=('SKIP')
}

options=("!strip")
build() {
  # extract
  chmod +x "$_appimage"
  "./$_appimage" --appimage-extract

  # icon
  for i in squashfs-root/*.png; do
    [ -f "$i" ] && install -Dm755 "$i" "$_pkgname.png" && break
  done
}

package() {
  # appimage
  install -Dm755 "$_appimage" "$pkgdir/usr/bin/kanji-dojo"

  # icon
  install -Dm644 "$_pkgname.png" -t "$pkgdir/usr/share/pixmaps/"

  # launcher
  install -Dm644 /dev/stdin "$pkgdir/usr/share/applications/$_pkgname.desktop" << END
[Desktop Entry]
Type=Application
Name=Kanji Dojo
GenericName=Kanji practice
Comment=$pkgdesc
TryExec=$_pkgname
Exec=$_pkgname
Icon=$_pkgname
Terminal=false
StartupNotify=true
StartupWMClass=$_pkgname
Categories=Game;
END

  # permissions
  chmod -R u+rwX,go+rX,go-w "$pkgdir/"
}

_source_main
