# Maintainer: Sunny <brainworms2002 at gmail dot com>

_pkgname="azahar"
pkgname="$_pkgname-appimage"

pkgver=2121.rc1

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
makedepends=("patchelf")
_appimage="$_pkgname.AppImage"
source=("https://github.com/azahar-emu/azahar/releases/download/2121-rc1/$_pkgname.AppImage")
options=("!strip")
sha256sums=('SKIP')
build() {
  # extract
  chmod +x "$_appimage"
  "./$_appimage" --appimage-extract

  # icon
  for i in squashfs-root/*.svg; do
    [ -f "$i" ] && install -Dm755 "$i" "$_pkgname.svg" && break
  done

  # update script
  sed -Ei \
    's@^this_dir=".*\breadlink\b.*\bdirname\b.*"$@this_dir="/opt/'"$_pkgname"'"@' \
    "squashfs-root/AppRun"
}

package() {
  local _files=(
    squashfs-root/AppRun*
    squashfs-root/apprun-hooks
    squashfs-root/usr/bin
    squashfs-root/usr/lib
    squashfs-root/usr/plugins
  )

  install -dm755 "$pkgdir/opt/$_pkgname/usr"
  for i in ${_files[@]}; do
    mv "$i" "$pkgdir/opt/$_pkgname/${i#*/}"
  done

  # rpath
  patchelf --force-rpath --set-rpath "/opt/$_pkgname/usr/lib" "$pkgdir/opt/$_pkgname/usr/bin/azahar"

  # symlink
  install -dm755 "$pkgdir/usr/bin"
  ln -srf "$pkgdir/opt/$_pkgname/usr/bin/$_pkgname" "$pkgdir/usr/bin/$_pkgname"

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
