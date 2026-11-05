# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Pairadux

pkgname=muxly
pkgver=0.27.0
pkgrel=1
pkgdesc='A lightweight CLI for handling TMUX sessions with ease'
url='https://github.com/Pairadux/muxly'
arch=(aarch64 i686 x86_64)
license=(MIT)
depends=(glibc)
makedepends=(go)
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('7ce44a7403ae60b92de03e2b7db6d066db9f47eec996dfcb5b8d244c3d0d279d')

prepare() {
    export GOPATH="$srcdir"
    cd "$pkgname-$pkgver"
    mkdir -p build
    go mod download -modcacherw
}

build() {
    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    export CGO_LDFLAGS="${LDFLAGS}"
    export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"

    cd "$pkgname-$pkgver"
    go build -o build/muxly
    ./build/muxly completion bash > muxly.bash
    ./build/muxly completion zsh > muxly.zsh
    ./build/muxly completion fish > muxly.fish
}

check() {
    cd "$pkgname-$pkgver"
    go test ./...
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm755 build/muxly -t "$pkgdir/usr/bin/"
    install -Dm644 muxly.bash "$pkgdir/usr/share/bash-completion/completions/muxly"
    install -Dm644 muxly.zsh "$pkgdir/usr/share/zsh/site-functions/_muxly"
    install -Dm644 muxly.fish -t "$pkgdir/usr/share/fish/vendor_completions.d/"
    install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
    install -Dm644 README.md -t "$pkgdir/usr/share/docs/$pkgname/"
}
