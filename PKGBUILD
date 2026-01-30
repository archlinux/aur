# Maintainer: begin-theadventure <begin-thecontact.ncncb at dralias dot com>
# Contributor: Dimitris Kiziridis <ragouel at outlook dot com>

_pkgname=liketaskmanager
pkgname=$_pkgname-bin
pkgver=3.1.0
pkgrel=1
pkgdesc="App that should mimic the functionality and feel of Windows Task Manager Perfomance Tab (binary release)"
url='https://github.com/rejuce/LikeTaskManager'
arch=('x86_64')
license=('GPL-3.0-or-later')
makedepends=('fuse2')
provides=("$_pkgname")
conflicts=("$_pkgname")
_appimage="LikeTaskManager-x86_64.AppImage-$pkgver.AppImage"
source=("$_appimage::$url/releases/download/v$pkgver/LikeTaskManager-x86_64.AppImage"
        "$_pkgname.png::$url/blob/v2.3/ram.png?raw=true")
sha256sums=('a8789f89ff96c0c5a5fa9f2ba373410ef9020b2ddc52b4efe65be4243e57b325'
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
}
