pkgname=patreon-dl
pkgver=0.1.1
pkgrel=1
pkgdesc='A downloader for Patreon content.'
arch=('x86_64' 'arm' 'aarch64')
url="https://github.com/PrivateGER/$pkgname"
license=('Unlicense')
depends=('glibc')
makedepends=('go')
source=("$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('fa706a5902b9d9f3c86f1fbbfa3fad8bde4a0c15e2c0e32328e5ec6ee6a65990')

prepare(){
  cd "$pkgname-$pkgver"
  mkdir -p build/
}

build() {
  cd "$pkgname-$pkgver"
  export CGO_CPPFLAGS="-D_FORTIFY_SOURCE=2"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="-Wl,-z,relro,-z,now"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
  go build -ldflags "-X main.buildVersion=$VERSION" -o build ./...
}

check() {
  cd "$pkgname-$pkgver"
  go test ./...
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 build/$pkgname "$pkgdir"/usr/bin/$pkgname
}
