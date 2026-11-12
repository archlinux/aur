# Maintainer: Julien Virey <julien.virey@gmail.com>

pkgname=dockerfile-pin
pkgver=1.6.0
pkgrel=1
pkgdesc='A CLI tool for digest pinning for Dockerfile, docker-compose.yml and GitHub Actions'
arch=(x86_64 aarch64)
url='https://github.com/azu/dockerfile-pin'
license=(MIT)
conflicts=("${pkgname}-bin")
depends=(glibc)
makedepends=('go')
options=(!lto)
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('f7b5c4e4914699470533c4ee3acdcf442dbe493af52968c3d73eaedae7190168')

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
  export GOFLAGS="-buildmode=pie -trimpath  -mod=readonly -modcacherw"

  go build -ldflags="-w -s -linkmode=external -X github.com/azu/dockerfile-pin/cmd.version=${pkgver}" .

  # Clean up deps
  go clean -modcache
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
