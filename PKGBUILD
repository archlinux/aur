# Maintainer: adrianpriza-ai <coreygit1@gmail.com>

pkgname=alps-pm
pkgver=0.9.8
pkgrel=1
pkgdesc="A unified frontend for Linux package managers (Advanced Linux Package System)"
arch=('x86_64' 'aarch64' 'armv7h')
url="https://github.com/adrianpriza-ai/alps"
license=('MIT')
depends=('pacman' 'curl')
makedepends=('go')
optdepends=(
    'git: required for AUR makepkg fallback'
    'base-devel: required for AUR makepkg fallback'
    'yay: preferred AUR helper'
)
conflicts=('alps')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('SKIP')

prepare() {
    cd "alps-$pkgver"
    export GOPATH="$srcdir/gopath"
    go mod download
}

build() {
    cd "alps-$pkgver"
    export CGO_ENABLED=0
    export GOPATH="$srcdir/gopath"
    go build -ldflags="-s -w -X main.version=v$pkgver" -o alps .
}

check() {
    cd "alps-$pkgver"
    export GOPATH="$srcdir/gopath"
    go test ./...
}

package() {
    cd "alps-$pkgver"

    install -Dm755 alps "$pkgdir/usr/bin/alps"
    
    ln -sf alps "$pkgdir/usr/bin/alps-pm"

    if [ -x ./alps ]; then
        ./alps completion bash > alps.bash 2>/dev/null && \
            install -Dm644 alps.bash "$pkgdir/usr/share/bash-completion/completions/alps" && \
            ln -sf alps "$pkgdir/usr/share/bash-completion/completions/alps-pm"
            
        ./alps completion zsh > _alps 2>/dev/null && \
            install -Dm644 _alps "$pkgdir/usr/share/zsh/site-functions/_alps" && \
            ln -sf _alps "$pkgdir/usr/share/zsh/site-functions/_alps-pm"
            
        ./alps completion fish > alps.fish 2>/dev/null && \
            install -Dm644 alps.fish "$pkgdir/usr/share/fish/vendor_completions.d/alps.fish" && \
            ln -sf alps.fish "$pkgdir/usr/share/fish/vendor_completions.d/alps-pm.fish"
    fi

    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
