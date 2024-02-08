# Maintainer: Peter Cai <peter@typeblog.net>

pkgname=lpac-git
pkgver=r125.cbe5b18
pkgrel=1
pkgdesc="Local Profile Agent (LPA) for eSIM cards via PC/SC readers, or AT / APDU commands over stdio."
arch=(x86_64 aarch64 armv7h)
url="https://github.com/estkme-group/lpac"
license=('AGPL-3.0-only AND LGPL-2.0-only AND MIT')
depends=(curl pcsclite)
makedepends=(cmake)
provides=(lpac)
source=($pkgname::git+https://github.com/estkme-group/lpac)
sha256sums=(SKIP)

pkgver() {
  cd "$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
  cd "$srcdir/$pkgname"
  # Do not leave reference to build path
  CFLAGS="-fmacro-prefix-map=$PWD=/fake/root" LDFLAGS="-Wl,-rpath,/usr/lib/lpac" cmake .
  make
}

package() {
  cd "$srcdir/$pkgname"
  install -Dm755 output/lpac $pkgdir/usr/bin/lpac
  # APDU interfaces
  install -Dm644 output/libapduinterface_pcsc.so $pkgdir/usr/lib/lpac/libapduinterface_pcsc.so
  install -Dm644 output/libapduinterface_at.so $pkgdir/usr/lib/lpac/libapduinterface_at.so
  install -Dm644 output/libapduinterface_stdio.so $pkgdir/usr/lib/lpac/libapduinterface_stdio.so
  # HTTP interfaces
  install -Dm644 output/libhttpinterface_curl.so $pkgdir/usr/lib/lpac/libhttpinterface_curl.so
  install -Dm644 output/libhttpinterface_stdio.so $pkgdir/usr/lib/lpac/libhttpinterface_stdio.so
}
