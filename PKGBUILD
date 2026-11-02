# Maintainer: Christian Pfeiffer <cpfeiffer at rev-crew dot info>
# shellcheck disable=SC2034,SC2154
# shellcheck shell=bash

pkgname=lib32-postgresql-libs
_name=postgresql
pkgver=18.6
pkgrel=1
pkgdesc="PostgreSQL's client library, libpq, with its OAuth module (32-bit)"
arch=(x86_64)
url="https://www.postgresql.org/"
license=(PostgreSQL)
# postgresql-libs: the headers and libpq's translations; curl: the OAuth module
depends=(lib32-curl lib32-gcc-libs lib32-glibc lib32-krb5 lib32-libldap lib32-openssl postgresql-libs)
# The features of Arch's postgresql that multilib has 32-bit libraries for (the server's, built for
# libpq's tests); llvm: LLVM's headers, which lib32-llvm shares
makedepends=(
  clang
  lib32-icu
  lib32-libxml2
  lib32-llvm
  lib32-readline
  lib32-systemd
  lib32-util-linux
  lib32-zlib
  lib32-zstd
  llvm
  perl
)
checkdepends=(perl-ipc-run)
provides=(libpq.so)
source=("https://ftp.postgresql.org/pub/source/v$pkgver/$_name-$pkgver.tar.bz2"
  0001-Set-DEFAULT_PGSOCKET_DIR-to-run-postgresql.patch)
sha512sums=('5855d11be61a594e4dcdfa4ab4de1432caa86a8d50e1b1334ea2989439b46139612c53d00ba6330cba4d7d8b78a9e2176e1a2b6c5454814b5fa49dd54de72eb1'
  'b1878c68d72d37cb26486f02bee1491ec3050200f39c50b14df27e3f7820421cd221ea0217dae187cdd108215c690e5f93138632dcee0a4315198993a6ef9d30')
b2sums=('657fd161eb581608cf73f6f649b6a35dbf034ff64c578c17f94d49c72ac9cd8ea7280425dd24ba4d7550c044bfebe78f0ebc534a1df4cfe2b634a6e4f765aa51'
  '057e65b1e5a1fd82c7fa9da1c4e2fef39321ee59f74f54d9864e8ab4d7db4862c8fb6353f6006e1a9e1f5132543cf0c12b388963487a09b1465447b3ff6d7321')

prepare() {
  cd "$_name-$pkgver" || exit
  # The server's socket folder of Arch's postgresql, as in postgresql-libs
  patch -Np1 -i "$srcdir/0001-Set-DEFAULT_PGSOCKET_DIR-to-run-postgresql.patch"
}

build() {
  cd "$_name-$pkgver" || exit
  export CC="gcc -m32" CXX="g++ -m32" CLANG="clang -m32" LLVM_CONFIG=/usr/bin/llvm-config32
  export PKG_CONFIG_PATH="/usr/lib32/pkgconfig"
  # The options of Arch's postgresql, without the features multilib has no 32-bit libraries for
  # (libnuma, liburing, libxslt, lz4, PAM, Perl, Python, Tcl). The whole server is built, as
  # libpq's tests run against one; libpq itself uses OpenSSL, GSSAPI, LDAP and NLS, its OAuth
  # module curl.
  local _configure_options=(
    --prefix=/usr
    --libdir=/usr/lib32
    --sysconfdir=/etc
    --mandir=/usr/share/man
    --datadir=/usr/share/postgresql
    --disable-rpath
    --enable-nls
    --enable-tap-tests
    --with-gssapi
    --with-icu
    --with-ldap
    --with-libcurl
    --with-libxml
    --with-llvm
    --with-openssl
    --with-readline
    --with-system-tzdata=/usr/share/zoneinfo
    --with-systemd
    --with-uuid=e2fs
    --with-zstd
  )
  ./configure "${_configure_options[@]}"
  make
}

check() {
  cd "$_name-$pkgver" || exit
  # libpq's tests: connection URIs, connections and their options against a temporary server
  make -C src/interfaces/libpq check
}

package() {
  cd "$_name-$pkgver" || exit
  make -C src/interfaces/libpq DESTDIR="$pkgdir" install
  make -C src/interfaces/libpq-oauth DESTDIR="$pkgdir" install

  # The headers, translations and pg_service.conf's sample are postgresql-libs'
  rm -r "${pkgdir:?}"/usr/{include,share/locale,share/postgresql}
  install -Dm644 COPYRIGHT -t "$pkgdir/usr/share/licenses/$pkgname"
}
