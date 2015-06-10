# Maintainer: <tmoore01 (at) gmail (dot) com>

_pkgname=evolution
pkgname=$_pkgname-git
pkgver=3.17.2.r27.g77897bc
pkgrel=1
pkgdesc="Manage your email, contacts and schedule"
arch=(i686 x86_64)
license=(GPL)
depends=(gnome-desktop evolution-data-server libcanberra libpst libytnef desktop-file-utils hicolor-icon-theme dconf gtkspell3 libcryptui webkitgtk gtk-doc gnome-common)
makedepends=(intltool itstool docbook-xsl networkmanager highlight gnome-desktop evolution-data-server libcanberra libpst libytnef desktop-file-utils hicolor-icon-theme dconf gtkspell3 webkitgtk libcryptui)
optdepends=('highlight: text highlight plugin'
            'evolution-spamassassin: Spamassassin spam check plugin'
            'evolution-bogofilter: Bogofilter spam check plugin')
options=('!emptydirs')
url="https://wiki.gnome.org/Apps/Evolution"
conflicts=('evolution')
replaces=('evolution')
provides=('evolution')
install=$_pkgname.install
source=(git://git.gnome.org/evolution)
sha256sums=('SKIP')

build() {
  cd $srcdir/$_pkgname

  ./autogen.sh --prefix=/usr --sysconfdir=/etc \
      --localstatedir=/var \
      --libexecdir=/usr/lib \
      --enable-nss=yes \
      --with-openldap=yes \
      --enable-smime=yes \
      --disable-schemas-compile \
      --disable-autoar
  
  sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0 /g' -e 's/    if test "$export_dynamic" = yes && test -n "$export_dynamic_flag_spec"; then/      func_append compile_command " -Wl,-O1,--as-needed"\n      func_append finalize_command " -Wl,-O1,--as-needed"\n\0/' libtool

  make
}

pkgver() {
        cd $srcdir/$_pkgname
        git describe --long | sed 's/^EVOLUTION_//;s/\([^-]*-g\)/r\1/;s/-/./g;s/_/./g'
}

package() {
  groups=('gnome-extra')
  cd $srcdir/$_pkgname
  make DESTDIR="$pkgdir" install
}
