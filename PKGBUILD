# Maintainer: Daniel Milde <daniel@milde.cz>
# Contributor: George Rawlinson <george@rawlinson.net.nz>

pkgname=esbuild
pkgver=0.16.7
pkgrel=1
pkgdesc="An extremely fast JavaScript and CSS bundler and minifier."
arch=('x86_64' 'i686' 'aarch64' 'armv7h')
url="https://esbuild.github.io/"
license=('MIT')
makedepends=('go')
source=("$pkgname-$pkgver.tar.gz::https://github.com/evanw/esbuild/archive/v$pkgver.tar.gz")
b2sums=('7c53afa22e3ec1406e82d288187d14b768a92be011a0c0fe534d161f7064fcc404ea7d1111c8ba1c5aba7c63a19c51a02a52b21af711f85751f4a6ecbb562fb5')

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
