# Maintainer: begin-theadventure <begin-thecontact.ncncb at dralias dot com>

_pkgname=audius-client
pkgname=$_pkgname-bin
pkgver=1.5.41
pkgrel=2
pkgdesc="The Decentralized Audius.co Client (binary release)"
url="https://github.com/AudiusProject/audius-protocol/tree/main/packages/web"
license=('Apache2')
arch=('x86_64')
depends=('electron')
makedepends=('fuse2')
provides=($_pkgname)
conflicts=($_pkgname)
source=("https://download.audius.co/Audius-1.5.41.AppImage")
sha256sums=('00bedc6a1c4cea97995fe2542e4aadaef95b4d4926823968071c4348d8a997ba')

prepare() {
  # Create an exec file
  echo -e "export ELECTRON_IS_DEV=0\n\
cd /usr/lib/$_pkgname\n\
exec electron /usr/lib/$_pkgname/app.asar \$@" > $_pkgname
  # Extract the AppImage
  chmod +x "./Audius-$pkgver.AppImage"
  "./Audius-$pkgver.AppImage" --appimage-extract
  # Edit the shortcut
  cd squashfs-root
  sed -i '/X-AppImage-Version/d' $_pkgname.desktop
  sed -i -E "s|Exec=AppRun --no-sandbox %U|Exec=$_pkgname %U|g" $_pkgname.desktop
  # Remove the updater
  cd resources
  rm app-update.yml
}

package() {
  # Create a folder
  mkdir -p "$pkgdir/usr/lib/$_pkgname"
  # Install
  cd squashfs-root
  mv resources/* "$pkgdir/usr/lib/$_pkgname"
  for i in 16 32 48 64 128 256 512 1024; do
    install -Dm644 usr/share/icons/hicolor/${i}x${i}/apps/$_pkgname.png -t "$pkgdir/usr/share/icons/hicolor/${i}x${i}/apps"
  done
  install -Dm644 $_pkgname.desktop -t "$pkgdir/usr/share/applications"
  install -Dm755 ../$_pkgname -t "$pkgdir/usr/bin"
}
