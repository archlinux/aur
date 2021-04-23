# Maintainer: Thomas Arnhold <thomas@arnhold.org>
# Contributor: Ariel Popper <a@arielp.com>
# Contributor: Dan McGee <dan@archlinux.org>

pkgname=postgresql-95-upgrade
pkgver=9.5.23
_majorver=${pkgver%.*}
pkgrel=1
pkgdesc="PostgreSQL build for migrating between major versions with pg_upgrade"
arch=('i686' 'x86_64')
url="https://www.postgresql.org/"
license=('custom:PostgreSQL')
depends=("postgresql-libs>=${_majorver}" 'libxml2' 'openssl>=1.0.0' 'pam')
makedepends=('krb5' 'python2' 'perl' 'tcl>=8.6.0')
provides=("postgresql-95-upgrade=${_majorver}")
conflicts=('postgresql-old-upgrade' 'postgresql-lts-old-upgrade')
source=(http://ftp.postgresql.org/pub/source/v${pkgver}/postgresql-${pkgver}.tar.bz2)
sha256sums=('e314fa7e3355c4b8a35e94eeb8e58a6cf46adf49a2f9afa0c15cbc39980c8366')

build() {
  cd "${srcdir}/postgresql-${pkgver}"

  ./configure \
    --prefix=/opt/pgsql-${_majorver} \
    --with-gssapi \
    --with-libxml \
    --with-openssl \
    --with-perl \
    --with-python PYTHON=/usr/bin/python2 \
    --with-tcl \
    --with-pam \
    --without-readline \
    --with-system-tzdata=/usr/share/zoneinfo \
    --disable-nls \
    --enable-thread-safety

  make -C src all
  make -C contrib all
}

package() {
  cd "${srcdir}/postgresql-${pkgver}"

  # install
  make -C src DESTDIR="${pkgdir}" install
  make -C contrib DESTDIR="${pkgdir}" install

  # install license
  install -D -m644 COPYRIGHT "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  # clean up unneeded installed items
  rm -rf "${pkgdir}/opt/pgsql-${_majorver}/include/"
}

