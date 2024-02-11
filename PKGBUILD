# Maintainer: David Germain <davi.germain@laposte.net>

pkgname=mod-desktop-bin
provides=(${pkgname//-bin/""})
pkgver=0.0.9
pkgrel=4
pkgdesc="MOD Desktop Application"
arch=('x86_64')
url="https://github.com/moddevices/mod-desktop"
license=('AGPLv3+')
conflicts=("$provides" "$provides-git")

source=("$provides-$pkgver-linux-$arch.tar.xz::$url/releases/download/$pkgver/$provides-$pkgver-linux-$arch.tar.xz")

sha256sums=('5ede4c3501a33979881cbff435273b60923c20c4f5ba4120f06e50b9398cd091')

package() {
  # Replace the path in mod-desktop.desktop
  sed -i 's|Exec=bash -c '\''$(dirname "%k")/mod-desktop.run'\''|Exec=/opt/mod-desktop/mod-desktop|' "$srcdir/$provides-$pkgver-linux-$arch/$provides.desktop"

  # Install to /opt
  install -d "$pkgdir/opt/$provides"
  cp -r "$srcdir/$provides-$pkgver-linux-$arch/$provides"/* "$pkgdir/opt/$provides/"

  # Install desktop file from the extracted archive
  install -Dm644 "$provides-$pkgver-linux-$arch/mod-desktop.desktop" "$pkgdir/usr/share/applications/$provides.desktop"

  # Create a symbolic link for the executable in a directory included in $PATH
  install -Dm755 "/opt/$provides/mod-desktop" "$pkgdir/usr/bin/mod-desktop"

}
