# Contributor: Zeph <zeph33@gmail.com>
# Maintainer: Zeph <zeph33@gmail.com>
pkgbase=pamac-aur
pkgname=('pamac-aur' 'pamac-aur-tray-appindicator')
pkgver=4.1.4
_pkgver=4.1.4
pkgrel=2
pkgdesc="A Gtk3 frontend for libalpm"
arch=('any')
url="https://github.com/manjaro/pamac"
license=('GPL3')
depends=('glib2>=2.42' 'json-glib' 'libsoup' 'dbus-glib' 'polkit' 'vte3>=0.38' 'gtk3>=3.18'
         'libnotify' 'desktop-file-utils' 'pacman>=5.0' 'gnutls>=3.4')
makedepends=('gettext' 'itstool' 'vala>=0.28')
options=(!emptydirs)

source=("pamac-$pkgver-$pkgrel.tar.gz::https://github.com/manjaro/pamac/archive/v$_pkgver.tar.gz")
sha256sums=('edd0c0ee836be6c572f1bbaf5852324754ec9f574e003e6efe828ebeaaeaff65')
  
prepare() {
  # adjust version string
  cd "$srcdir/pamac-$_pkgver"
  sed -i -e "s|\"4.1.4\"|\"$pkgver-$pkgrel\"|g" src/transaction.vala
  # patches here
}

build() {
  cd "$srcdir/pamac-$_pkgver"

  # build
  make all
}

package_pamac-aur() {
  optdepends=('polkit-gnome: needed for authentification in Cinnamon, Gnome'
              'lxsession: needed for authentification in Xfce, LXDE etc.'
              'yaourt: needed for AUR support'
              'pamac-dev-tray-appindicator: tray icon for KDE')
  backup=('etc/pamac.conf')
  conflicts=('pamac')
  provides=('pamac')
  install=pamac.install
  cd "$srcdir/pamac-$_pkgver"
  make prefix="$pkgdir"/usr sysconfdir="$pkgdir"/etc install
}

package_pamac-aur-tray-appindicator() {
  pkgdesc="Tray icon using appindicator which feets better in KDE"
  depends=('pamac-aur' 'libappindicator-gtk3')
  provides=('pamac-tray-appindicator')
  conflicts=('pamac-tray-appindicator')
  cd "$srcdir/pamac-$_pkgver"
  make use_appindicator=true
  install -Dm755 src/pamac-tray-appindicator "$pkgdir"/usr/bin/pamac-tray-appindicator
  install -Dm644 data/applications/pamac-tray-appindicator.desktop "$pkgdir"/etc/xdg/autostart/pamac-tray-appindicator.desktop
}
# vim:set ts=2 sw=2 et:
