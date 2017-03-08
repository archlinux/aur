# Original package:
# Contributor: Zeph <zeph33@gmail.com>
# Maintainer: Zeph <zeph33@gmail.com>

# Patched package:
# Maintainer: Rick <rick.2889@gmail.com>

pkgname=pamac-pacaur
pkgver=4.3.0
_pkgver=4.3.0
pkgrel=1
pkgdesc="A Gtk3 frontend for libalpm patched to work with pacaur"
arch=('any')
url="https://github.com/manjaro/pamac"
license=('GPL3')
depends=('glib2>=2.42' 'json-glib' 'libsoup' 'dbus-glib' 'polkit' 'vte3>=0.38' 'gtk3>=3.18'
         'libnotify' 'desktop-file-utils' 'gnutls>=3.4' 'pacman'
         'shared-mime-info' 'desktop-file-utils' 'gtk-update-icon-cache')
optdepends=('polkit-gnome: needed for authentication in Cinnamon, Gnome'
            'lxsession: needed for authentication in Xfce, LXDE, etc.'
            'pacaur: needed for AUR support'
            'pamac-tray-appindicator: tray icon for KDE')
makedepends=('gcc' 'gettext' 'itstool' 'vala>=0.28')
backup=('etc/pamac.conf')
provides=('pamac')
conflicts=('pamac')
options=(!emptydirs)
install=pamac.install

source=("pamac-$pkgver-$pkgrel.tar.gz::https://github.com/manjaro/pamac/archive/v$_pkgver.tar.gz")
sha512sums=('a7c226195504a3b17e6c7b7b48d6b29cd2aff52e20deef32ac85a89d3aa9ce07521910e320e44c6e4092cb4fe2e10b1310a161de800463ae15d7f8cde8395328')

prepare() {
  # adjust version string
  cd "$srcdir/pamac-$_pkgver"
  sed -i -e "s|\"$pkgver\"|\"$pkgver-$pkgrel\"|g" src/transaction.vala 
  # patches here
  sed -i -e "s/yaourt/pacaur/g" src/transaction.vala
  sed -i -e "s/yaourt/pacaur/g" src/preferences_dialog.vala
  sed -i -e "s/yaourt/pacaur/g" src/manager_window.vala
}

build() {
  cd "$srcdir/pamac-$pkgver"

  # build
  make all
}

package() {
  cd "$srcdir/pamac-$pkgver"
  make prefix="$pkgdir"/usr sysconfdir="$pkgdir"/etc install
}

# vim:set ts=2 sw=2 et:
