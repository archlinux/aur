# Maintainer: Dmitry Beskrovny <dimatematik at gmail dot com>
pkgname=omm
pkgver=0.6.0
pkgrel=1
pkgdesc='"on-my-mind": A keyboard-driven task manager for the command line'
arch=('x86_64' 'i686' 'arm64')
url="https://github.com/dhth/omm"
license=('MIT')
makedepends=('go')
conflicts=('omm-bin' 'omm-git')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/dhth/omm/archive/v${pkgver}.tar.gz")
sha256sums=('bae547f05b8d349c10982cf4380d917f3b3e05004c9282f58b7335077a822363')

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
