# Maintainer: Kief Studio <packages@kief.studio>
pkgname=aur-scanner-git
pkgver=0.1.0.r4.e21ad7a
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

    # Install binaries
    install -Dm755 "target/release/aur-scan" "$pkgdir/usr/bin/aur-scan"
    install -Dm755 "target/release/aur-scan-hook" "$pkgdir/usr/bin/aur-scan-hook"
    install -Dm755 "target/release/aur-scan-wrap" "$pkgdir/usr/bin/aur-scan-wrap"

    # Install pacman hook
    install -Dm644 "install/aur-scan.hook" "$pkgdir/usr/share/libalpm/hooks/90-aur-scanner.hook"

    # Install rules (if external rules exist)
    if [[ -d rules && -n "$(ls -A rules/*.toml 2>/dev/null)" ]]; then
        install -dm755 "$pkgdir/usr/share/aur-scanner/rules"
        install -Dm644 rules/*.toml "$pkgdir/usr/share/aur-scanner/rules/"
    fi

    # Install license
    install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

    # Install documentation
    install -Dm644 "README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
}
