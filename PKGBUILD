# Maintainer: Thomas Jost <schnouki@schnouki.net>
pkgname=jabridge
pkgver=1.4.0
pkgrel=1
pkgdesc="Control Jabra headsets and dongles on Linux. Change settings, manage sound and update supported firmware."
arch=('x86_64' 'armv7h')
url="https://github.com/Watchdog0x/jabridge"
license=('Apache-2.0')
depends=()
makedepends=('go')
source=("https://github.com/Watchdog0x/jabridge/releases/download/v${pkgver}/jabridge_${pkgver}_source.tar.gz")
sha256sums=('95000d5bbf441d79397010c0d7680a073b4552c307c0abe4e38ed4da7ca07327')

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
