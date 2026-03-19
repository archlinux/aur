# Maintainer: SteamedFish <steamedfish@hotmail.com>
pkgname=tmuxai
pkgver=2.1.2
pkgrel=1
pkgdesc='AI-powered, non-intrusive terminal assistant for tmux'
arch=('x86_64' 'aarch64')
url='https://tmuxai.dev/'
license=('Apache-2.0')
depends=('tmux')
makedepends=('go')
source=("$pkgname-$pkgver.tar.gz::https://github.com/alvinunreal/$pkgname/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('d96418e9738bdc90c60f1bda7e8c88f1dbd06a448cdcf1b26a51ad8659ddc473')

build() {
    cd "$pkgname-$pkgver"
    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    export CGO_LDFLAGS="${LDFLAGS}"
    export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
    go build -o "$pkgname" .
}

check() {
    cd "$pkgname-$pkgver"
    go test ./...
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
    install -Dm644 config.example.yaml "$pkgdir/usr/share/doc/$pkgname/config.example.yaml"
}
