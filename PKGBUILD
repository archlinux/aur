# Maintainer: Balló György <ballogyor+arch at gmail dot com>
# Contributor: Michael Kanis <mkanis@gmx.de>

pkgname=gsql
pkgver=0.2.2
pkgrel=14
pkgdesc="Integrated database development tool for GNOME"
url="http://gsql.org/"
license=('GPL')
arch=('x86_64')
depends=('gconf' 'gtksourceview2' 'libglade' 'libnotify')
makedepends=('mariadb-libs' 'libssh' 'postgresql-libs')
optdepends=('mariadb-libs: MySQL engine'
            'libssh: SSH tunneling plugin'
            'postgresql-libs: PostgreSQL engine')
source=($pkgname-$pkgver.tar.gz::"https://github.com/halturin/$pkgname/archive/release-$pkgver.tar.gz")
sha256sums=('a0372e492d9d72410d4c3d5d1e4ab9ce2b9eb9fc69996d2c78e318fb637c9ded')

prepare() {
  cd $pkgname-release-$pkgver
  sed -i 's/notify_notification_new (subj, message, NULL, NULL);/notify_notification_new (subj, message, NULL);/' libgsql/notify.c
  ./autogen.sh
}

build() {
  cd $pkgname-release-$pkgver
  export LDFLAGS="$LDFLAGS -lgthread-2.0"
  ./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var \
              --without-gnome --disable-plugin-vte \
              --with-gconf-schema-file-dir=/usr/share/gconf/schemas
  sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool
  make
}

package() {
  cd $pkgname-release-$pkgver
  make GCONF_DISABLE_MAKEFILE_SCHEMA_INSTALL=1 DESTDIR="$pkgdir" install
}
