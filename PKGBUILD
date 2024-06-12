# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=cortile
pkgver=2.5.0
pkgrel=1
pkgdesc="Auto tiling manager with hot corner support for EWMH compliant window managers using the X11 window system."
arch=('x86_64' 'aarch64')
url="https://github.com/leukipp/cortile"
license=('MIT')
depends=('glibc')
makedepends=('go')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('250ac64da380512c25118b9f65e5cc132e156828662c25dbafd0da3d9dc4e076')

prepare() {
  cd "$pkgname-$pkgver"
  mkdir -p build

  sed -i 's|usr/local|usr|g' "assets/services/$pkgname.service"
}

build() {
  cd "$pkgname-$pkgver"
  export GOPATH="$srcdir/gopath"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath"
  go mod vendor
  go build -v \
    -ldflags="-linkmode external -extldflags \"${LDFLAGS}\" -s -w -X main.name=$pkgname -X main.version=$pkgver -X main.date=$(date +%Y%m%d)" \
    -o build ...

  # Clean module cache for makepkg -C
  go clean -modcache
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 "build/$pkgname" -t "$pkgdir/usr/bin/"
  install -Dm644 "assets/services/$pkgname.service" -t "$pkgdir/usr/lib/systemd/user/"
  cp -r assets/scripts "$pkgdir/usr/share/doc/$pkgname"
  install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
