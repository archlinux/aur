# Maintainer: Jean Lucas <jean@4ray.co>
# Contributor: Wilhelm Schuster <wilhelm [aT] wilhelm [.] re>

pkgname=opensmtpd-extras
pkgver=6.7.1
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
source=(https://www.opensmtpd.org/archives/$pkgname-$pkgver.tar.gz automake17.patch configure.patch)
sha512sums=('0969c53a5d13816862f13b3572c0d84d34e2d36d85f83a528d70ee3f4ad5e6b2cdda256529e95a43a177e64368e4e93540d5bb2f81039808d79049234b249d91' 'dec95f5b4d518dff802321fe3d29a05086565b107db62f3c6741c29b0999e9a074bb287a0304c633372b85d46d7675d299caa548e1504d1245efd6e731b175ed' '76c24516771a649a44cd3113fc4a884b9c6196582435d10f3f6f2efe0e6c168cfdc222e7bb37bd02e7c879db10b7dfaea174053f4ac863e74ff77920b7938038')

prepare() {
  cd $pkgname-$pkgver

  # Fix config folder location
  sed 's#/mail#/smtpd#' -i extras/tables/table-sqlite/sqlite.conf

  # Allow automake 1.17
  patch -p1 -i "${srcdir}/automake17.patch"

  # Fix this bad compiler check
  patch -p1 -i "${srcdir}/configure.patch"
}

build() {
  cd $pkgname-$pkgver

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
  cd $pkgname-$pkgver
  make -k check
}

package() {
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir" install
}
