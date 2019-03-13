# Maintainer: Denis Vadimov <me @ bloody.pw>

pkgname=geos-php
pkgver=1.0.0.r4.g2c9c56a
pkgrel=1
pkgdesc="PHP bindings for GEOS"
arch=('i686' 'x86_64')
url="http://geos.osgeo.org/"
license=('LGPL2' 'MIT')
makedepends=('php')
depends=('geos')
source=('php-geos::git+https://git.osgeo.org/gitea/geos/php-geos.git')
sha256sums=('SKIP')

pkgver() {
   # From AUR package `remmina-git`
   cd php-geos/

   if GITTAG="$(git describe --abbrev=0 --tags 2>/dev/null)"; then
          printf '%s.r%s.g%s' \
                 "$(sed -e "s/^${pkgname%%-git}//" -e 's/^[-_/a-zA-Z]\+//' -e 's/[-_+]/./g' <<< ${GITTAG})" \
                 "$(git rev-list --count ${GITTAG}..)" \
                 "$(git rev-parse --short HEAD)"
   else
          printf '0.r%s.g%s' \
                 "$(git rev-list --count master)" \
                 "$(git rev-parse --short HEAD)"
   fi
}

build() {
   cd $srcdir/php-geos/

   ./autogen.sh
   ./configure --prefix=/usr/
   make
}

package() {
   /usr/bin/install -D -m 755 $srcdir/php-geos/modules/geos.so "$pkgdir"`php-config --extension-dir`/geos.so

   mkdir -p $pkgdir/etc/php/conf.d/
   echo ';extension=geos.so' > $pkgdir/etc/php/conf.d/geos.ini
}
