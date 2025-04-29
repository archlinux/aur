# Maintainer: begin-theadventure <begin-thecontact.ncncb at dralias dot com>

_pkgname=gfn-electron
pkgname=$_pkgname-bin
pkgver=2.2.0
pkgrel=2
pkgdesc="Linux Desktop client for Nvidia's GeForce NOW game streaming service (binary release)"
url="https://github.com/hmlendea/gfn-electron"
license=('GPL-3.0-only')
arch=('x86_64')
depends=("alsa-lib" "at-spi2-core" "cairo" "dbus" "expat" "gcc-libs" "glib2" "gtk3" "hicolor-icon-theme"
         "libcups" "libdrm" "libx11" "libxcb" "libxcomposite" "libxdamage" "libxext" "libxfixes"
         "libxkbcommon" "libxrandr" "mesa" "nspr" "nss" "pango")
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("$url/releases/download/v$pkgver/geforcenow-electron_${pkgver}_linux.zip")
sha256sums=('ec62644e6f94eb4919c0895f73736b2074686c829144506162be38074ef1da2a')

prepare() {
# Edit the shortcut
  mv com.github.hmlendea.geforcenow-electron.desktop $_pkgname.desktop
  sed -i -E "s|Exec=/opt/geforcenow-electron/geforcenow-electron|Exec=/opt/$_pkgname/$_pkgname|g" $_pkgname.desktop
  sed -i -E "s|Icon=nvidia|Icon=$_pkgname|g" $_pkgname.desktop
}

package() {
# Create directories
  mkdir -p "$pkgdir/opt/$_pkgname" "$pkgdir/usr/bin"
# Install and clean up
  mv geforcenow-electron $_pkgname
  install -Dm644 $_pkgname.desktop "$pkgdir/usr/share/applications/$_pkgname.desktop"
  cd resources/app
  install -Dm644 icon.png "$pkgdir/usr/share/icons/hicolor/512x512/apps/$_pkgname.png"
  install -Dm644 README.md screenshot.png -t "$pkgdir/usr/share/doc/$_pkgname"
  install -Dm644 LICENSE.md -t "$pkgdir/usr/share/licenses/$_pkgname"
  rm -dr "$srcdir/$_pkgname.desktop" "$srcdir/geforcenow-electron_${pkgver}_linux.zip" ../app-update.yml .vscode icon.png LICENSE.md README.md screenshot.png
  cd "$srcdir"
  mv * "$pkgdir/opt/$_pkgname"
  ln -s /opt/$_pkgname/$_pkgname "$pkgdir/usr/bin/$_pkgname"
  ln -s /opt/$_pkgname/$_pkgname "$pkgdir/usr/bin/geforcenow-electron"
}
