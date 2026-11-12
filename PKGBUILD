# Maintainer: Thomas Jost <schnouki@schnouki.net>
pkgname=jabridge
pkgver=1.7.0
pkgrel=1
pkgdesc="Control Jabra headsets and dongles on Linux. Change settings, manage sound and update supported firmware."
arch=('x86_64' 'armv7h')
url="https://github.com/Watchdog0x/jabridge"
license=('Apache-2.0')
depends=()
makedepends=('go')
source=("https://github.com/Watchdog0x/jabridge/releases/download/v${pkgver}/jabridge_${pkgver}_source.tar.gz")
b2sums=('3f3494f911e781f123b5f756c71e12074c6d58d476ab1c15a7d5a9ba94fa2bfc9ab9a27b82200cb9dc5dc914b905946f957f51df3b1fc427f3f97316e218911f')
sha256sums=('aa60888f69c04a543c5e1bd107de289f3c60debcfb442fc3b0e70fe3de0d245b')

prepare() {
  cd "$srcdir/${pkgname}_${pkgver}_source"
  export GOPATH="${srcdir}"
  go mod download -modcacherw

  # Makefile: install shouldn't depend on build
  sed -i 's/^install:.*/install:/' Makefile
}

build() {
  cd "$srcdir/${pkgname}_${pkgver}_source"
  export GOPATH="${srcdir}"
  export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"
  local buildinfo=github.com/Watchdog0x/jabridge/internal/buildinfo
  make LDFLAGS="-X ${buildinfo}.Version=${pkgver} -X ${buildinfo}.SelfUpdate=disabled -X ${buildinfo}.Setup=disabled" build
}

package() {
  cd "$srcdir/${pkgname}_${pkgver}_source"
  make DESTDIR="$pkgdir" PREFIX="/usr" install
}
