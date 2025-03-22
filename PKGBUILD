# Maintainer: Yung Siang Liau <liauys@gmail.com>
# Contributor: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Contributor: Dan McGee <dan@archlinux.org>

pkgname=postgresql-14-upgrade
pkgver=14.17
_majorver=${pkgver%.*}
pkgrel=1
pkgdesc='PostgreSQL build for migrating between major versions with pg_upgrade'
url='https://www.postgresql.org/'
arch=('x86_64')
license=('PostgreSQL')
depends=(
  "postgresql-libs>=${_majorver}"
  'bash'
  'gcc-libs'
  'glibc'
  'icu'
  'krb5'
  'libldap'
  'libxml2'
  'llvm-libs'
  'lz4'
  'openssl'
  'pam'
  'systemd-libs'
  'zlib'
  'zstd'
)
makedepends=(
  'clang'
  'llvm'
  'perl'
  'python'
  'systemd'
  'tcl'
)
source=(
  https://ftp.postgresql.org/pub/source/v${pkgver}/postgresql-${pkgver}.tar.bz2
)
md5sums=('6ee0e0e1a704b96efa6a8d713baf1a17')
sha256sums=('6ce0ccd6403bf7f0f2eddd333e2ee9ba02edfa977c66660ed9b4b1057e7630a1')
b2sums=('e81c2416e69e3b31a69b5e8db32543c8aaff1b81f7163b3a204827d5ee4cffd08a5cc45bdc774a4ffd19d4b48dee5797842364bb9706ada945fd6ff415687486')

# Upstream provides md5 and sha256

build() {
  cd postgresql-${pkgver}
  local configure_options=(
    --prefix=/opt/pgsql-${_majorver}
    --disable-rpath
    --disable-nls
    --disable-tap-tests
    --enable-thread-safety
    --with-gssapi
    --with-icu
    --with-ldap
    --with-libxml
    --without-libxslt
    --with-llvm
    --with-lz4
    --with-openssl
    --with-pam
    --with-perl
    --with-python
    --without-readline
    --with-system-tzdata=/usr/share/zoneinfo
    --with-systemd
    --with-tcl
    --with-uuid=e2fs
    --with-zstd
  )

  # Fix static libs
  CFLAGS+=" -ffat-lto-objects"

  ./configure "${configure_options[@]}"
  make -C src all
  make -C contrib all
}

package() {
  optdepends=(
    'perl: for PL/Perl support'
    'python: for PL/Python 3 support'
    'tcl: for PL/Tcl support'
  )

  cd postgresql-${pkgver}

  # install
  make -C src DESTDIR="${pkgdir}" install
  make -C contrib DESTDIR="${pkgdir}" install

  install -Dm 644 COPYRIGHT -t "${pkgdir}/usr/share/licenses/${pkgname}"
}

# vim:set sw=2 sts=-1 et:

