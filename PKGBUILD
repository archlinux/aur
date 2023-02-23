# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Maintainer: Dan McGee <dan@archlinux.org>

pkgname=postgresql-13-upgrade
pkgver=13.10
_majorver=${pkgver%.*}
pkgrel=1
pkgdesc='PostgreSQL build for migrating between major versions with pg_upgrade'
url='https://www.postgresql.org/'
arch=('x86_64')
license=('custom:PostgreSQL')
depends=("postgresql-libs>=${_majorver}" 'libxml2' 'openssl>=1.0.0' 'pam'
         'zlib' 'icu' 'systemd-libs' 'libldap' 'krb5' 'llvm-libs')
makedepends=('python' 'perl' 'tcl>=8.6.0' 'systemd' 'llvm' 'clang')
optdepends=('python: for PL/Python 3 support'
            'perl: for PL/Perl support'
            'tcl: for PL/Tcl support')
options=('debug')
source=(https://ftp.postgresql.org/pub/source/v${pkgver}/postgresql-${pkgver}.tar.bz2)
md5sums=('72ef0eb5f9fdc5a837c14cd19c5007a0')
sha256sums=('5bbcf5a56d85c44f3a8b058fb46862ff49cbc91834d07e295d02e6de3c216df2')

# Upstream provides md5 and sha256

build() {
  cd postgresql-${pkgver}
  local configure_options=(
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
    --with-llvm
    --without-libxslt
    --disable-nls
    --enable-thread-safety
    --enable-rpath
  )

  # Fix static libs
  CFLAGS+=" -ffat-lto-objects"

  ./configure "${configure_options[@]}"
  make -C src all
  make -C contrib all
}

package() {
  cd postgresql-${pkgver}

  # install
  make -C src DESTDIR="${pkgdir}" install
  make -C contrib DESTDIR="${pkgdir}" install

  install -Dm 644 COPYRIGHT -t "${pkgdir}/usr/share/licenses/${pkgname}"
}

# vim: ts=2 sw=2 et:
