# Maintainer: Thomas Bork <tab.epic@gmail.com>
pkgname=pamac-classic
_pkgver=5.2.1
pkgver=$_pkgver
pkgrel=1
pkgdesc="A Gtk3 frontend for libalpm - classic version"
arch=('x86_64')
url="https://github.com/cromnix/pamac-classic"
license=('GPL3')
depends=('libsoup' 'dbus-glib' 'polkit' 'vte3>=0.38'
         'libnotify' 'pacman>=5.0')

  optdepends=('polkit-gnome: needed for authentification in Cinnamon, Gnome'
              'lxsession: needed for authentification in Xfce, LXDE etc.')
makedepends=('gettext' 'itstool' 'vala>=0.36')
backup=('etc/pamac.conf')
conflicts=('pamac' 'pamac-aur')
provides=('pamac' 'pamac-aur')
options=(!emptydirs)
install=pamac-classic.install

source=("pamac-classic-$pkgver-$pkgrel.tar.gz::$url/archive/v$_pkgver.tar.gz")
sha256sums=('e3b2c7c72a10b5a806c3b9eab86a2366054550b0f01c2f5b293ae0a1420f98cb')

prepare() {
  cd "$srcdir/pamac-classic-$_pkgver"
  # patches here

  # adjust version string
  sed -i -e "s|\"$_pkgver\"|\"$pkgver-$pkgrel\"|g" src/manager_window.vala
}

build() {
  cd "$srcdir/pamac-classic-$_pkgver"

  # build
  make all
}

package() {
  cd "$srcdir/pamac-classic-$_pkgver"
  make prefix="$pkgdir"/usr sysconfdir="$pkgdir"/etc install
  # delete timer no pamac-mirror for Arch Linux 
  rm "${pkgdir}/etc/systemd/system/multi-user.target.wants/pamac-mirrorlist.timer"
  # timers should not be enabled by default
  rm "${pkgdir}/etc/systemd/system/multi-user.target.wants/pamac-cleancache.timer"
}
