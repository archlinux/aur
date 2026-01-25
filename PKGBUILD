# Maintainer: Your Name <zack.whipkey@gmail.com>
pkgname=gsca
pkgver=1.0.1
pkgrel=1
pkgdesc='Global Steam Command Args - CLI tool to manage Steam game launch options'
arch=('x86_64' 'aarch64')
url="https://github.com/zerkz/gsca"
license=('MIT')
makedepends=('go')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('SKIP')  # Run 'makepkg -g' to generate the actual checksum

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

  go build -o build/$pkgname
}

check() {
  cd "$pkgname-$pkgver"
  go test ./...
}

package() {
  cd "$pkgname-$pkgver"

  # Install binary
  install -Dm755 build/$pkgname "$pkgdir/usr/bin/$pkgname"

  # Install documentation
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"

  # Install license if it exists
  if [ -f LICENSE ]; then
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  fi
}
