# Maintainer: begin-theadventure <begin-thecontact.ncncb at dralias dot com>

_pkgname=uncso2
pkgname=$_pkgname-bin
pkgdesc='A file extractor for Counter-Strike: Online 2 and Titanfall Online (binary release)'
pkgver=2.0.5
pkgrel=1
arch=('x86_64')
url="https://github.com/L-Leite/UnCSO2"
license=('GPL3')
depends=('qt5-base')
_appimage=UnCSO2-$pkgver-linux64_gcc.AppImage
source=("$url/releases/download/v$pkgver/$_appimage")
sha256sums=('91527b05a5ff706df55e2f91a6d202ac48e2a604e98251a7dc5fbc8ef5e7af22')

prepare() {
  # Extract the AppImage
  chmod +x "./$_appimage"
  "./$_appimage" --appimage-extract
  # Edit the shortcut
  cd squashfs-root
  mv UnCSO2.desktop $_pkgname.desktop
  sed -i -E "s|Exec=uc2 %F|Exec=$_pkgname %F|g" $_pkgname.desktop
  sed -i -E "s|Icon=UnCSO2|Icon=$_pkgname|g" $_pkgname.desktop
}

package() {
  cd squashfs-root
  install -Dm644 README.md -t "$pkgdir/usr/share/doc/$_pkgname"
  install -Dm644 COPYING -t "$pkgdir/usr/share/licenses/$_pkgname"
  install -Dm644 UnCSO2.png "$pkgdir/usr/share/icons/hicolor/256x256/apps/$_pkgname.png"
  install -Dm644 $_pkgname.desktop -t "$pkgdir/usr/share/applications"
  install -Dm644 libcryptopp.so.8.3 -t "$pkgdir/usr/lib"
  install -Dm644 lib$_pkgname.so.1.1.3 -t "$pkgdir/usr/lib"
  install -Dm755 uc2 "$pkgdir/usr/bin/$_pkgname"
}
