# Maintainer: Jason Scurtu <jscurtu@gmail.com>
# Contributor: Zeph <zeph33@gmail.com>

pkgname=pamac-patched-headerbar
pkgver=3.2.0
_pkgver=3.2.0
pkgrel=1
# This is the release package so the below _gitcommit variable should (usually) be commented out.
#_gitcommit="d8e9826ab0b84bdb6f4b6c0dcc4ce1461bf04595"
pkgdesc="A Gtk3 frontend for libalpm, patched by me to use GtkHeaderBar to match GNOME"
arch=('i686' 'x86_64')
url="https://github.com/manjaro/pamac"
license=('GPL3')
depends=('glib2>=2.42' 'json-glib' 'libsoup' 'dbus-glib' 'polkit' 'vte3>=0.38' 'gtk3>=3.16'
         'libnotify' 'desktop-file-utils' 'pacman>=4.2' 'gnutls>=3.4')
optdepends=('polkit-gnome: needed for authentification in Cinnamon, Gnome'
            'lxsession: needed for authentification in Xfce, LXDE etc.'
            'yaourt: needed for AUR support')
makedepends=('gettext' 'itstool' 'vala>=0.28')
backup=('etc/pamac.conf')
provides=('pamac')
conflicts=('pamac')
options=(!emptydirs)
install=pamac.install

if [ "${_gitcommit}" != "" ]; then
  source=("pamac-$pkgver-$pkgrel.tar.gz::$url/archive/$_gitcommit.tar.gz" headerbar.patch)
else
  source=("pamac-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz" headerbar.patch)
fi

sha256sums=('13c5eaaa0b1302e59542a6ca922f305ee5312c017763d05eb7b21d484a40b152'
            'fb9e8d967c7f5955e3dafd8ab2aaae86d55acd3c73336e582ed0bd3d92f1a39a')

prepare() {
  if [ "$_gitcommit" != "" ]; then
    mv "$srcdir/pamac-$_gitcommit" "$srcdir/pamac-$pkgver"
  fi

  # adjust version string
  cd "$srcdir/pamac-$pkgver/src"
  sed -i -e "s|\"$_pkgver\"|\"$pkgver-$pkgrel\"|g" manager_window.vala
  cd "$srcdir/pamac-$pkgver/"
  # patches here
  patch -p1 -i $srcdir/headerbar.patch
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