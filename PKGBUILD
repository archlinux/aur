# Maintainer:

: ${_install_path:=opt}

_pkgname="libresprite"
pkgname="$_pkgname-bin"
pkgver="1.1"
pkgrel=1
pkgdesc="Animated sprite editor and pixel art tool"
url="https://github.com/LibreSprite/LibreSprite"
license=('GPL-2.0-only')
arch=('x86_64')

provides=("$_pkgname")
conflicts=("$_pkgname")

options=('!strip')

_pkgsrc="LibreSprite-$CARCH"
_pkgext="zip"
source=("$_pkgsrc.$_pkgext"::"https://github.com/LibreSprite/LibreSprite/releases/download/v$pkgver/libresprite-development-linux-$CARCH.$_pkgext")
sha256sums=('19e08b852c76216ff6b890d837cc24ae54cf476a715d35ee7f030c845f2ccf83')

prepare() {
  chmod +x "$_pkgsrc.AppImage"
  ./"$_pkgsrc.AppImage" --appimage-extract
}

package() {
  install -Dm644 "squashfs-root/$_pkgname.desktop" -t "$pkgdir/usr/share/applications/"
  install -Dm644 "squashfs-root/$_pkgname.png" -t "$pkgdir/usr/share/pixmaps/"

  install -dm755 "$pkgdir/$_install_path/$_pkgname"
  mv squashfs-root/* "$pkgdir/$_install_path/$_pkgname/"

  install -dm755 "$pkgdir/usr/bin"
  ln -srf "$pkgdir/$_install_path/$_pkgname/AppRun" "$pkgdir/usr/bin/$_pkgname"

  chmod -R u+rwX,go+rX,go-w "$pkgdir/"
}
