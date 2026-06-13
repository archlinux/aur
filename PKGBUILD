# Maintainer: Kief Studio <packages@kief.studio>
pkgname=aur-scanner-git
pkgver=1.0.1.r4.gf67c155
pkgrel=1
pkgdesc="Security scanner for Arch Linux AUR packages - detect malicious PKGBUILDs before installation"
arch=('x86_64' 'aarch64')
url="https://github.com/KiefStudioMA/ks-aur-scanner"
license=('GPL-3.0-or-later')
depends=('gcc-libs' 'openssl')
makedepends=('cargo' 'git' 'clang')
provides=('aur-scanner' 'aur-scan')
conflicts=('aur-scanner' 'ks-aur-scanner')
source=("git+https://github.com/KiefStudioMA/ks-aur-scanner.git")
sha256sums=('SKIP')

pkgver() {
    cd ks-aur-scanner
    local tag_ver
    tag_ver=$(git describe --long --tags 2>/dev/null | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g')
    if [[ -n "$tag_ver" ]]; then
        echo "$tag_ver"
    else
        printf "0.1.0.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
    fi
}

prepare() {
    cd ks-aur-scanner
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd ks-aur-scanner
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --release --all
}

check() {
    cd ks-aur-scanner
    export RUSTUP_TOOLCHAIN=stable
    cargo test --release --all
}

package() {
    cd ks-aur-scanner

    # Binaries
    install -Dm755 "target/release/aur-scan" "$pkgdir/usr/bin/aur-scan"
    install -Dm755 "target/release/aur-scan-wrap" "$pkgdir/usr/bin/aur-scan-wrap"
    install -Dm755 "target/release/aur-scan-hook" "$pkgdir/usr/bin/aur-scan-hook"

    # Shell integration -- the recommended gate. Source it from your shell rc to
    # scan AUR packages BEFORE makepkg builds them.
    install -Dm644 "install/integration.bash" "$pkgdir/usr/share/aur-scan/integration.bash"
    install -Dm644 "install/integration.zsh" "$pkgdir/usr/share/aur-scan/integration.zsh"
    install -Dm644 "install/integration.fish" "$pkgdir/usr/share/aur-scan/integration.fish"

    # Community rules example
    install -Dm644 "install/rules.d/example.toml" "$pkgdir/usr/share/aur-scanner/rules.d/example.toml"

    # pacman hook, shipped as an opt-in example (NOT auto-enabled). It runs after
    # makepkg has already built the package, so it only catches install-scriptlet
    # payloads -- prefer the shell integration above.
    install -Dm644 "install/aur-scan.hook" "$pkgdir/usr/share/aur-scan/aur-scan.hook.example"

    # License + docs
    install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 "README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
}
