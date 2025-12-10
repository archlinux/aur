pkgname=happy-go-christmas
pkgver=1.0.7
pkgrel=1
pkgdesc="A high-performance console Christmas tree written in Go with embedded music"
arch=('x86_64' 'aarch64')
url="https://github.com/XPLassal/happy-go-christmas"
license=('MIT')
depends=('alsa-lib' 'glibc')
makedepends=('go' 'git')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('9ffc42ad55d6dd79c68094732f00c41ea7f3c5bb586bbd29a16743daa3eb75b6')

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
