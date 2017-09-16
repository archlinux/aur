# Maintainer: Frederic Bezies <fredbezies at gmail dot com> 
# Contributor: Zeph <zeph33@gmail.com>
# Based on the PKGBUILD created by Zeph <zeph33@gmail.com>

pkgname=('pamac-aur-git' 'pamac-aur-tray-appindicator-git')
_pkgname=pamac
pkgver=v6.0.0.r3.gb2f8cb6
_pkgver=6.0
pkgrel=1
pkgdesc="A Gtk3 frontend for libalpm - git version"
arch=('any')
url="https://github.com/manjaro/pamac"
license=('GPL3')
depends=('glib2>=2.42' 'json-glib' 'libsoup' 'dbus-glib' 'polkit' 'vte3>=0.38' 'gtk3>=3.22' 'libnotify' 'desktop-file-utils' 'pacman>=5.0' 'pacman<5.1' 'gnutls>=3.4' 'appstream-glib' 'archlinux-appstream-data' 'libappindicator-gtk3')
optdepends=('polkit-gnome: needed for authentification in Cinnamon, Gnome'
              'lxsession: needed for authentification in Xfce, LXDE etc.'
              'pamac-tray-appindicator: tray icon for KDE')
makedepends=('gettext' 'itstool' 'vala>=0.36')
options=(!emptydirs)

source=(git+https://github.com/manjaro/pamac.git)
sha256sums=('SKIP')

pkgver() {
	cd $_pkgname
  git describe --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  # adjust version string
  cd "$_pkgname"
  sed -i -e "s|\"$_pkgver\"|\"$pkgver-$pkgrel\"|g" src/manager_window.vala
  # patches here
}

build() {
  cd "$_pkgname"

  # build
  make all
}

#package() {
#  cd "$_pkgname"
#  make prefix="$pkgdir"/usr sysconfdir="$pkgdir"/etc install
#}

package_pamac-aur-git() {
  optdepends=('polkit-gnome: needed for authentification in Cinnamon, Gnome'
              'lxsession: needed for authentification in Xfce, LXDE etc.'
              'pamac-dev-tray-appindicator-git: tray icon for KDE')
  conflicts=('pamac' 'pamac-aur')
  provides=('pamac' 'pamac-aur')
  backup=('etc/pamac.conf')
  replaces=('pamac-aur')
  install=pamac.install
  cd "$_pkgname"
  make prefix="$pkgdir"/usr sysconfdir="$pkgdir"/etc install
}

package_pamac-aur-tray-appindicator-git() {
  pkgdesc="Tray icon using appindicator which feets better in KDE - git version"
  depends=('pamac-aur-git' 'libappindicator-gtk3')
  conflicts=('pamac-tray-appindicator')
  provides=('pamac-tray-appindicator')
  cd "$_pkgname"
  make use_appindicator=true
  make prefix="$pkgdir"/usr sysconfdir="$pkgdir"/etc install_pamac-tray-appindicator
}

# vim:set ts=2 sw=2 et:
