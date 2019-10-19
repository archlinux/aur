# Maintainer: Jean Lucas <jean@4ray.co>

pkgname=opensmtpd-extras-git
_pkgname=OpenSMTPD-extras
pkgver=0+r604+36cc595
pkgrel=2
pkgdesc='Additional queues, schedulers, and tables for OpenSMTPD (Git)'
arch=(i686 x86_64)
url=https://github.com/OpenSMTPD/OpenSMTPD-extras
license=(custom:ISC custom:BSD 'custom:Public Domain' custom:ISC-style)
makedepends=(git libevent python2 postgresql-libs mariadb-libs hiredis)
optdepends=(
  'libevent: for table-python support'
  'python2: for table-python support'
  'postgresql-libs: for table-postgres support'
  'mariadb-libs: for table-mysql support'
  'hiredis: for table-redis support'
)
source=(git+$url)
sha512sums=('SKIP')

pkgver() {
  cd $_pkgname
  echo 0+r$(git rev-list --count HEAD)+$(git rev-parse --short HEAD)
}

prepare() {
  cd $_pkgname

  ./bootstrap

  # Python add-ons use Python 2
  sed 's#python_type="python"#python_type="python2"#' -i configure

  # Fix config folder location
  sed 's#/mail#/smtpd#' -i extras/tables/table-sqlite/sqlite.conf
}

build() {
  cd $_pkgname

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
  cd $_pkgname
  make -k check
}

package() {
  cd $_pkgname
  make DESTDIR="$pkgdir" install
}
