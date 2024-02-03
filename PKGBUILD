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
         '8d52369bafe10a61d168dfa4c4d6fb58'
         'f0784a861197e530169110dffdf49815')
sha256sums=('93e8e1b23981d5f03c6c5763f77b28184c1ce4db7194fa466e2edb65d9c1c5f6'
            'bd8e0f6ecb7c1b9b5d34eaa1d456cac20160e8350a9a151e31557a0ec7a51deb'
            '79ab94d82027699135d4cbbf4f5e65747d575569e8ce1b8ed07dc1e002321a6e')
b2sums=('dda4b06d8d36d3257e1eea251ccbdf38f1ce63ca811045b7b8d156d2b54614304b83b30ad3b1ead4e7ad74fa9f42acc8934f648902e17a4f7c89a117dc8e3c03'
        '748515d1fcb0176dac4d74435e8fbe655989e31cc65cb2871bf05822dd5cc52b2e4014b8915f039c6f09b0230236add830ce981c7dc1b2269bdaad6620e88e8b'
        'a7f69aba1a33bb8977ae59d91fb86d32e20e8e8dac6d5be76ee3af9ace0ca2ee45efb73dbf992159f64376ec9aeee181c90cb71e2827231ab108971619ed1a53')

# Upstream provides md5 and sha256

prepare() {
  cd postgresql-${pkgver}
  patch -p1 < ../postgresql-perl-rpath.patch
  patch -p1 < ../postgresql-fix-libxml2-2.12.patch
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
