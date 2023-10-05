# Maintainer:Bipin Kumar <kbipinkumar@pm.me>
# Previous Maintainer: Clint Valentine <valentine.clint@gmail.com>

pkgname=lollipops
pkgver=1.7.1
pkgrel=1
pkgdesc="Lollipop-style mutation diagrams for annotating genetic variations. https://doi.org/10.1371/journal.pone.0160519"
arch=('x86_64')
url="https://github.com/joiningdata/lollipops"
license=('GPL3')
depends=('glibc')
makedepends=('go')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/joiningdata/lollipops/archive/refs/tags/v${pkgver}.tar.gz")

b2sums=('4ca88342d4d1a85cacfaeeec9de43bdb3b11a049620c0e52324cbc070bdeb0d64aba2f37e9e46219b348e02254c1493621315017c34b3e2b8a0eb332382200ee')

prepare(){
  cd "$pkgname-$pkgver"
  mkdir -p build/
  go mod tidy
}

build() {
  cd "$pkgname-$pkgver"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
  go build -o build 
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 build/$pkgname "$pkgdir"/usr/bin/$pkgname
}
