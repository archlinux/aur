# Original package:
# Contributor: Zeph <zeph33@gmail.com>
# Maintainer: Zeph <zeph33@gmail.com>

# Patched package:
# Maintainer: Rick <rick.2889@gmail.com>

pkgname=pamac-pacaur
pkgver=3.2.1
_pkgver=3.2.1
pkgrel=1
# This is the release package so the below _gitcommit variable should (usually) be commented out.
#_gitcommit="7266a5766441725210e7e4af3ee7da501cf0e38f"
pkgdesc="A Gtk3 frontend for libalpm patched to work with pacaur"
arch=('any')
url="https://github.com/Yoshi2889/pamac"
license=('GPL3')
depends=('glib2>=2.42' 'json-glib' 'libsoup' 'dbus-glib' 'polkit' 'vte3>=0.38' 'gtk3>=3.18'
         'libnotify' 'desktop-file-utils' 'pacman>=5.0' 'gnutls>=3.4')
optdepends=('polkit-gnome: needed for authentification in Cinnamon, Gnome'
            'lxsession: needed for authentification in Xfce, LXDE etc.'
            'pacaur: needed for AUR support')
makedepends=('gettext' 'itstool' 'vala>=0.28')
backup=('etc/pamac.conf')
provides=('pamac')
conflicts=('pamac')
options=(!emptydirs)
install=pamac.install

if [ "${_gitcommit}" != "" ]; then
  source=("pamac-$pkgver-$pkgrel.tar.gz::$url/archive/$_gitcommit.tar.gz")
else
  source=("pamac-$pkgver.tar.gz::$url/archive/v$pkgver-patched.tar.gz")
fi

sha256sums=('8a25c4ce26b03b325ae6d3aa33877e461057bf13a8696425e2ef7062ba80acf4')

prepare() {
  if [ "$_gitcommit" != "" ]; then
    mv "$srcdir/pamac-$_gitcommit" "$srcdir/pamac-$pkgver"
  fi

  # adjust version string
  cd "$srcdir/pamac-$pkgver-patched/src"
  sed -i -e "s|\"$_pkgver\"|\"$pkgver-$pkgrel\"|g" manager_window.vala
  cd "$srcdir/pamac-$pkgver-patched/"
  # patches here
}

build() {
  cd "$srcdir/pamac-$pkgver-patched"

  # build
  make all
}

package() {
  cd "$srcdir/pamac-$pkgver-patched"
  make prefix="$pkgdir"/usr sysconfdir="$pkgdir"/etc install
}

# vim:set ts=2 sw=2 et:
