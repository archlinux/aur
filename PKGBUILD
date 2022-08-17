# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=gnutls-git
pkgver=3.7.7.r21.g66f511895
pkgrel=1
pkgdesc="A secure communications library implementing the SSL, TLS and DTLS protocols and technologies around them"
arch=('i686' 'x86_64')
url="https://www.gnutls.org/"
license=('LGPL')
depends=('glibc' 'brotli' 'libidn2' 'libtasn1' 'libunistring' 'nettle' 'p11-kit' 'readline' 'zlib')
makedepends=('git' 'autogen' 'gperf' 'gtk-doc' 'rsync' 'wget')
provides=("gnutls=$pkgver")
conflicts=('gnutls')
options=('!zipman')
source=("git+https://gitlab.com/gnutls/gnutls.git")
sha256sums=('SKIP')


pkgver() {
  cd "gnutls"

  git describe --long --tags | sed 's/^gnutls_//;s/\([^-]*-g\)/r\1/;s/[_-]/./g'
}

build() {
  cd "gnutls"

  ./bootstrap
  ./configure \
    --prefix="/usr" \
    --disable-full-test-suite \
    --enable-openssl-compatibility \
    --with-default-trust-store-pkcs11="pkcs11:"
  make
}

check() {
  cd "gnutls"

  #make check
}

package() {
  cd "gnutls"

  make DESTDIR="$pkgdir" install

  # lots of .png files are put into infodir and are gzipped by makepkg! this needs to be fixed by using !zipman
  # gzip -9 all files in infodir and manpages manually
  find "$pkgdir/usr/share/info" -name '*.info*' -exec gzip -n -9 {} \;
  find "$pkgdir/usr/share/man" -exec gzip -n -9 {} \;
}
