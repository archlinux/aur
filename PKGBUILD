_pkgname=openssl
_pkgver=3.0
pkgname="${_pkgname}-${_pkgver}"
pkgver=3.0.5
pkgrel=1
pkgdesc="Toolkit for the Transport Layer Security (TLS) and Secure Sockets Layer (SSL) protocols.  Can be installed alongside OpenSSL 1."
arch=('i686' 'x86_64')
url="https://www.openssl.org/"
license=('apache')
depends=('glibc' 'perl')
provides=('openssl3-git' 'openssl-git')
conflicts=('openssl3-git' 'openssl-git')
makedepends=('git')
optdepends=('ca-certificates')
options=('staticlibs')
source=(
  "https://github.com/openssl/openssl/archive/refs/tags/openssl-${pkgver}.tar.gz"
  "ca-dir.patch"
)
sha256sums=(
  'b6363cf1bca88f0a46a768883a225e644135432d6a51ab1c4660ab58af541078'
  'SKIP'
)

prepare() {
  cd "${srcdir}/openssl-openssl-${pkgver}"

  # set ca dir to /etc/ssl by default
  patch -Np1 -F100 -i "$srcdir/ca-dir.patch"
}

build() {
  cd "${srcdir}/openssl-openssl-${pkgver}"
  if [ "$CARCH" = "x86_64" ]; then
    _target="linux-x86_64"
  elif [ "$CARCH" = "i686" ]; then
    _target="linux-x86"
  fi

  ./Configure \
    --prefix="/usr" \
    --openssldir="/etc/ssl" \
    --libdir="lib/openssl-${_pkgver}" \
    shared "$_target" \
    "-Wa,--noexecstack ${CPPFLAGS} ${CFLAGS} ${LDFLAGS}"

  make depend
  make
}

package() {
  cd "${srcdir}/openssl-openssl-${pkgver}"

  make install_sw DESTDIR="${pkgdir}"

  # Move some files around
  install -m755 -d "$pkgdir/usr/include/openssl-${_pkgver}"
  mv "$pkgdir/usr/include/openssl" "$pkgdir/usr/include/openssl-${_pkgver}/"
  mv "$pkgdir/usr/lib/openssl-${_pkgver}/libcrypto.so.3" "$pkgdir/usr/lib/"
  mv "$pkgdir/usr/lib/openssl-${_pkgver}/libssl.so.3" "$pkgdir/usr/lib/"
  ln -sf ../libssl.so.3 "$pkgdir/usr/lib/openssl-${_pkgver}/libssl.so"
  ln -sf ../libcrypto.so.3 "$pkgdir/usr/lib/openssl-${_pkgver}/libcrypto.so"
  mv "$pkgdir/usr/bin/openssl" "$pkgdir/usr/bin/openssl-${_pkgver}"

  # Update includedir in .pc files
  sed -e "s|/include$|/include/openssl-${_pkgver}|" -i "${pkgdir}/usr/lib/openssl-${_pkgver}/pkgconfig"/*.pc

  rm -rf "$pkgdir"/{etc,usr/bin/c_rehash}

  install -D -m644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
