# Maintainer: Libor Wagner <liborw@archlinux.org>
pkgname=trice-git
pkgver=v0.48.0.r3.ga024079b
pkgrel=2
pkgdesc='Super fast and tiny embedded device C printf-like trace code and real-time PC logging'
conflicts=('trice')
provides=('trice')
arch=('x86_64')
url="https://rokath.github.io/trice/"
license=('MIT')
makedepends=('go')
source=("$pkgname::git+https://github.com/rokath/trice.git")
sha256sums=('SKIP')

pkgver() {
  cd "$pkgname"
  git describe --tags --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare(){
  cd "$pkgname"
  mkdir -p build/
}

build() {
  cd "$pkgname"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
  go build -o build ./cmd/...
}

package() {
  cd "$pkgname"
  install -Dm755 build/trice "$pkgdir"/usr/bin/trice
  install -Dm755 pkg/src/trice.h "$pkgdir"/usr/share/trice/trice.h
  install -Dm755 pkg/src/trice.c "$pkgdir"/usr/share/trice/trice.c
  install -Dm755 test/MDK-ARM_STM32F030R8/Core/Inc/triceConfig.h "$pkgdir"/usr/share/trice/triceConfig.h
}
