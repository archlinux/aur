pkgname=happy-go-christmas
pkgver=1.1.0
pkgrel=1
pkgdesc="A high-performance console Christmas tree written in Go with embedded music"
arch=('x86_64' 'aarch64')
url="https://github.com/XPLassal/happy-go-christmas"
license=('MIT')
depends=('alsa-lib' 'glibc')
makedepends=('go' 'git')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('c70f16bc105fa3de56b7dfd25950545cdec3e0e281bb23dea4dca6a25263a98f')

build() {
    cd "$pkgname-$pkgver"

    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    export CGO_LDFLAGS="${LDFLAGS}"
    export GOEXPERIMENT=greenteagc

    go build \
      -trimpath \
      -buildmode=pie \
      -mod=readonly \
      -modcacherw \
      -ldflags "-s -w -linkmode external -extldflags \"${LDFLAGS}\"" \
      -o happy_new_year .
}

package() {
    cd "$pkgname-$pkgver"

    install -Dm755 happy_new_year "$pkgdir/usr/bin/$pkgname"

    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"

    install -Dm644 happy-go-christmas.desktop "$pkgdir/usr/share/applications/$pkgname.desktop"

    install -Dm644 icon.png "$pkgdir/usr/share/pixmaps/$pkgname.png"
}
