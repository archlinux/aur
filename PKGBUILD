# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=gnutls-git
pkgver=3.8.9.r2.g5c1a38f7e
pkgrel=1
pkgdesc="A secure communications library implementing the SSL, TLS and DTLS protocols and technologies around them"
arch=('i686' 'x86_64')
url="https://www.gnutls.org/"
license=('LGPL-2.1-or-later AND GPL-3.0-or-later')
depends=('glibc' 'brotli' 'leancrypto' 'libidn2' 'libp11-kit' 'libtasn1' 'libunistring' 'nettle' 'readline' 'zlib' 'zstd')
makedepends=('git' 'autogen' 'gperf' 'gtk-doc' 'p11-kit' 'rsync' 'wget')
optdepends=('tpm2-tss: support for TPM2 wrapped keys')
provides=("gnutls=$pkgver")
conflicts=('gnutls')
backup=('etc/gnutls/config'
        'etc/modules-load.d/gnutls.conf')
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
    --with-default-trust-store-pkcs11="pkcs11:" \
    --with-leancrypto
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
