# Maintainer: adrianpriza-ai <coreygit1@gmail.com>

pkgname=alps-pm
pkgver=1.0.5
pkgrel=1
pkgdesc="A unified frontend for Linux package managers (Advanced Linux Package System)"
arch=('x86_64' 'aarch64' 'armv7h')
url="https://github.com/adrianpriza-ai/alps"
license=('MIT')
depends=('pacman')
makedepends=('go')
optdepends=(
    'git: required for AUR makepkg fallback'
    'base-devel: required for AUR makepkg fallback'
    'yay: preferred AUR helper'
    'coreutils: alps-more entries (mkdir, cp, chmod, gzip, ln)'
    'tar: alps-more entries using .tar.gz/.tar.xz/.tar.bz2 archives'
    'unzip: alps-more entries using .zip archives'
    'bash: running alps-more entry scripts'
    'fakeroot: alps-more entries requiring fakeroot'
    'systemd: alps-more entries managing systemd services'
    'shadow: alps-more entries using useradd/userdel'
)
conflicts=('alps')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('9ff0b84f038a5e78aedfed2cc7625907d8e11fc6d5acbdbb49e7a41fed18e18d')

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

    install -Dm755 alps "$pkgdir/usr/bin/alps-pm"
    ln -sf alps-pm "$pkgdir/usr/bin/alps"

    local host_tmp
    host_tmp=$(mktemp -d)
    cp alps "$host_tmp/alps-pm"
    ln -s alps-pm "$host_tmp/alps"
    chmod +x "$host_tmp/alps-pm"

    if "$host_tmp/alps-pm" completion bash >/dev/null 2>&1; then
        mkdir -p "$pkgdir/usr/share/bash-completion/completions"
        "$host_tmp/alps" completion bash > "$pkgdir/usr/share/bash-completion/completions/alps"
        "$host_tmp/alps-pm" completion bash > "$pkgdir/usr/share/bash-completion/completions/alps-pm"

        mkdir -p "$pkgdir/usr/share/fish/vendor_completions.d"
        "$host_tmp/alps" completion fish > "$pkgdir/usr/share/fish/vendor_completions.d/alps.fish"
        "$host_tmp/alps-pm" completion fish > "$pkgdir/usr/share/fish/vendor_completions.d/alps-pm.fish"

        mkdir -p "$pkgdir/usr/share/zsh/site-functions"
        "$host_tmp/alps" completion zsh > "$pkgdir/usr/share/zsh/site-functions/_alps"
        "$host_tmp/alps-pm" completion zsh > "$pkgdir/usr/share/zsh/site-functions/_alps-pm"
    fi
    rm -rf "$host_tmp"

    install -Dm644 LICENSE \
        "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

    install -Dm644 README.md \
        "$pkgdir/usr/share/doc/$pkgname/README.md"
}
