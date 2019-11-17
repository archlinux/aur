# Maintainer: Jean Lucas <jean@4ray.co>
# Contributor: Wilhelm Schuster <wilhelm [aT] wilhelm [.] re>

pkgname=opensmtpd-extras
_pkgname=OpenSMTPD-extras
pkgver=6.6.0
pkgrel=1
pkgdesc='Additional queues, schedulers, and tables for OpenSMTPD'
arch=(i686 x86_64)
url=https://github.com/OpenSMTPD/OpenSMTPD-extras
license=(ISC BSD BSD3 'custom:Public Domain' custom:ISC-like)
makedepends=(libevent python2 postgresql-libs mariadb-libs hiredis)
optdepends=(
  'libevent: for table-python support'
  'python2: for table-python support'
  'postgresql-libs: for table-postgres support'
  'mariadb-libs: for table-mysql support'
  'hiredis: for table-redis support'
)
source=(https://www.opensmtpd.org/archives/$pkgname-$pkgver.tar.gz)
sha512sums=('0c2f89449f51df243d8933a228f7685c8262376a1c95632517c02066c7be6155ddeae71ce364d953d3571cad4a46cfdbfbb11010ee778d82f6185b49d1336003')

prepare() {
  cd $_pkgname-$pkgver

  # Fix config folder location
  sed 's#/mail#/smtpd#' -i extras/tables/table-sqlite/sqlite.conf
}

build() {
  cd $_pkgname-$pkgver

  ./bootstrap

  # Python add-ons use Python 2
  sed 's#python_type="python#&2#' -i configure

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
  cd $_pkgname-$pkgver
  make -k check
}

package() {
  cd $_pkgname-$pkgver
  make DESTDIR="$pkgdir" install
}
