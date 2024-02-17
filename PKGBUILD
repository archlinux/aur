# Maintainer: begin-theadventure <begin-thecontact.ncncb at dralias dot com>

_pkgname=audius-client
pkgname=$_pkgname-bin
pkgver=1.5.55
pkgrel=1
pkgdesc="The Decentralized Audius.co Client (binary release, system Electron)"
url="https://github.com/AudiusProject/audius-protocol/tree/main/packages/web"
license=('Apache-2.0')
arch=('x86_64')
depends=('electron')
makedepends=('fuse2')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("https://download.audius.co/Audius-$pkgver.AppImage")
sha256sums=('97cd3b9abd9322da7f9f41c7184fa42d40fcdf504b59e389e012782b16f71f45')

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
# Create a directory
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
