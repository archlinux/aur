# Maintainer: begin-theadventure <begin-thecontact.ncncb at dralias dot com>
# Contributor: Fabrizio Pietrucci <bamlessnty5@gmail.com>
# Contributor: Zhiwei Chen <condy0919@gmail.com>

_pkgname=hotspot
pkgname=$_pkgname-appimage
pkgver=1.4.1
pkgrel=1
pkgdesc="The Linux perf GUI for performance analysis (AppImage release)"
arch=('x86_64')
url="https://github.com/KDAB/hotspot"
license=('GPL')
depends=('fuse2')
provides=($_pkgname)
conflicts=($_pkgname)
options=('!strip')
_appimage="$_pkgname-v$pkgver-x86_64.AppImage"
source=("$url/releases/download/v$pkgver/$_appimage")
sha256sums=('281c3e652285fad052a9af9d722c974940dbdc46d07e9727d35ed42d69c65f83')

prepare() {
  # Extract the AppImage
  chmod +x "$_appimage"
  ./"$_appimage" --appimage-extract
  chmod 755 squashfs-root
  # Create an exec file with an environment variable that disables AppImageLauncher integration
  echo env APPIMAGELAUNCHER_DISABLE=true /opt/$_pkgname/$_pkgname > $_pkgname
}

package() {
  cd squashfs-root
  for i in 16x16 22x22 32x32 48x48 64x64 512x512; do
    install -Dm644 usr/share/icons/hicolor/$i/apps/$_pkgname.png "$pkgdir/usr/share/icons/hicolor/$i/apps/$_pkgname.png"
  done
  install -Dm644 usr/share/applications/com.kdab.$_pkgname.desktop "$pkgdir/usr/share/applications/$_pkgname.desktop"
  install -Dm755 ../$_appimage "$pkgdir/opt/$_pkgname/$_pkgname"
  install -Dm755 ../$_pkgname -t "$pkgdir/usr/bin"
}
