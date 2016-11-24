# Contributor: Zeph <zeph33@gmail.com>
# Maintainer: Zeph <zeph33@gmail.com>
pkgname=pamac-aur
pkgver=4.1.6
_pkgver=4.1.6
pkgrel=2
pkgdesc="A Gtk3 frontend for libalpm"
arch=('any')
url="https://github.com/manjaro/pamac"
license=('GPL3')
depends=('glib2>=2.42' 'json-glib' 'libsoup' 'dbus-glib' 'polkit' 'vte3>=0.38' 'gtk3>=3.18'
         'libnotify' 'desktop-file-utils' 'pacman>=5.0' 'gnutls>=3.4')
  optdepends=('polkit-gnome: needed for authentification in Cinnamon, Gnome'
              'lxsession: needed for authentification in Xfce, LXDE etc.'
              'yaourt: needed for AUR support'
              'pamac-tray-appindicator: tray icon for KDE')
makedepends=('gettext' 'itstool' 'vala>=0.28')
backup=('etc/pamac.conf')
conflicts=('pamac')
provides=('pamac')
options=(!emptydirs)
install=pamac.install

source=("pamac-$pkgver-$pkgrel.tar.gz::https://github.com/manjaro/pamac/archive/v$_pkgver.tar.gz"
        "aur-search.patch::https://github.com/manjaro/pamac/commit/9bcd61cfb7228f8318c5c8b95e8a78436d51e156.patch")
sha256sums=('5413dd62aeb1744820c3f5d7a7a25fa435dd3618b04beb809e9bb9c7575fa8e0'
            'a568258f5116a7dd1a41a1586654ed5275f58abf06c70a4e7886699489a08b11')
  
prepare() {
  # adjust version string
  cd "$srcdir/pamac-$_pkgver"
  sed -i -e "s|\"$_pkgver\"|\"$pkgver-$pkgrel\"|g" src/transaction.vala
  # patches here
  patch -p1 -i "$srcdir/aur-search.patch"
}

build() {
  cd "$srcdir/pamac-$_pkgver"

  # build
  make all
}

package() {
  cd "$srcdir/pamac-$_pkgver"
  make prefix="$pkgdir"/usr sysconfdir="$pkgdir"/etc install
}
# vim:set ts=2 sw=2 et:
