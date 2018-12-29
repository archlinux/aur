# Maintainer: Frederic Bezies <fredbezies at gmail dot com> 
# Contributor: Zeph <zeph33@gmail.com>
# Based on the PKGBUILD created by Zeph <zeph33@gmail.com>

pkgname=('pamac-aur-git' 'pamac-aur-tray-appindicator-git') 
_pkgname=pamac
pkgver=7.3.3.r2.gb257d71
_pkgver=7.3.3
pkgrel=1
pkgdesc="A Gtk3 frontend for libalpm - git version"
arch=('i686' 'x86_64' 'arm' 'armv6h' 'armv7h' 'aarch64')
url="https://gitlab.manjaro.org/applications/pamac"
license=('GPL3')
depends=('dbus-glib' 'polkit' 'vte3>=0.38' 'libnotify' 'pacman>=5.1' 'pacman<5.2' 'appstream-glib' 'archlinux-appstream-data' 'libappindicator-gtk3' 'git')
optdepends=('polkit-gnome: needed for authentification in Cinnamon, Gnome'
            'lxsession: needed for authentification in Xfce, LXDE etc.'
            'pamac-aur-tray-appindicator-git: tray icon for KDE')
makedepends=('gettext' 'itstool' 'vala' 'meson' 'ninja' 'gobject-introspection')
options=(!emptydirs)
# Only for Manjaro users who should not use it...
provides=('pamac')
replaces=('pamac')
conflicts=('pamac')
# End of Manjaro users section
source=(git+https://gitlab.manjaro.org/applications/$_pkgname.git)
sha256sums=('SKIP')

pkgver() {
  cd $_pkgname
  git describe --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g' | cut -c2-48

}

prepare() {
  # adjust version string
  cd $_pkgname
  sed -i -e "s|\"$_pkgver\"|\"$pkgver-$pkgrel\"|g" src/manager_window.vala
  # patches here
}

build() {
  cd $_pkgname
  mkdir -p builddir
  cd builddir
  meson --prefix=/usr --sysconfdir=/etc -Denable-appindicator=true
  # build
  ninja
}

package_pamac-aur-git() {
  backup=('etc/pamac.conf')
  conflicts=('pamac-aur')
  replaces=('pamac-aur')
  install=pamac.install
  cd $_pkgname
  cd builddir
  DESTDIR="$pkgdir" ninja install
  # removed pamac-mirrorlist-timer, useless for Archlinux
  # remove pamac-tray-appindicator
  rm "$pkgdir/usr/bin/pamac-tray-appindicator"
  rm "$pkgdir/etc/xdg/autostart/pamac-tray-appindicator.desktop"
}

package_pamac-aur-tray-appindicator-git() {
  pkgdesc="Tray icon using appindicator which fits better in KDE - git version"
  conflicts=('pamac-aur-tray-indicator')
  replaces=('pamac-aur-tray-indicator')
  depends=('pamac-aur-git' 'libappindicator-gtk3')
  cd $_pkgname
  install -Dm755 "builddir/src/pamac-tray-appindicator" "$pkgdir/usr/bin/pamac-tray-appindicator"
  install -Dm644 "data/applications/pamac-tray-appindicator.desktop" "$pkgdir/etc/xdg/autostart/pamac-tray-appindicator.desktop"
}

# vim:set ts=2 sw=2 et:


