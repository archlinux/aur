# Maintainer: Srevin Saju <srevin03@gmail.com>

pkgname=sugar3
pkgver=0.116
pkgrel=2
pkgdesc="Sugar GTK shell"
arch=('any')
url="https://sugarlabs.org/"
license=('GPL')
depends=('gst-plugins-espeak' 'gtksourceview3' 'gvfs' 'libwnck3'
         'libxklavier' 'metacity' 'mobile-broadband-provider-info' 'openssh' 'telepathy-mission-control'
	 'python-cairo' 'python-xapian' 'python-gobject' 'python-dbus' 'gtk2' 
	 'python-dateutil' 'icon-naming-utils' 'python-decorator' 'python-empy'
         'telepathy-gabble' 'telepathy-salut' 'upower' 'webkit2gtk'
         'xdg-user-dirs')
makedepends=('intltool')
source=(https://github.com/sugarlabs/sugar/archive/v$pkgver.tar.gz
        dont-overwrite-settings.patch)
sha256sums=('b52889a19e8e9d2710cf0b3cf36b5238a282dd7b45e55073aa679ff9eb84eeb3'
            '3ce2db5d003b3172302492a2c8ae1ba34aeafdfc6038c6751eb41c56909a062c')

prepare() {
  cd sugar-$pkgver

  # Use correct D-Bus config location
  sed -i '/^nmservicedir =/ s/sysconfdir/datadir/' data/Makefile.am

  # Don't overwrite default GNOME settings
  patch -Np1 -i ../dont-overwrite-settings.patch
}

build() {
  cd sugar-$pkgver
  ./autogen.sh --prefix=/usr --sysconfdir=/etc \
              --disable-schemas-compile
  make
}

package() {
  cd sugar-$pkgver
  make DESTDIR="$pkgdir" install
  rm -r "$pkgdir"/usr/share/sugar/extensions/cpsection/updater/
}

