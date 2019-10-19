# Maintainer: Jean Lucas <jean@4ray.co>
# Contributor: Wilhelm Schuster <wilhelm [aT] wilhelm [.] re>

pkgname=opensmtpd-extras
pkgver=6.4.0
pkgrel=3
pkgdesc='Additional queues, schedulers, and tables for OpenSMTPD'
arch=(i686 x86_64)
url=https://github.com/OpenSMTPD/OpenSMTPD-extras
license=(custom:ISC custom:BSD 'custom:Public Domain' custom:ISC-style)
makedepends=(libevent python2 postgresql-libs mariadb-libs hiredis)
optdepends=(
  'libevent: for table-python support'
  'python2: for table-python support'
  'postgresql-libs: for table-postgres support'
  'mariadb-libs: for table-mysql support'
  'hiredis: for table-redis support'
)
source=(https://www.opensmtpd.org/archives/$pkgname-$pkgver.tar.gz)
sha512sums=('097223884841ec3939d3f3d86ba9d23f9c62a37825a8e5b94c2ac5fd16584879780305685706b9bd8ed9a49dfece3ff5ed8f7f143494ca92a8c2c249aff9c28d')

prepare() {
  cd $pkgname-$pkgver

  # Python add-ons use Python 2
  sed 's#python_type="python"#python_type="python2"#' -i configure

  # Fix config folder location
  sed 's#/mail#/smtpd#' -i extras/tables/table-sqlite/sqlite.conf
}

build() {
  cd $pkgname-$pkgver

  ./configure \
    --prefix=/usr \
    --sbindir=/usr/bin \
    --libexecdir=/usr/lib/smtpd \
    --sysconfdir=/etc/smtpd \
    --with-queue-null \
    --with-queue-python \
    --with-queue-ram \
    --with-queue-stub \
    --with-scheduler-python \
    --with-scheduler-ram \
    --with-scheduler-stub \
    --with-table-ldap \
    --with-table-mysql \
    --with-table-passwd \
    --with-table-postgres \
    --with-table-python \
    --with-table-redis \
    --with-table-socketmap \
    --with-table-sqlite \
    --with-table-stub

  make
}

check() {
  cd $pkgname-$pkgver
  make -k check
}

package() {
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir" install
}
