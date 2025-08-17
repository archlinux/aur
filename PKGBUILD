# Maintainer: bunburya <dev at bunburya dot eu>

pkgname=bptt
pkgver=1.0.0
pkgrel=1
pkgdesc='Display certain information about British public transport in the terminal.'
arch=('x86_64')
url='https://github.com/bunburya/bptt'
license=('MIT')
makedepends=('go')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/bunburya/bptt/archive/v${pkgver}.tar.gz")
sha256sums=('501fd73dd352dafc288b6853af6c3799c118d57bf4509775c107dab460288452')
options=('!debug')

prepare() {
  cd "$pkgname-$pkgver"
  mkdir -p build/
}

build() {
  cd "$pkgname-$pkgver"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
  go build -o build bptt .
}

check() {
  cd "$pkgname-$pkgver"
  go test ./...
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 build/$pkgname "$pkgdir"/usr/bin/$pkgname
  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
