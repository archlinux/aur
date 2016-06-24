# Contributor: Zeph <zeph33@gmail.com>
# Maintainer: Zeph <zeph33@gmail.com>

pkgname=pamac-aur
pkgver=4.1.0
_pkgver=4.1.0
pkgrel=2
pkgdesc="A Gtk3 frontend for libalpm"
arch=('any')
url="https://github.com/manjaro/pamac"
license=('GPL3')
depends=('glib2>=2.42' 'json-glib' 'libsoup' 'dbus-glib' 'polkit' 'vte3>=0.38' 'gtk3>=3.18'
         'libnotify' 'desktop-file-utils' 'pacman>=5.0' 'pacman<5.1' 'gnutls>=3.4')
optdepends=('yaourt: needed for AUR support')
makedepends=('gettext' 'itstool' 'vala>=0.28')
backup=('etc/pamac.conf')
provides=('pamac')
conflicts=('pamac')
options=(!emptydirs)
install=pamac.install

source=("pamac-$pkgver-$pkgrel.tar.gz::https://github.com/manjaro/pamac/archive/v$_pkgver.tar.gz"
        'preferences-dialog.patch::https://github.com/manjaro/pamac/commit/5019f66b8673ac3a30f3e3174a85412ef9d72fd0.patch')
sha256sums=('11378b4e3580242a24e2f3988b34f6310c65d19defeb69c096390964209fcf85'
            'd6cf41683427c434a7ee8fb3b47a7bf4824f904a7d93cacc9420f831ad33cf81')
  
prepare() {
  # adjust version string
  cd "$srcdir/pamac-$_pkgver"
  sed -i -e "s|\"4.1.0\"|\"$pkgver-$pkgrel\"|g" src/transaction.vala 
  # patches here
  patch -Np1 -i "$srcdir/preferences-dialog.patch"
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
