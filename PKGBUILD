# Maintainer: Swadhin Biswas <swadhinbiswas@users.noreply.github.com>
pkgname=veet-git
pkgver=1.0.3.r0.g83d43ef
pkgrel=1
pkgdesc="Universal Linux application uninstaller & deep-clean residual purger (VCS git version)"
arch=('x86_64' 'aarch64')
url="https://github.com/swadhinbiswas/veet"
license=('MIT')
depends=('glibc')
makedepends=('git' 'go')
provides=('veet')
conflicts=('veet' 'veet-bin')
optdepends=(
    'ttf-nerd-fonts-symbols: for glyph icons without patching base font'
    'ttf-jetbrains-mono-nerd: recommended modern mono font with glyph icons'
    'flatpak: for Flatpak app management'
    'snapd: for Snap package management'
    'pacman: for Arch package management'
)
source=("git+$url.git")
sha256sums=('SKIP')

pkgver() {
    cd "veet"
    git describe --long --tags --abbrev=7 2>/dev/null | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
    cd "veet"
    export CGO_ENABLED=0
    export GOFLAGS="-buildmode=pie -trimpath -modcacherw"
    export LDFLAGS="-s -w -X main.version=$pkgver"
    go build -ldflags "$LDFLAGS" -o veet .
}

check() {
    cd "veet"
    go test ./...
}

package() {
    cd "veet"
    install -Dm755 veet "$pkgdir/usr/bin/veet"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"

    # Shell autocompletions
    "$pkgdir/usr/bin/veet" completion bash | install -Dm644 /dev/stdin "$pkgdir/usr/share/bash-completion/completions/veet"
    "$pkgdir/usr/bin/veet" completion zsh  | install -Dm644 /dev/stdin "$pkgdir/usr/share/zsh/site-functions/_veet"
    "$pkgdir/usr/bin/veet" completion fish | install -Dm644 /dev/stdin "$pkgdir/usr/share/fish/vendor_completions.d/veet.fish"
}
