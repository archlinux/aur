# Maintainer: Nathan Lowe <techwiz96@gmail.com>
# Upstream URL: https://github.com/stanfieldr/ghetto-skype
#
# Based off of the PKGBUILD for atom-editor
# https://aur.archlinux.org/packages/atom-editor/
#
# For improvements/fixes to this package, please send a pull request:
# https://github.com/techwiz24/aur-ghetto-skype

pkgname=ghetto-skype
pkgver=1.0.1
pkgrel=2
pkgdesc='Web Skype + Tray Icon + Notifications'
arch=('x86_64')
url='https://github.com/stanfieldr/ghetto-skype'
license=('GPLv3')
depends=('libappindicator-gtk2')
provides=('skype')
conflicts=('skype')
depends=('electron')
makedepends=('git' 'npm')
install=ghetto-skype.install
source=("https://github.com/stanfieldr/ghetto-skype/archive/v${pkgver}.tar.gz")
sha256sums=('191de6e42f16f6b4d90550073247f6745faa7626f3e09dd60821b5c48bec6892')

prepare() {
  cd "ghetto-skype-$pkgver"

  echo "Patching browser-window dependency for use with electron-prebuilt..."
  patch --silent main.js < ../../main.js.patch

  echo "Patching the desktop shortcut to use electron-prebuilt..."
  sed -i 's|^Exec=npm --prefix /opt/ghetto-skype start$|Exec=/usr/bin/ghetto-skype|g' assets/skype.desktop
}

package() {
  mkdir -p "$pkgdir/opt/ghetto-skype"
  cp -a "$srcdir/ghetto-skype-$pkgver/." "$pkgdir/opt/ghetto-skype"

  install -Dm644 "$srcdir/ghetto-skype-$pkgver/assets/skype.desktop" "$pkgdir/usr/share/applications/ghetto-skype.desktop"
  install -Dm644 "$srcdir/ghetto-skype-$pkgver/assets/tray/skype.png" "$pkgdir/usr/share/pixmaps/ghetto-skype.png"
  install -Dm644 "$srcdir/ghetto-skype-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  find "${pkgdir}" -type d -exec chmod 755 {} +
  find "${pkgdir}" -type f -exec chmod 644 {} +

  install -Dm777 "$srcdir/../ghetto-skype" "$pkgdir/usr/bin/ghetto-skype"
}
