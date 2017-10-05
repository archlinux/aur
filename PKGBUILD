# Maintainer: Thomas Bork <tab.epic@gmail.com>
pkgname=pamac-classic
_pkgver=5.2.0
pkgver=$_pkgver
pkgrel=1
pkgdesc="A Gtk3 frontend for libalpm - classic version"
arch=('x86_64')
url="https://github.com/cromnix/pamac-classic"
license=('GPL3')
depends=('glib2>=2.42' 'json-glib' 'libsoup' 'dbus-glib' 'polkit' 'vte3>=0.38' 'gtk3>=3.22'
         'libnotify' 'desktop-file-utils' 'pacman>=5.0' 'gnutls>=3.4')

  optdepends=('polkit-gnome: needed for authentification in Cinnamon, Gnome'
              'lxsession: needed for authentification in Xfce, LXDE etc.')
makedepends=('gettext' 'itstool' 'vala>=0.36')
backup=('etc/pamac.conf')
conflicts=('pamac' 'pamac-aur')
provides=('pamac' 'pamac-aur')
options=(!emptydirs)
install=pamac-classic.install

source=("pamac-classic-$pkgver-$pkgrel.tar.gz::$url/archive/v$_pkgver.tar.gz")
sha256sums=('ce291b8fbbfdbd92a52d7ddb4a582e5af149036fd8ad07f9e8000b3e189a5ea8')

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
