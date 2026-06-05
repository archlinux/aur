# Maintainer: Julien Virey <julien.virey+aur@gmail.com>
pkgname=reviewdog
pkgver=0.21.0
pkgrel=1
pkgdesc='🐶 Automated code review tool integrated with any code analysis tools regardless of programming language'
arch=(x86_64 aarch64)
url='https://github.com/reviewdog/reviewdog'
license=('MIT')
makedepends=('go')
options=(!lto)
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('c44a17d59a992d2235745f849c6c5348d86d1b9663b9e5ea14509cd0e9b34c8b')

prepare() {
  cd "$pkgname-$pkgver"
  export GOMODCACHE="${GOMODCACHE:-$srcdir/gomod}"
  go mod download -modcacherw
}

build() {
  cd "$pkgname-$pkgver"
  mkdir -p build

  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"

  go build -o "build/$pkgname" .

  # Clean up deps
  go clean -modcache
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 "build/$pkgname" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
}
