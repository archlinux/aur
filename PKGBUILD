# Maintainer: Christoph Brill <aur@christophbrill.de>
# Contributor: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Contributor: Dan McGee <dan@archlinux.org>

pkgname=postgresql-11-upgrade
pkgver=11.18
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
md5sums=('4900ddcee945616e4b0841172cbccbd1')
sha256sums=('d24f20efc52e918acfbcca21e9cea28e0e263b846a0c408fcfac3b3c4a0f7504')
b2sums=('f0f01cb1f479032615b1b15e37d5c9955c560218de5e5cb480d920253a23615636fd8ed5e5310bdc1f80dc1f6da81cbb2ca41b90b0cc095139b6d9b59fc57d78')

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
