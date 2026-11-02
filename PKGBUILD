# Maintainer: Christian Pfeiffer <cpfeiffer at rev-crew dot info>
# shellcheck disable=SC2034,SC2154
# shellcheck shell=bash

pkgname=lib32-libmaxminddb
_name=libmaxminddb
pkgver=1.14.1
pkgrel=1
pkgdesc="MaxMindDB GeoIP2 database library (32-bit)"
arch=(x86_64)
url="https://maxmind.github.io/libmaxminddb/"
license=(Apache-2.0)
# libmaxminddb: the headers
depends=(lib32-gcc-libs lib32-glibc libmaxminddb)
provides=(libmaxminddb.so)
source=("https://github.com/maxmind/libmaxminddb/releases/download/$pkgver/$_name-$pkgver.tar.gz")
sha512sums=('d6e5f0e7fff896ac63525bcf01b06944388c6756889ac533dfaf416fd2e494953f31ede1a2352bdcf5018e2544b65eb3328a22f9233c50e01e0809a5bc6486cc')
b2sums=('8ced4fe8162f603c734a35d86f01bec4a03c6d4bca0410572f3fa201d06cbf49c0459f25320697186c9c13a11616a3b3f64819ed1b3004bc3c9b15898696ac8c')

build() {
  cd "$_name-$pkgver" || exit
  export CC="gcc -m32"
  export PKG_CONFIG_PATH="/usr/lib32/pkgconfig"
  ./configure --prefix=/usr --libdir=/usr/lib32
  make
}

check() {
  cd "$_name-$pkgver" || exit
  make check
}

package() {
  cd "$_name-$pkgver" || exit
  make DESTDIR="$pkgdir" install

  # The headers are libmaxminddb's. Its maxminddb_config.h is the 64-bit one, with an unsigned
  # __int128, which 32-bit x86 doesn't have: the 32-bit library uses a byte array, which consumers
  # define through pkg-config, as the header only sets these when they aren't defined.
  local _config
  for _config in MMDB_UINT128_USING_MODE MMDB_UINT128_IS_BYTE_ARRAY; do
    grep -q "^#define $_config [01]$" include/maxminddb_config.h || exit
  done
  sed -i "s|^Cflags: .*|& $(sed -n 's/^#define \(MMDB_UINT128_[A-Z_]*\) \([01]\)$/-D\1=\2/p' \
    include/maxminddb_config.h | tr '\n' ' ' | sed 's/ $//')|" "$pkgdir/usr/lib32/pkgconfig/$_name.pc"
  rm -r "${pkgdir:?}"/usr/{bin,include,share}
  install -Dm644 LICENSE NOTICE -t "$pkgdir/usr/share/licenses/$pkgname"
}
