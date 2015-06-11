# Maintainer: Eduardo Reveles <me@osiux.ws>
# Contributor: Shem Valentine <archlinux@valentinenews.net>
# Contributor: Lael Guillemenot <zeppelinlg@gmail.com>

pkgname=glippy
pkgver=0.6
_majorver=1.0
pkgrel=5
pkgdesc="not so simple clipboard manager for GNOME"
arch=('i686' 'x86_64')
url="https://launchpad.net/glippy"
license=('GPL')
depends=('mono' 'gnome-sharp')
makedepends=('automake')
options=(!emptydirs)
install=$pkgname.install
source=(http://launchpad.net/${pkgname}/${_majorver}/${pkgver}/+download/${pkgname}-${pkgver}.tar.gz)
md5sums=('27338fe72e44e8563e912bc7d06478b0')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  #Using last autoconf
  PATH_AUTOCONF=$(find /usr/share -maxdepth 1 -type d -name "automake-*" | sort | tail -n 1)
  rm config.guess config.sub
  ln -s $PATH_AUTOCONF/config.guess .
  ln -s $PATH_AUTOCONF/config.sub .
  ./configure --prefix=/usr --sysconfdir=/etc \
              --localstatedir=/var 
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make -j1 GCONF_DISABLE_MAKEFILE_SCHEMA_INSTALL=1 DESTDIR=${pkgdir} install

  install -m755 -d "$pkgdir/usr/share/gconf/schemas"
  gconf-merge-schema "$pkgdir/usr/share/gconf/schemas/$pkgname.schemas" \
    "$pkgdir"/etc/gconf/schemas/*.schemas
  rm -f "$pkgdir"/etc/gconf/schemas/*.schemas
}

# vim:set ts=2 sw=2 et:
