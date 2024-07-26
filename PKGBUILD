# Maintainer: Dmitriy Beskrovnyi <dimatematik at gmail dot com>
pkgname=omm
pkgver=0.4.2
pkgrel=1
pkgdesc='"on-my-mind": A keyboard-driven task manager for the command line'
arch=('x86_64' 'i686' 'arm64')
url="https://github.com/dhth/omm"
license=('MIT')
makedepends=('go')
conflicts=('omm-bin' 'omm-git')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/dhth/omm/archive/v${pkgver}.tar.gz")
sha256sums=('ea6441f310bf05bcfba88e7c6f71f8380144d1599c1ea2c6da2136830f91f5c5')

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
