# Maintainer: Dmitry Beskrovny <dimatematik at gmail dot com>
pkgname=omm
pkgver=0.7.0
pkgrel=1
pkgdesc='"on-my-mind": A keyboard-driven task manager for the command line'
arch=('x86_64' 'i686' 'arm64')
url="https://github.com/dhth/omm"
license=('MIT')
makedepends=('go')
conflicts=('omm-bin' 'omm-git')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/dhth/omm/archive/v${pkgver}.tar.gz")
sha256sums=('92d4d36f13c40fd3b14dc4dde00d0edccdc816706c2238c3429a2a1f2be30842')

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
  install -Dm644 "$srcdir/$pkgname-$pkgver/README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
}
