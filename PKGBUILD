# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>
# Former maintainer: Eden Rose <eenov1988@gmail.com>
# Contributor: Pierre Schmitz <pierre@archlinux.de>

pkgname=openssl-git
pkgver=3.0.4.r1137.g9454423bf1
pkgrel=1
pkgdesc="Toolkit for the Transport Layer Security (TLS) and Secure Sockets Layer (SSL) protocols"
arch=('i686' 'x86_64')
url="https://www.openssl.org/"
license=('apache')
depends=('glibc' 'perl')
makedepends=('git')
optdepends=('ca-certificates')
provides=("openssl=$pkgver")
conflicts=('openssl')
backup=('etc/ssl/openssl.cnf')
options=('staticlibs')
source=("git+https://github.com/openssl/openssl.git"
        "ca-dir.patch::https://raw.githubusercontent.com/archlinux/svntogit-packages/packages/openssl/trunk/ca-dir.patch")
sha256sums=('SKIP'
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

check() {
  cd "openssl"

  # the test fails due to missing write permissions in /etc/ssl
  # revert this patch for make test
  #patch -Np0 -F100 -R -i "$srcdir/ca-dir.patch"
  #make test
  #patch -Np0 -F100 -i "$srcdir/ca-dir.patch"
  #make apps/CA.pl
}

package() {
  cd "openssl"

  make \
    DESTDIR="$pkgdir" \
    install_sw \
    install_ssldirs \
    install_man_docs
}
