# Maintainer: Julien Virey <julien.virey+aur@gmail.com>

pkgname=dbdeployer
pkgver=2.5.0
pkgrel=2
pkgdesc='A tool that deploys MySQL database servers easily.'
url='https://github.com/ProxySQL/dbdeployer'
arch=('aarch64' 'x86_64')
license=(Apache-2.0)
depends=('glibc')
makedepends=('go')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('a5028ede0b4fe2d20e49d32d4407927cef52ed652fff3a8796e8cc5bb736e977')

prepare() {
  cd "$pkgname-$pkgver"
  export GOMODCACHE="${GOMODCACHE:-$srcdir/gomod}"
  go mod download -modcacherw
}

build() {
  cd "$pkgname-$pkgver"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"

  go build \
    -ldflags="-s -w -linkmode=external -X ${url#*//}/common.VersionDef=$pkgver" \
    -o "$pkgname"
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  go clean -modcache
}
