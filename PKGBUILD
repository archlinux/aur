# Contributor: Zeph <zeph33@gmail.com>
# Maintainer: Zeph <zeph33@gmail.com>
pkgname=pamac-aur
_pkgver=6.0.3
pkgver=$_pkgver
pkgrel=3
pkgdesc="A Gtk3 frontend for libalpm"
arch=('any')
url="https://github.com/manjaro/pamac"
license=('GPL3')
depends=('glib2>=2.42' 'json-glib' 'libsoup' 'dbus-glib' 'polkit' 'vte3>=0.38' 'gtk3>=3.22'
         'libnotify' 'desktop-file-utils' 'pacman>=5.0' 'gnutls>=3.4'
         'appstream-glib' 'archlinux-appstream-data')

  optdepends=('polkit-gnome: needed for authentification in Cinnamon, Gnome'
              'lxsession: needed for authentification in Xfce, LXDE etc.'
              'pamac-tray-appindicator: tray icon for KDE')
makedepends=('gettext' 'itstool' 'vala>=0.36')
backup=('etc/pamac.conf')
conflicts=('pamac')
provides=('pamac')
options=(!emptydirs)
install=pamac.install

source=("pamac-$pkgver-$pkgrel.tar.gz::$url/archive/v$_pkgver.tar.gz"
        "01-fix-auto-update.patch::https://github.com/manjaro/pamac/commit/d53e98603a340becd33c05db09410447d4b73d93.patch"
        "02-fix-auto-update.patch::https://github.com/manjaro/pamac/commit/78b82572dc5bcbace11f637b3a185afbdc052730.patch")
sha256sums=('312aa6c932c90e2fc54aedbf88f6cc889007ff40c3e45654ec584687d6b7eac4'
            '9a8b868fc5184f2e7c92aa0788c9d4629f4cf9fa3ef218f2efb85de5144bf6d9'
            'f94d1ee1b13819e77e890ed2d9410d2dc01f5b11a32a3e06231925b9fb0512c8')

prepare() {
  cd "$srcdir/pamac-$_pkgver"
  # patches here
  patch -p1 -i "$srcdir/01-fix-auto-update.patch"
  patch -p1 -i "$srcdir/02-fix-auto-update.patch"

  # adjust version string
  sed -i -e "s|\"$_pkgver\"|\"$pkgver-$pkgrel\"|g" src/manager_window.vala
}

build() {
  cd "$srcdir/pamac-$_pkgver"

  # build
  make all
}

package() {
  cd "$srcdir/pamac-$_pkgver"
  make prefix="$pkgdir"/usr sysconfdir="$pkgdir"/etc install
  # delete timer no pamac-mirror for Arch Linux 
  rm "$pkgdir"/etc/systemd/system/multi-user.target.wants/pamac-mirrorlist.timer
}
# vim:set ts=2 sw=2 et:
