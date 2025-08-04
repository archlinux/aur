# Maintainer: saitewasreset <saiteTimedOut at outlook dot com>

pkgname=moonpalace
pkgver=0.12.0
pkgrel=1
pkgdesc='A debugging proxy to capture, inspect, and troubleshoot Moonshot AI API calls'
arch=('x86_64')
url="https://github.com/MoonshotAI/moonpalace"
license=('GPL-3.0-or-later')
depends=('glibc')
makedepends=('go')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/MoonshotAI/moonpalace/archive/v${pkgver}.tar.gz")
sha256sums=('a8a16600f85ba94f900f45156a6381ad3c8ddc2ef0e6c46d4292f704ab8ebf20')

prepare(){
  cd "$pkgname-$pkgver"
  mkdir -p build/
}

build() {
  cd "$pkgname-$pkgver"

  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOPATH="${srcdir}"
  export GOFLAGS="-buildmode=pie -mod=readonly -modcacherw"

  go build -ldflags "-compressdwarf=false -linkmode external" -o build .
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 build/$pkgname "$pkgdir"/usr/bin/$pkgname
}