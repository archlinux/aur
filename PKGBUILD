# Maintainer: Swadhin Biswas <swadhinbiswas@users.noreply.github.com>
pkgname=veet
pkgver=1.0.3
pkgrel=1
pkgdesc="Universal Linux application uninstaller & deep-clean residual purger"
arch=('x86_64' 'aarch64')
url="https://github.com/swadhinbiswas/veet"
license=('MIT')
depends=('glibc')
makedepends=('go')
optdepends=(
    'ttf-nerd-fonts-symbols: for glyph icons without patching base font'
    'ttf-jetbrains-mono-nerd: recommended modern mono font with glyph icons'
    'flatpak: for Flatpak app management'
    'snapd: for Snap package management'
    'pacman: for Arch package management'
)
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('af2d46c849cd5ee49e30169bf6ec2f309d285bc1db69ac7a5d5ff77b3be02527')

build() {
    cd "$pkgname-$pkgver"
    export CGO_ENABLED=0
    export GOFLAGS="-buildmode=pie -trimpath -modcacherw"
    export LDFLAGS="-s -w -X main.version=$pkgver"
    go build -ldflags "$LDFLAGS" -o veet .
}

check() {
    cd "$pkgname-$pkgver"
    go test ./...
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm755 veet "$pkgdir/usr/bin/veet"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"

    # Shell autocompletions
    "$pkgdir/usr/bin/veet" completion bash | install -Dm644 /dev/stdin "$pkgdir/usr/share/bash-completion/completions/veet"
    "$pkgdir/usr/bin/veet" completion zsh  | install -Dm644 /dev/stdin "$pkgdir/usr/share/zsh/site-functions/_veet"
    "$pkgdir/usr/bin/veet" completion fish | install -Dm644 /dev/stdin "$pkgdir/usr/share/fish/vendor_completions.d/veet.fish"
}
