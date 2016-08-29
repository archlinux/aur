# Contributor: Zeph <zeph33@gmail.com>
# Maintainer: Zeph <zeph33@gmail.com>

pkgname=pamac-aur
pkgver=4.1.3
_pkgver=4.1.3
pkgrel=2
pkgdesc="A Gtk3 frontend for libalpm"
arch=('any')
url="https://github.com/manjaro/pamac"
license=('GPL3')
depends=('glib2>=2.42' 'json-glib' 'libsoup' 'dbus-glib' 'polkit' 'vte3>=0.38' 'gtk3>=3.18'
         'libnotify' 'desktop-file-utils' 'pacman>=5.0' 'gnutls>=3.4')
optdepends=('polkit-gnome: needed for authentification in Cinnamon, Gnome'
            'lxsession: needed for authentification in Xfce, LXDE etc.'
            'yaourt: needed for AUR support')
makedepends=('gettext' 'itstool' 'vala>=0.28')
backup=('etc/pamac.conf')
provides=('pamac')
conflicts=('pamac')
options=(!emptydirs)
install=pamac.install

source=("pamac-$pkgver-$pkgrel.tar.gz::https://github.com/manjaro/pamac/archive/v$_pkgver.tar.gz"
        "revert-d840b05.patch::https://github.com/manjaro/pamac/commit/d840b05e915335a300cede02dcaa3648be764fa1.patch")
sha256sums=('8324ee4e70279e543183ae754de0d50237fbb82cbf3caac6274a6eefc18f5aba'
            '5a5778c4ada8ddef128ce86fea17eecfb56e0d548218381e284323cac3e33644')
  
prepare() {
  # adjust version string
  cd "$srcdir/pamac-$_pkgver"
  sed -i -e "s|\"4.1.3\"|\"$pkgver-$pkgrel\"|g" src/transaction.vala 
  # patches here
  patch -Rp1 -i "$srcdir/revert-d840b05.patch"
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
