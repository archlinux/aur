# Maintainer: Thomas Jost <schnouki@schnouki.net>
pkgname=jabridge
pkgver=1.7.1
pkgrel=1
pkgdesc="Control Jabra headsets and dongles on Linux. Change settings, manage sound and update supported firmware."
arch=('x86_64' 'armv7h')
url="https://github.com/Watchdog0x/jabridge"
license=('Apache-2.0')
depends=()
makedepends=('go')
source=("https://github.com/Watchdog0x/jabridge/releases/download/v${pkgver}/jabridge_${pkgver}_source.tar.gz")
sha256sums=('83ab0a4ed594fa977a892a9a862b5b3244ac7e9a0c033fe79e7487bdb3a0991f')
b2sums=('a7295024db36eeebf2a3509d56e026fef966c0d08f3ef8fb878eef4e1872b8651fd22e0928d93e7a73a82d314fce726d85f1859bcd9ee29ba8ff854c80d77626')

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
