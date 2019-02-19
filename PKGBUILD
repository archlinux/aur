# Maintainer: Thomas Arnhold <thomas@arnhold.org
# Contributor: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Contributor: Dan McGee <dan@archlinux.org>
# Contributor: Kuba Kuźma <kuba@jah.pl>
# Contributor: Matthew Carter <m@ahungry.com>
# Contributor: Ariel Popper <a@arielp.com>

pkgname=postgresql-9.6
pkgver=9.6.12
pkgrel=1
arch=('i686' 'x86_64')
url="http://www.postgresql.org/"
pkgdesc="A powerful, open source object-relational database system"
license=('custom:PostgreSQL')
conflicts=('postgresql' 'postgresql-libs' 'postgresql-testing' 'postgresql-client' 'postgresql-docs')
provides=("postgresql=$pkgver" "postgresql-libs=$pkgver" "postgresql-client=$pkgver" "postgresql-docs=$pkgver")
depends=('libxml2' 'krb5' 'openssl>=1.0.0' 'readline>=6.0' 'pam' 'zlib')
makedepends=('python2' 'perl' 'tcl>=8.6.0')
optdepends=('python2: for PL/Python support'
            'perl: for PL/Perl support'
            'tcl: for PL/Tcl support'
            'postgresql-old-upgrade: upgrade from previous major version using pg_upgrade')
install=postgresql.install
source=(https://ftp.postgresql.org/pub/source/v${pkgver}/postgresql-${pkgver}.tar.bz2
        postgresql-run-socket.patch
        postgresql.pam
        postgresql.logrotate
        postgresql.service
        postgresql-check-db-dir)
sha256sums=('2e8c8446ba94767bda8a26cf5a2152bf0ae68a86aaebf894132a763084579d84'
            '8538619cb8bea51078b605ad64fe22abd6050373c7ae3ad6595178da52f6a7d9'
            '57dfd072fd7ef0018c6b0a798367aac1abb5979060ff3f9df22d1048bb71c0d5'
            '6abb842764bbed74ea4a269d24f1e73d1c0b1d8ecd6e2e6fb5fb10590298605e'
            'b48fe97f8e43ed0d2041d519119a4dafb70fcae72870951bf4fb7350fe169ac8'
            '2340da0947bcb1c5602008d0ca00588ca0bfa8aca4fa6947a8bdb2c6df800b0e')

build() {
  cd "${srcdir}/postgresql-${pkgver}"

  patch -Np1 < ../postgresql-run-socket.patch

  ./configure --prefix=/usr \
  --mandir=/usr/share/man \
  --datadir=/usr/share/postgresql \
  --sysconfdir=/etc \
  --with-krb5 \
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

  make world
}

package() {
  cd "${srcdir}/postgresql-${pkgver}"

  make DESTDIR="${pkgdir}" install-world

  # install license
  install -D -m644 COPYRIGHT "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  install -D -m644 "${srcdir}/postgresql.service" \
    "${pkgdir}/usr/lib/systemd/system/postgresql.service"
  install -D -m755 "${srcdir}/postgresql-check-db-dir" \
    "${pkgdir}/usr/bin/postgresql-check-db-dir"

  install -D -m644 "${srcdir}/postgresql.pam" \
    "${pkgdir}/etc/pam.d/postgresql"

  install -D -m644 "${srcdir}/postgresql.logrotate" \
    "${pkgdir}/etc/logrotate.d/postgresql"
}
