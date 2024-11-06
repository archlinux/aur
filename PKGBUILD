# Maintainer:
# Contributor: Nathan Wong, NorthWestWind <wsyn148@gmail.com>

: ${_install_path:=opt}

_pkgname="revolt-desktop"
pkgname="$_pkgname-appimage"
pkgver=1.0.8
pkgrel=3
pkgdesc="User-first chat platform built with modern web technologies"
url="https://github.com/revoltchat/desktop"
license=('AGPL-3.0-only')
arch=('x86_64')

makedepends=(
  'desktop-file-utils'
)

provides=("$_pkgname")
conflicts=("$_pkgname")

options=('!strip')

_pkgsrc="Revolt-$pkgver"
_pkgext="AppImage"
source=("$_pkgsrc.$_pkgext"::"$url/releases/download/v$pkgver/Revolt-$pkgver.AppImage")
sha256sums=('2f6dc97b9a7b56642938b0be21f990464d8228a526e2b34176c60bbea2d39516')

prepare() {
  chmod +x "$_pkgsrc.$_pkgext"
  ./"$_pkgsrc.$_pkgext" --appimage-extract
}

package() {
  install -Dm755 "squashfs-root/usr/share/icons/hicolor/512x512/apps/revolt-desktop.png" -t "$pkgdir/usr/share/pixmaps/"
  install -Dm755 /dev/stdin "$pkgdir/usr/share/applications/$_pkgname.desktop" << END
[Desktop Entry]
Type=Application
Name=Revolt
Comment=$pkgdesc
Exec=$_pkgname
Terminal=false
Icon=revolt-desktop
Categories=Network;InstantMessaging
StartupWMClass=RevoltDesktop
END

  install -dm755 "$pkgdir/$_install_path/$_pkgname"
  mv squashfs-root/* "$pkgdir/$_install_path/$_pkgname/"

  install -dm755 "$pkgdir/usr/bin"
  ln -srf "$pkgdir/$_install_path/$_pkgname/$_pkgname" "$pkgdir/usr/bin/$_pkgname"

  chmod -R u+rwX,go+rX,go-w "$pkgdir/"
}
