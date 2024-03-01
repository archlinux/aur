# Maintainer: Peter Cai <peter@typeblog.net>

pkgname=lpac-git
pkgver=r164.5a7fcc3
pkgrel=1
pkgdesc="Local Profile Agent (LPA) for eSIM cards via PC/SC readers, or AT / APDU commands over stdio."
arch=(x86_64 aarch64 armv7h)
url="https://github.com/estkme-group/lpac"
license=('AGPL-3.0-only AND LGPL-2.0-only AND MIT')
depends=(curl pcsclite)
makedepends=(cmake)
provides=(lpac)
conflicts=(lpac)
source=($pkgname::git+https://github.com/estkme-group/lpac)
sha256sums=(SKIP)

pkgver() {
  cd "$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
  cd "$srcdir/$pkgname"
  # Do not leave reference to build path
  CFLAGS="-fmacro-prefix-map=$PWD=/fake/root" cmake . \
    -DCMAKE_INSTALL_PREFIX="/usr" -DCMAKE_INSTALL_LIBDIR="/usr/lib"
  make
}

package() {
  cd "$srcdir/$pkgname"
  make DESTDIR="$pkgdir" install
}
