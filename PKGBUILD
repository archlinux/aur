# Maintainer: Dmitriy Beskrovnyi <dimatematik at gmail dot com>
pkgname=omm
pkgver=0.5.0
pkgrel=1
pkgdesc='"on-my-mind": A keyboard-driven task manager for the command line'
arch=('x86_64' 'i686' 'arm64')
url="https://github.com/dhth/omm"
license=('MIT')
makedepends=('go')
conflicts=('omm-bin' 'omm-git')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/dhth/omm/archive/v${pkgver}.tar.gz")
sha256sums=('8604524f57faf398e540877cad377d68388efb9281343bab74ef102b7ac48032')

prepare() {
  cd "$pkgname-$pkgver"
  mkdir -p build/
  go mod download
}

build() {
  cd "$pkgname-$pkgver"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
  go build -o build .
}

check() {
  cd "$pkgname-$pkgver"
  go test -v ./...
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 build/$pkgname "$pkgdir/usr/bin/$pkgname"
  install -Dm644 "$srcdir/$pkgname-$pkgver/LICENSE" "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 "$srcdir/$pkgname-$pkgver/README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
}
