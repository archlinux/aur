pkgname=pkcs11-provider
pkgver=r172.g72a9ec1
pkgrel=1
pkgdesc="OpenSSL 3.0 provider for PKCS#11 hardware-backed private keys"
url="https://github.com/latchset/pkcs11-provider"
arch=(x86_64)
license=(Apache)
depends=(
  "openssl>=3.0.5"
  p11-kit
)
makedepends=(
  autoconf-archive
  automake
  gcc
  libtool
)
checkdepends=(
  nss
)
_commit=72a9ec171bbde7b49d241c534afd3e754b65722d
source=("git+https://github.com/latchset/pkcs11-provider#commit=$_commit")
sha256sums=('SKIP')

pkgver() {
  cd $pkgname
  echo "r$(git rev-list --count HEAD).g$(git rev-parse --short HEAD)"
}

prepare() {
  cd $pkgname
  autoreconf -fi
}

build() {
  cd $pkgname
  ./configure --prefix=/usr --sysconfdir=/etc
  make
}

check() {
  cd $pkgname
  make check
}

package() {
  cd $pkgname
  make DESTDIR="$pkgdir" install

  # I don't think it's supposed to go directly in /usr/lib, but I don't feel
  # like moving it either...
  mkdir -p "$pkgdir"/usr/lib/ossl-modules
  ln -sr "$pkgdir"/usr/lib/pkcs11_provider.so "$pkgdir"/usr/lib/ossl-modules/pkcs11.so
}

# vim: ts=2:sw=2:et
