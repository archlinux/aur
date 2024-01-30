# Maintainer: KokaKiwi <kokakiwi+aur [at] kokakiwi dot com>

pkgbase=ssh3
pkgname=(ssh3 ssh3-server)
pkgver=0.1.7
pkgrel=1
pkgdesc='faster and rich secure shell using HTTP/3'
url='https://github.com/francoismichel/ssh3'
license=('Apache-2.0')
arch=('x86_64')
depends=('glibc')
makedepends=('go' 'libxcrypt')
source=("$pkgbase-$pkgver.tar.gz::https://github.com/francoismichel/ssh3/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('23a88d0d7f54f80d752c22ee5f879fa1daf8c320ece364287209c58b3e98b6b5')
b2sums=('daf2d916bc40a63e5ff089ef97c70bae3f2c7e0f74d043c40c2d9b8505d64985240c5679952d171833531b7746421304e5610075d2fca5f78593fa8b7e4890d3')

build() {
  cd "$pkgbase-$pkgver"

  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"

  local builddate=$(date +%Y-%m-%d)
  local linkflags="-X main.version=$pkgver -X main.buildDate=$builddate"

  go build -ldflags "$linkflags" -o ssh3 ./cmd/ssh3
  go build -ldflags "$linkflags" -o ssh3-server ./cmd/ssh3-server
}

package_ssh3() {
  cd "$pkgbase-$pkgver"

  install -Dm0755 ssh3 "$pkgdir/usr/bin/ssh3"

  install -Dm0644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

package_ssh3-server() {
  depends+=('libxcrypt')

  cd "$pkgbase-$pkgver"

  install -Dm0755 ssh3-server "$pkgdir/usr/bin/ssh3-server"

  install -Dm0644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
