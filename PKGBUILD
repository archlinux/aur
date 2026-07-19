# Maintainer: Dmytro Bagrii <dimich.dmb@gmail.com>

_pkgname=libcoap
pkgname="${_pkgname}"-shared
pkgver=4.3.5b
pkgrel=1
pkgdesc="libcoap shared library with pkgconf metadata and example executables"
arch=('x86_64')
url="https://github.com/obgm/libcoap"
license=(
  BSD-1-Clause
  BSD-2-Clause
  BSD-3-Clause
  LicenseRef-Public-Domain
  LicenseRef-Internet-Society
)
conflicts=("${_pkgname}")
makedepends=(openssl)
source=("${_pkgname}-$pkgver.tar.gz::${url}/archive/refs/tags/v$pkgver.tar.gz")
sha512sums=('b8fc435412cd1909bc9ba5683cfa138a3ea08a76fecab78739ceedc7bb903d15d50d4362f702f7380fd047e5b6df3c76dfb75dd30bb20670a62205e6bc85021d')
b2sums=('055dd4ae443ca59149a0d8cb812bbb879c594c12dc708f62e7e757447c9cbcf1e3c83d55a64ba763fcbdbf75544f41e5da7a23a8fc6eaecd7fa774b562909081')

prepare() {
  mkdir -p license

  sed -n '1,21p' "${_pkgname}-$pkgver"/include/coap3/coap_uthash_internal.h > license/BSD-1-Clause.txt
  sed -n '1,26p' "${_pkgname}-$pkgver"/LICENSE > license/BSD-2-Clause.txt
  sed -n '31,46p' "${_pkgname}-$pkgver"/LICENSE > license/LicenseRef-Public-Domain.txt
  sed -n '61,86p' "${_pkgname}-$pkgver"/LICENSE > license/BSD-3-Clause.txt
  sed -n '133,157p' "${_pkgname}-$pkgver"/LICENSE > license/LicenseRef-Internet-Society.txt
}

build() {
  cd "$srcdir/${_pkgname}-$pkgver"
  ./autogen.sh

  local config_args=(
    --prefix=/usr
    --enable-shared
    --disable-static
    --with-openssl
    --disable-documentation
    # --enable-manpages     # Man pages generation seems broken so far
    --enable-examples
    --disable-examples-source
  )

  ./configure "${config_args[@]}"
  make
}

package() {
  install -vDm 644 license/*.txt -t "$pkgdir/usr/share/licenses/$pkgname/"
  cd "$srcdir/${_pkgname}-$pkgver"
  make DESTDIR="$pkgdir" install
}
