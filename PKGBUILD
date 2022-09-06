# Maintainer: Daniel Milde <daniel@milde.cz>
# Contributor: George Rawlinson <george@rawlinson.net.nz>

pkgname=esbuild
pkgver=0.15.7
pkgrel=1
pkgdesc="An extremely fast JavaScript/TypeScript bundler and minifier"
arch=('x86_64' 'aarch64')
url="https://github.com/evanw/esbuild"
license=('MIT')
makedepends=('go')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
b2sums=('d7ccfef781a6e28f0de011c956ef462d602325072e6fee0b2e969f4a9ebe6d9648482bc08971a9d99560742fae95f8c93e6d6bd4a2cc8b01ecbbad221a6b3293')

prepare() {
  cd "$pkgname-$pkgver"
  mkdir -p build
}

build () {
  cd "$pkgname-$pkgver"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
  go build -o build ./cmd/...
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 -t "$pkgdir/usr/bin" "build/$pkgname"
  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE.md
}
