# Maintainer: Tim Sharpe <tim@sharpe.id.au>
# Contributor: Matthew Carter <m@ahungry.com>

# Modified from postgresql-9.3 package provided by:
# Ariel Popper <a@arielp.com>

pkgname=postgresql-9.4
pkgver=9.4.20
pkgrel=2
arch=('i686' 'x86_64')
url="http://www.postgresql.org/"
pkgdesc="A powerful, open source object-relational database system"
license=('custom:PostgreSQL')
conflicts=('postgresql' 'postgresql-libs' 'postgresql-testing' 'postgresql-client')
provides=("postgresql=$pkgver" "postgresql-libs=$pkgver" "postgresql-client=$pkgver")
depends=('libxml2' 'krb5' 'openssl>=1.0.0' 'readline>=6.0')
makedepends=('python2' 'perl' 'tcl>=8.6.0')
optdepends=('python2: for PL/Python support'
            'perl: for PL/Perl support'
            'tcl: for PL/Tcl support'
            'postgresql-old-upgrade: upgrade from previous major version using pg_upgrade')
install=postgresql.install
source=(https://ftp.postgresql.org/pub/source/v${pkgver}/postgresql-${pkgver}.tar.bz2
        postgresql-run-socket.patch
        postgresql.pam postgresql.logrotate
        postgresql.service postgresql.tmpfiles.conf postgresql-check-db-dir)
sha256sums=('eeb1d8ddb2854c9e4d8b5cbd65665260c0ae8cbcb911003f24c2d82ccb97f87f'
            '8538619cb8bea51078b605ad64fe22abd6050373c7ae3ad6595178da52f6a7d9'
            '57dfd072fd7ef0018c6b0a798367aac1abb5979060ff3f9df22d1048bb71c0d5'
            '6abb842764bbed74ea4a269d24f1e73d1c0b1d8ecd6e2e6fb5fb10590298605e'
            'c69b614731fdd3f4e127540814f5999f423363523c5209e252e19b1d4362ad68'
            '7e086d70e0dcaa6ce45693b4e826ce92d770192b3aff5642319b1ef279d88dc4'
            'f15418433b7d9a153eea22af58cc64fda462144d7039d1083ae1e2e489cc303a')

build() {
  cd "${srcdir}/postgresql-${pkgver}"

  patch -Np1 < ../postgresql-run-socket.patch

  ./configure --prefix=/usr \
  --mandir=/usr/share/man \
  --datadir=/usr/share/postgresql \
  --sysconfdir=/etc \
  --with-gssapi \
  --with-libxml \
  --with-openssl \
  --with-perl \
  --with-python PYTHON=/usr/bin/python2 \
  --with-tcl \
  --with-pam \
  --with-system-tzdata=/usr/share/zoneinfo \
  --with-uuid=e2fs \
  --enable-nls \
  --enable-thread-safety

  make
  make -C contrib
}

package() {
  cd "${srcdir}/postgresql-${pkgver}"

  # install license
  install -D -m644 COPYRIGHT "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  make DESTDIR="${pkgdir}" install
  make -C contrib DESTDIR="${pkgdir}" install

  install -D -m644 "${srcdir}/postgresql.tmpfiles.conf" \
    "${pkgdir}/usr/lib/tmpfiles.d/postgresql.conf"
  install -D -m644 "${srcdir}/postgresql.service" \
    "${pkgdir}/usr/lib/systemd/system/postgresql.service"
  install -D -m755 "${srcdir}/postgresql-check-db-dir" \
    "${pkgdir}/usr/bin/postgresql-check-db-dir"

  install -D -m644 "${srcdir}/postgresql.pam" \
    "${pkgdir}/etc/pam.d/postgresql"

  install -D -m644 "${srcdir}/postgresql.logrotate" \
    "${pkgdir}/etc/logrotate.d/postgresql"
}
