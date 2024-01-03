# Maintainer: begin-theadventure <begin-thecontact.ncncb at dralias dot com>
# Contributor: Dimitris Kiziridis <ragouel at outlook dot com>

_pkgname=liketaskmanager
pkgname=$_pkgname-bin
pkgver=2.3
pkgrel=2
pkgdesc="A Qt based process monitor that mimics the feel and functionality of Windows 10 Task Manager's performance and process tab under Linux (binary release)"
url='https://github.com/rejuce/LikeTaskManager'
arch=('x86_64')
license=('GPL3')
makedepends=('fuse2')
provides=("$_pkgname")
conflicts=("$_pkgname")
options=(!strip)
_appimage="LikeTaskManager-x86_64.AppImage-$pkgver.AppImage"
source=("$_appimage::$url/releases/download/v$pkgver/LikeTaskManager-x86_64.AppImage"
        "$_pkgname.png::$url/blob/v2.3/ram.png?raw=true")
sha256sums=('1353bf9a40bc817f65696d0d94fa9735c83a66e8f9cc0451d04e023239c55838'
            '841bac65852f05252b8870c8e667cd8a52474ba30a6ca082bbdfa4e0bbd63a07')

prepare() {
# Extract the AppImage
  chmod +x ./$_appimage
  ./$_appimage --appimage-extract
# Edit the shortcut
  cd squashfs-root/usr/share/applications
  sed -i -E "s|Exec=LikeTaskManager|Exec=$_pkgname|g" LikeTaskManager.desktop
  sed -i -E "s|Icon=Qticon|Icon=$_pkgname|g" LikeTaskManager.desktop
}

package() {
# Create a directory
  mkdir -p "$pkgdir/usr/bin"
# Install
  install -Dm644 $_pkgname.png -t "$pkgdir/usr/share/icons/hicolor/512x512/apps"
  cd squashfs-root/usr
  install -Dm644 share/applications/LikeTaskManager.desktop -t "$pkgdir/usr/share/applications"
  install -Dm755 bin/LikeTaskManager -t "$pkgdir/opt/LikeTaskManager/bin"
  ln -s /opt/LikeTaskManager/bin/LikeTaskManager "$pkgdir/usr/bin/$_pkgname"
  mv lib plugins "$pkgdir/opt/LikeTaskManager"
  find "$pkgdir/opt/LikeTaskManager" -type d -exec chmod 755 {} +
  find "$pkgdir/opt/LikeTaskManager" -type f -exec chmod o-w {} +
}
