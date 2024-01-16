# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=cortile
pkgver=2.3.2
pkgrel=1
pkgdesc="Auto tiling manager with hot corner support for EWMH compliant window managers using the X11 window system."
arch=('x86_64')
url="https://github.com/leukipp/cortile"
license=('MIT')
depends=('glibc')
makedepends=('go')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('ab7976810e5bab6dcb6259153f09c1abdfa5292b71598817a02159c89f2710f6')

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
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -modcacherw"
  go mod vendor
  go build -v -o build ...

  # Clean module cache for makepkg -C
  go clean -modcache
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 "build/$pkgname" -t "$pkgdir/usr/bin/"
  install -Dm644 "assets/services/$pkgname.service" -t "$pkgdir/usr/lib/systemd/user/"
  install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
  cp -r assets/scripts "$pkgdir/usr/share/doc/$pkgname"
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
