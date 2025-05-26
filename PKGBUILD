# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=gshortcuts
pkgver=0.0.2
pkgrel=1
pkgdesc="Command-line tool to manage your GNOME custom shortcuts."
arch=('x86_64')
url="https://gshortcuts.jpinillos.dev"
license=('MIT')
depends=('glib2')
makedepends=('go')
source=("$pkgname-$pkgver.tar.gz::https://github.com/jpinilloslr/gshortcuts/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('30a28419bfd6752a04e36021184866e83f9bbcd8eda87448fcfdd5ac3b9d8544')

prepare(){
  cd "$pkgname-$pkgver"
  mkdir -p build/
}

build() {
  cd "$pkgname-$pkgver"
  export GOPATH="$srcdir/gopath"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
  go build -o build ./cmd/...

  # Clean module cache for makepkg -C
  go clean -modcache
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 "build/$pkgname" -t "$pkgdir/usr/bin/"
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
