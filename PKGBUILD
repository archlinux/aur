# Maintainer: Sunny <brainworms2002 at gmail dot com>

_pkgname="azahar"
pkgname="$_pkgname-appimage-wayland"

pkgver=2126.0

pkgrel=1
epoch=1
pkgdesc="Azahar is an open-source 3DS emulator project based on Citra. (already compiled, wayland version)"
url="https://azahar-emu.org"
license=("GPL2")
arch=("x86_64")
provides=("$_pkgname")
conflicts=("$_pkgname"
	   "$_pkgname-git"
	   "$_pkgname-appimage")
replaces=()
depends=("ffmpeg"
         "sdl2"
	 "fuse2")

_source_main() {
  _appimage="$_pkgname-wayland"_"$pkgver.AppImage"
  source=($_appimage::"https://github.com/azahar-emu/azahar/releases/download/$pkgver/$_pkgname-wayland.AppImage")
  sha256sums=('f325035d88e3a81694da2119a20f24398bee7b7ffed13ccb3b957471e0a8574d')
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
  install -Dm755 "$_appimage" "$pkgdir/usr/bin/azahar"

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
