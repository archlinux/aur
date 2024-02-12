# Maintainer: David Germain <davi.germain@laposte.net>

pkgname=mod-desktop-network-bin
provides=(${pkgname//-network-bin/""})
pkgver=0.0.10
pkgrel=3
pkgdesc="MOD Desktop Application with network access to mod-ui"
arch=('x86_64')
url="https://github.com/moddevices/mod-desktop"
license=('AGPLv3+')
conflicts=("$provides" "$provides-git")

source=("$provides-$pkgver-linux-$arch.tar.xz::$url/releases/download/$pkgver/$provides-$pkgver-linux-$arch.tar.xz")

sha256sums=('f58ddb42f90b4c2add17d288e9e6fb5ccd261edf92ecfe5bc5df64ebd8f6cbf4')

package() {
  # Replace the path in mod-desktop.desktop
  sed -i 's|Exec=bash -c '\''$(dirname "%k")/mod-desktop.run'\''|Exec=/opt/mod-desktop/mod-desktop|' "$srcdir/$provides-$pkgver-linux-$arch/$provides.desktop"

  # Install to /opt
  install -d "$pkgdir/opt/$provides"
  cp -r "$srcdir/$provides-$pkgver-linux-$arch/$provides"/* "$pkgdir/opt/$provides/"


  # Install desktop file from the extracted archive
  install -Dm644 "$provides-$pkgver-linux-$arch/mod-desktop.desktop" "$pkgdir/usr/share/applications/$provides.desktop"

  # Network access patch
  sed -i 's/application.listen(DEVICE_WEBSERVER_PORT, address=("127.0.0.1" if DESKTOP else "0.0.0.0"))/application.listen(DEVICE_WEBSERVER_PORT, address=("0.0.0.0"))/' "$pkgdir/opt/$provides/mod/webserver.py"

}
