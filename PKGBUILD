# Maintainer: Zyekh Abdul <zyekhabdul@users.noreply.github.com>
pkgname=gamectl-git
pkgver=1.2.0.r116.gfdafd3b
pkgrel=1
pkgdesc="Sovereign TUI Game Manager & Launcher for Linux (Zero-Bloat, VCS development branch)"
arch=('any')
url="https://github.com/zyekhabdul/gamectl"
license=('MIT')
depends=(
    'bash'
    'curl'
    'file'
    'fzf'
    'jq'
    'openssh'
    'python'
    'rsync'
    'unzip'
)
makedepends=('git')
optdepends=(
    'bubblewrap: Rootless security sandbox isolation profile (--sandbox)'
    'gamemode: Performance optimizations during gameplay'
    'gamescope: Micro-compositor with dynamic FSR upscaling'
    'mangohud: On-screen performance overlay and frame limiter'
    'python-ruamel-yaml: Preserves indentation in YAML configs'
    'umu-launcher: Unified Linux compatibility runner'
)
provides=('gamectl')
conflicts=('gamectl')
source=("git+$url.git")
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/gamectl"
    local count
    count=$(git rev-list --count HEAD 2>/dev/null || echo "0")
    local hash
    hash=$(git rev-parse --short HEAD 2>/dev/null || echo "0000000")
    local tag
    tag=$(git describe --tags --abbrev=0 2>/dev/null || echo "1.2.0")
    tag="${tag#v}"
    printf "%s.r%s.g%s" "$tag" "$count" "$hash"
}

package() {
    cd "$srcdir/gamectl"

    # Install standalone executable and shorthand alias
    install -Dm755 bin/gamectl "$pkgdir/usr/bin/gamectl"
    ln -sf gamectl "$pkgdir/usr/bin/game"

    # Install shell autocompletion
    install -Dm644 completions/gamectl.bash "$pkgdir/usr/share/bash-completion/completions/gamectl"
    ln -sf gamectl "$pkgdir/usr/share/bash-completion/completions/game"

    # Install FreeDesktop desktop application entry
    install -Dm644 gamectl.desktop "$pkgdir/usr/share/applications/gamectl.desktop"

    # Install documentation and license
    install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname" README.md docs/GUIDE.md docs/ARCHITECTURE.md
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
