# Maintainer: Que Quotion <quequotion@bugmenot.com>
# Contributor: Eduardo Reveles <me@osiux.ws>
# Contributor: Shem Valentine <archlinux@valentinenews.net>
# Contributor: Lael Guillemenot <zeppelinlg@gmail.com>

pkgname=glippy-indicator
pkgver=0.6
pkgrel=7
pkgdesc="not so simple clipboard manager for GNOME, Appindicator enabled"
arch=('i686' 'x86_64')
url="https://launchpad.net/glippy"
license=('GPL')
depends=('mono' 'gnome-sharp' libappindicator-{sharp,gtk2} indicator-application{,-gtk2})
makedepends=('automake' 'libappindicator-sharp')
provides=('glippy')
conflicts=('glippy')
options=(!emptydirs)
install=glippy.install
#source=("http://hugsmile.eu/file/src/${pkgname}-${pkgver}.tar.gz"
source=("git+http://github.com/quequotion/glippy"
        'enable-indicator.patch')
md5sums=('SKIP'
         '60cb2f667f377c72b7923145d154a262')

prepare() {
  cd "${srcdir}/glippy"
  patch -p1 -i "${srcdir}/enable-indicator.patch"
}

build() {
  cd "$srcdir/glippy"
  #Using last autoconf
  PATH_AUTOCONF=$(find /usr/share -maxdepth 1 -type d -name "automake-*" | sort | tail -n 1)
  rm config.guess config.sub
  ln -s $PATH_AUTOCONF/config.guess .
  ln -s $PATH_AUTOCONF/config.sub .
  ./configure --prefix=/usr --sysconfdir=/etc \
              --localstatedir=/var --enable-appindicator
  make
}

package() {
  cd "$srcdir/glippy"
  make -j1 GCONF_DISABLE_MAKEFILE_SCHEMA_INSTALL=1 DESTDIR=${pkgdir} install

  install -m755 -d "$pkgdir/usr/share/gconf/schemas"
  gconf-merge-schema "$pkgdir/usr/share/gconf/schemas/glippy.schemas" \
    "$pkgdir"/etc/gconf/schemas/*.schemas
  rm -f "$pkgdir"/etc/gconf/schemas/*.schemas
}

# vim:set ts=2 sw=2 et:
