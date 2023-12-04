# Maintainer: begin-theadventure <begin-thecontact.ncncb at dralias dot com>

_pkgname=audius-client
pkgname=$_pkgname-bin
pkgver=1.5.53
pkgrel=1
pkgdesc="The Decentralized Audius.co Client (binary release, system Electron)"
url="https://github.com/AudiusProject/audius-protocol/tree/main/packages/web"
arch=('x86_64')
license=('Apache2')
depends=('electron')
makedepends=('fuse2')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("https://download.audius.co/Audius-$pkgver.AppImage")
sha256sums=('37c838a2dde96ac06806967e9b56189a99349377a7f5cff0dd2a1859a3e656a4')

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
  install -Dm755 $_pkgname -t "$pkgdir/usr/bin"
  cd squashfs-root
  mv resources/* "$pkgdir/usr/lib/$_pkgname"
  for i in 16 32 48 64 128 256 512 1024; do
    install -Dm644 usr/share/icons/hicolor/${i}x${i}/apps/$_pkgname.png -t "$pkgdir/usr/share/icons/hicolor/${i}x${i}/apps"
  done
  install -Dm644 $_pkgname.desktop -t "$pkgdir/usr/share/applications"
# Fix permissions
  chmod -R 755 "$pkgdir/usr/lib/$_pkgname/app.asar.unpacked"
}
