# Maintainer: asafelobotomy <213836723+asafelobotomy@users.noreply.github.com>
#
# ReShadeLinux from its release AppImage, unpacked (no FUSE needed).

pkgname=reshadelinux-bin
_name=reshadelinux
pkgver=1.4.1
pkgrel=1
pkgdesc='Installs the official ReShade runtime for Wine and Proton games'
arch=('x86_64')
url='https://github.com/asafelobotomy/reshadelinux'
license=('GPL-2.0-or-later')
depends=('bash' 'curl' 'git' '7zip' 'yad' 'hicolor-icon-theme')
optdepends=('libnotify: desktop notifications when an install finishes')
provides=("$_name")
conflicts=("$_name")
options=('!strip' '!debug')
source=("$_name-$pkgver-x86_64.AppImage::$url/releases/download/v$pkgver/$_name-$pkgver-x86_64.AppImage")
sha256sums=('974b66a99d9c3447161a111a61deca49381d587330494dedc627107e64ec0bae')

prepare() {
  chmod +x "$_name-$pkgver-x86_64.AppImage"
  rm -rf squashfs-root
  "./$_name-$pkgver-x86_64.AppImage" --appimage-extract >/dev/null
}

package() {
  install -d "$pkgdir/opt/$_name"
  cp -a squashfs-root/. "$pkgdir/opt/$_name/"
  find "$pkgdir/opt/$_name" -type d -exec chmod 755 {} +
  install -d "$pkgdir/usr/bin"
  ln -s "/opt/$_name/AppRun" "$pkgdir/usr/bin/$_name"
  sed "s|^Exec=.*|Exec=$_name|" "squashfs-root/io.github.asafelobotomy.$_name.desktop" |
    install -Dm644 /dev/stdin "$pkgdir/usr/share/applications/io.github.asafelobotomy.$_name.desktop"
  install -Dm644 "squashfs-root/$_name.png" "$pkgdir/usr/share/icons/hicolor/256x256/apps/$_name.png"
  install -Dm644 -t "$pkgdir/usr/share/metainfo" "squashfs-root/io.github.asafelobotomy.$_name.metainfo.xml"
}
