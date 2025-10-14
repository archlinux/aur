# Maintainer: Sunny <brainworms2002 at gmail dot com>

_pkgname="azahar"
pkgname="$_pkgname-appimage"

pkgver=2123.3

pkgrel=1
epoch=1
pkgdesc="Azahar is an open-source 3DS emulator project based on Citra. (already compiled)"
url="https://azahar-emu.org"
license=("GPL2")
arch=("x86_64")
provides=("$_pkgname")
conflicts=("$_pkgname"
	   "$_pkgname-git")
replaces=()
depends=("ffmpeg"
         "sdl2")

_source_main() {
  _appimage="$_pkgname.AppImage"
  source=("https://github.com/azahar-emu/azahar/releases/download/$pkgver/$_pkgname.AppImage")
  sha256sums=('e0d2e941ae4ebef50ca64129131fd477c49cb7670c497194612916fc9346908f')
}

options=("!strip")
build() {
  # extract
  chmod +x "$_appimage"
  "./$_appimage" --appimage-extract

  # icon
  for i in squashfs-root/*.svg; do
    [ -f "$i" ] && install -Dm755 "$i" "$_pkgname.svg" && break
  done
}

package() {
  # appimage
  install -Dm755 "$_pkgname.AppImage" "$pkgdir/usr/bin/azahar"

  # icon
  install -Dm644 "$_pkgname.svg" -t "$pkgdir/usr/share/pixmaps/"

  # launcher
  install -Dm644 /dev/stdin "$pkgdir/usr/share/applications/$_pkgname.desktop" << END
[Desktop Entry]
Type=Application
Name=Azahar
GenericName=$pkgdesc
Comment=$pkgdesc
TryExec=$_pkgname
Exec=$_pkgname
Icon=$_pkgname
Terminal=false
StartupNotify=true
StartupWMClass=$_pkgname
Categories=Game;Emulator;
END

  # permissions
  chmod -R u+rwX,go+rX,go-w "$pkgdir/"
}

_source_main
