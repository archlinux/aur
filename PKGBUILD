# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Maintainer: Dan McGee <dan@archlinux.org>

pkgname=postgresql-12-upgrade
pkgver=12.19
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
source=(https://ftp.postgresql.org/pub/source/v${pkgver}/postgresql-${pkgver}.tar.bz2
        postgresql-perl-rpath.patch)
md5sums=('20da36a5dd7800e00008c0250c8ceb75'
         'e57d161913b0d6dc5962bf51f9dc180e')
sha256sums=('617e3de52c22e822f4f57d01d5b2240503e198a9eccaf598a851109bd18e6fbb'
            'fe5ba692eb357b66c03d07a319fb1c512b5b639642e7f0ae30edf5acbd1064fb')
b2sums=('d858108017ad9fd1c9813080c18f21cf2574f2b21a9881ae35e0291f3710664890983e71a2cd1c45f10b4c1ff8ab19d9d2383e35217b55e8e67b72b2673bec29'
        '518fd5fac1545e26d071521fb5f812a229a5366c3855acf934cc3acf2bb244e5daadefea46b7e79bd0d457c64ad07faaf186310fbcb66e910b6b0595378eb271')

# Upstream provides md5 and sha256

prepare() {
  cd postgresql-${pkgver}
  patch -l -p1 < ../postgresql-perl-rpath.patch
}

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
