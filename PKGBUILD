# Maintainer: Don <theblackdonatello@gmail.com>

pkgname=dcli-arch-git
pkgver=0.1.0.r99.571cb85
pkgrel=1
pkgdesc="A declarative package management CLI tool for Arch Linux, inspired by NixOS"
arch=('x86_64' 'aarch64')
url="https://gitlab.com/theblackdon/dcli"
license=('0BSD')
makedepends=('cargo' 'git')
depends=()
optdepends=(
    'fzf: for interactive TUI features'
    'paru: AUR helper support'
    'yay: AUR helper support (alternative to paru)'
    'timeshift: snapshot/backup functionality'
    'snapper: snapshot/backup functionality (alternative to timeshift)'
)
provides=('dcli')
conflicts=('dcli' 'dcli-bin')
source=("${pkgname%-git}::git+https://gitlab.com/theblackdon/dcli.git")
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/${pkgname%-git}"
    ( set -o pipefail
      git describe --long --tags 2>/dev/null | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g' ||
      printf "0.1.0.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
    )
}

build() {
    cd "$srcdir/${pkgname%-git}"
    export RUSTUP_TOOLCHAIN=stable
    cargo build --release --locked
}

check() {
    cd "$srcdir/${pkgname%-git}"
    cargo test --release --locked
}

package() {
    cd "$srcdir/${pkgname%-git}"
    
    # Install binary
    install -Dm755 "target/release/dcli" "$pkgdir/usr/bin/dcli"
    
    # Install license
    install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
}
