# Maintainer: Frederic Bezies <fredbezies at gmail dot com> 
# Contributor: Zeph <zeph33@gmail.com>
# Based on the PKGBUILD created by Zeph <zeph33@gmail.com>

pkgname=('pamac-aur-git' 'pamac-aur-tray-appindicator-git') 
_pkgname=pamac
pkgver=v6.1.1
_pkgver=6.1
pkgrel=1
pkgdesc="A Gtk3 frontend for libalpm - git version"
arch=('any')
url="https://github.com/manjaro/pamac"
license=('GPL3')
depends=('glib2>=2.42' 'json-glib' 'libsoup' 'dbus-glib' 'polkit' 'vte3>=0.38' 'gtk3>=3.22' 'libnotify' 'desktop-file-utils' 'pacman>=5.0' 'pacman<5.1' 'gnutls>=3.4' 'appstream-glib' 'archlinux-appstream-data' 'libappindicator-gtk3')
optdepends=('polkit-gnome: needed for authentification in Cinnamon, Gnome'
              'lxsession: needed for authentification in Xfce, LXDE etc.')
              #'pamac-tray-appindicator-git: tray icon for KDE')
makedepends=('gettext' 'itstool' 'vala>=0.36' 'meson' 'ninja')
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
  rm -rf _build
  /usr/bin/meson _build --prefix=/usr --sysconfdir=/etc
  ninja -C _build
}

package_pamac-aur-git() {
  optdepends=('polkit-gnome: needed for authentification in Cinnamon, Gnome'
              'lxsession: needed for authentification in Xfce, LXDE etc.')
              #'pamac-dev-tray-appindicator-git: tray icon for KDE')
  conflicts=('pamac' 'pamac-aur' 'pamac-aur-tray-appindicator-git')
  provides=('pamac' 'pamac-aur')
  backup=('etc/pamac.conf')
  replaces=('pamac-aur')
  install=pamac.install
  cd "$_pkgname"
  env DESTDIR="$pkgdir" ninja -C _build install
}

package_pamac-aur-tray-appindicator-git() {
  pkgdesc="Pamac and tray icon using appindicator which feets better in KDE - git version"
  depends=('libappindicator-gtk3')
  conflicts=('pamac-aur-git pamac-aur pamac-tray-appindicator')
  provides=('pamac-aur pamac-tray-appindicator')
  cd "$_pkgname"

 # Adding a modified meson_options file to enable appindicator build
 # -> set enable-appindicator to true !
 # I know it is a dirty workaround :(
 # Until a new revision, pamac-aur and pamac-aur-tray-appindicator-git will
 # enter in conflict... Thanks to meson build process ?!
 
  rm -rf _build
  echo "option('enable-appindicator', type : 'boolean', value : true, description : 'tray icon using appindicator')" >> meson_options.txt 
  /usr/bin/meson _build --prefix=/usr --sysconfdir=/etc 
  ninja -C _build
  env DESTDIR="$pkgdir" ninja -C _build install

  # Copying missing desktop file
  install -Dm644 $srcdir/$_pkgname/data/applications/pamac-tray-appindicator.desktop $pkgdir/usr/share/applications/
}

# vim:set ts=2 sw=2 et:


