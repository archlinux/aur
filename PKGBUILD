# Maintainer: Libor Wagner <liborw@archlinux.org>
pkgname=trice-git
pkgver=v0.18.4.r703.g8b91772b
pkgrel=1
pkgdesc='Super fast and tiny embedded device C printf-like trace code and real-time PC logging'
arch=('x86_64')
url="https://rokath.github.io/trice/"
license=('MIT')
makedepends=('go')
source=("$pkgname::git+https://github.com/rokath/trice.git")
sha256sums=('SKIP')

pkgver() {
  cd "$pkgname"
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
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
  install -Dm755 build/$pkgname "$pkgdir"/usr/bin/$pkgname
  install -Dm755 pkg/src/trice.h "$pkgdir"/usr/share/$pkgname/trice.h
  install -Dm755 pkg/src/trice.c "$pkgdir"/usr/share/$pkgname/trice.c
  install -Dm755 ./src/trice/test/MDK-ARM_STM32F030R8/Core/Inc/triceConfig.h "$pkgdir"/usr/share/$pkgname/triceConfig.h
}
