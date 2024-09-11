# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Maintainer: Dan McGee <dan@archlinux.org>

pkgname=postgresql-12-upgrade
pkgver=12.17
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
        postgresql-perl-rpath.patch
        postgresql-fix-libxml2-2.12.patch)
md5sums=('35307327ee61f9c8c973d54a8cb091bc'
         'e57d161913b0d6dc5962bf51f9dc180e'
         '2e3311a060598a600045361c11041763')
sha256sums=('93e8e1b23981d5f03c6c5763f77b28184c1ce4db7194fa466e2edb65d9c1c5f6'
            'fe5ba692eb357b66c03d07a319fb1c512b5b639642e7f0ae30edf5acbd1064fb'
            'c29b81a7366807c447114481ef05340065be389a2939102ef28d80019e7a1d1f')
b2sums=('dda4b06d8d36d3257e1eea251ccbdf38f1ce63ca811045b7b8d156d2b54614304b83b30ad3b1ead4e7ad74fa9f42acc8934f648902e17a4f7c89a117dc8e3c03'
        '518fd5fac1545e26d071521fb5f812a229a5366c3855acf934cc3acf2bb244e5daadefea46b7e79bd0d457c64ad07faaf186310fbcb66e910b6b0595378eb271'
        '6513bdc13525742cb045dcf8c447669d865d508ec888778aeed0d2e1ed478689946be257c511316c633a09c11eea388d4e5b61bce93c4d9047127dc29bb55c7b')

# Upstream provides md5 and sha256

prepare() {
  cd postgresql-${pkgver}
  patch -l -p1 < ../postgresql-perl-rpath.patch
  patch -l -p1 < ../postgresql-fix-libxml2-2.12.patch
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
