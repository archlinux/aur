# Maintainer: Felix Golatofski <contact@xdfr.de>
# Contributor: Thomas Arnhold <thomas@arnhold.org>
# Contributor: Ariel Popper <a@arielp.com>
# Contributor: Dan McGee <dan@archlinux.org>

pkgname=postgresql-92-upgrade
pkgver=9.2.24
_majorver=${pkgver%.*}
pkgrel=3
pkgdesc="PostgreSQL build for migrating between major versions with pg_upgrade"
url="https://www.postgresql.org/"
arch=('i686' 'x86_64')
license=('custom:PostgreSQL')
depends=("postgresql-libs>=${_majorver}" 'libxml2' 'openssl>=1.0.0' 'pam'
         'zlib' 'icu' 'systemd-libs' 'libldap' 'krb5')
makedepends=('python' 'python2' 'perl' 'tcl>=8.6.0' 'systemd')
optdepends=('python2: for PL/Python 2 support'
            'python: for PL/Python 3 support'
            'perl: for PL/Perl support'
            'tcl: for PL/Tcl support')
provides=("postgresql-92-upgrade=${_majorver}")
conflicts=('postgresql-old-upgrade' 'postgresql-lts-old-upgrade')
source=(https://ftp.postgresql.org/pub/source/v${pkgver}/postgresql-${pkgver}.tar.bz2)
sha256sums=('a754c02f7051c2f21e52f8669a421b50485afcde9a581674d6106326b189d126')

build() {
  cd "${srcdir}/postgresql-${pkgver}"
  local options=(
    --prefix=/opt/pgsql-${_majorver}
    --with-gssapi
    --with-libxml
    --with-openssl
    --with-perl
    --with-python
    --with-tcl
    --with-pam
    --without-readline
    --with-system-tzdata=/usr/share/zoneinfo
    --with-uuid=e2fs
    --with-icu
    --with-systemd
    --with-ldap
    --disable-nls
    --enable-thread-safety
  )

  # regular build with everything
  ./configure ${options[@]} \
    PYTHON=/usr/bin/python2
  make -C src all
  make -C contrib all
}

package() {
  cd "${srcdir}/postgresql-${pkgver}"

  # install
  make -C src DESTDIR="${pkgdir}" install
  make -C contrib DESTDIR="${pkgdir}" install

  # install license
  install -Dm 644 COPYRIGHT -t "${pkgdir}/usr/share/licenses/${pkgname}"

  ## clean up unneeded installed items
  rm -rf "${pkgdir}/opt/pgsql-${_majorver}/include/"
}
