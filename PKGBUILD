# Maintainer:

: ${_install_path:=opt}

_pkgname="libresprite"
pkgname="$_pkgname-bin"
pkgver=1.2
pkgrel=1
pkgdesc="Animated sprite editor and pixel art tool"
url="https://github.com/LibreSprite/LibreSprite"
license=('GPL-2.0-only')
arch=('x86_64')

provides=("$_pkgname")
conflicts=("$_pkgname")

options=('!strip')

_pkgsrc="LibreSprite-$CARCH"
_pkgext="AppImage"
source=("$_pkgsrc.$_pkgext"::"$url/releases/download/v$pkgver/libresprite-anylinux-$CARCH.$_pkgext")
sha256sums=('f8ee4145ba75fc13b16ec02f214d9b31b2a700ff02349bf58c96377d42573c38')

prepare() {
  chmod +x "$_pkgsrc.AppImage"
  ./"$_pkgsrc.AppImage" --appimage-extract
}

package() {
  install -Dm644 "squashfs-root/$_pkgname.desktop" -t "$pkgdir/usr/share/applications/"
  install -Dm644 "squashfs-root/$_pkgname.png" -t "$pkgdir/usr/share/pixmaps/"

  mkdir -pm755 "$pkgdir/$_install_path/$_pkgname"
  mv squashfs-root/* "$pkgdir/$_install_path/$_pkgname/"

  install -Dm755 /dev/stdin "$pkgdir/usr/bin/$_pkgname" << END
#!/usr/bin/env sh
exec "/$_install_path/$_pkgname/AppRun" "\$@"
END

  chmod -R u+rwX,go+rX,go-w "$pkgdir/"
}
