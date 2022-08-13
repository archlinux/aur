# Maintainer: Bruno Silva <brunofernandes at ua dot pt>

pkgname=openssl3-git
pkgver=3.0.5.r1329.gd272ef5372
pkgrel=1
pkgdesc="Toolkit for the Transport Layer Security (TLS) and Secure Sockets Layer (SSL) protocols: install openssl-3* libraries without openssl-1* conflicts"
arch=('i686' 'x86_64')
url="https://www.openssl.org/"
license=('apache')
depends=('glibc' 'perl')
makedepends=('git')
optdepends=('ca-certificates')
options=('staticlibs')
source=("git+https://github.com/openssl/openssl.git"
        "ca-dir.patch::https://raw.githubusercontent.com/archlinux/svntogit-packages/packages/openssl/trunk/ca-dir.patch")
sha512sums=('SKIP'
            'SKIP')

prepare() {
  cd "openssl"
  patch -Np0 -F100 -i "$srcdir/ca-dir.patch"
}

pkgver() {
  cd "openssl"
  _tag=$(git tag -l --sort -v:refname | sed '/rc[0-9]*/d' | grep "openssl-" | head -n1)
  _rev=$(git rev-list --count $_tag..HEAD)
  _hash=$(git rev-parse --short HEAD)
  printf "%s.r%s.g%s" "$_tag" "$_rev" "$_hash" | sed 's/^openssl-//'
}

build() {
  cd "openssl"
  if [ "$CARCH" = "x86_64" ]; then
    _target="linux-x86_64"
  elif [ "$CARCH" = "i686" ]; then
    _target="linux-x86"
  fi
  ./Configure \
    --prefix="/usr" \
    --libdir="lib" \
    --openssldir="/etc/ssl" \
    "$_target" \
    "-Wa,--noexecstack $CPPFLAGS $CFLAGS $LDFLAGS" \
    shared
  make depend
  make
}

package() {
	mkdir -p "${pkgdir}/usr/local/lib/"
 	cp -rf "${srcdir}"/openssl/lib*.so* "${pkgdir}"/usr/local/lib/ 
}
