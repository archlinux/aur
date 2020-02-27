# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>
# Former maintainer: Eden Rose <eenov1988@gmail.com>
# Contributor: Pierre Schmitz <pierre@archlinux.de>

pkgname=openssl-git
pkgver=1.1.1.r2775.g30a4cda5e0
pkgrel=1
pkgdesc="Toolkit for the Transport Layer Security (TLS) and Secure Sockets Layer (SSL) protocols"
arch=('x86_64')
url="https://www.openssl.org/"
license=('apache')
depends=('glibc' 'perl')
makedepends=('git')
optdepends=('ca-certificates')
provides=('openssl')
conflicts=('openssl')
backup=('etc/ssl/openssl.cnf')
options=('staticlibs')
source=("git+https://github.com/openssl/openssl.git"
        "ca-dir.patch::https://git.archlinux.org/svntogit/packages.git/plain/trunk/ca-dir.patch?h=packages/openssl")
sha256sums=('SKIP'
            'SKIP')


prepare() {
  cd "openssl"

  patch -Np0 -i "$srcdir/ca-dir.patch"
}

pkgver() {
  cd "openssl"

  git describe --long --tags | sed 's/^OpenSSL_//;s/\([^-]*-g\)/r\1/;s/-/./g;s/_/./g'
}

build() {
  cd "openssl"

  ./Configure \
    --prefix="/usr" \
    --libdir="lib" \
    --openssldir="/etc/ssl" \
    enable-ec_nistp_64_gcc_128 \
    linux-x86_64 \
		"-Wa,--noexecstack ${CPPFLAGS} ${CFLAGS} ${LDFLAGS}"
  make depend
  make
}

check() {
  cd "openssl"

  # the test fails due to missing write permissions in /etc/ssl
  # revert this patch for make test
  #patch -Np0 -R -i "$srcdir/ca-dir.patch"
  #make test
  #patch -Np0 -i "$srcdir/ca-dir.patch"
}

package() {
  cd "openssl"

  make \
    DESTDIR="$pkgdir" \
    install_sw \
    install_ssldirs \
    install_man_docs
}
