# Maintainer: Kief Studio <packages@kief.studio>
pkgname=aur-scanner
pkgver=0.1.1
pkgrel=1
pkgdesc="Security scanner for Arch Linux AUR packages - detect malicious PKGBUILDs before installation"
arch=('x86_64' 'aarch64')
url="https://github.com/KiefStudioMA/ks-aur-scanner"
license=('GPL-3.0-or-later')
depends=('gcc-libs' 'openssl')
makedepends=('cargo' 'clang')
provides=('aur-scan')
conflicts=('aur-scanner-git' 'ks-aur-scanner')
source=("$pkgname-$pkgver.tar.gz::https://github.com/KiefStudioMA/ks-aur-scanner/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('61fdf777b4c955a96ab0676c9036d8eff96a7a6c396ffed83a40cef34141140e')

prepare() {
    cd "ks-aur-scanner-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd "ks-aur-scanner-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --release --all
}

check() {
    cd "ks-aur-scanner-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    cargo test --release --all
}

package() {
    cd "ks-aur-scanner-$pkgver"

    # Install binaries
    install -Dm755 "target/release/aur-scan" "$pkgdir/usr/bin/aur-scan"
    install -Dm755 "target/release/aur-scan-hook" "$pkgdir/usr/bin/aur-scan-hook"
    install -Dm755 "target/release/aur-scan-wrap" "$pkgdir/usr/bin/aur-scan-wrap"

    # Install shell integration
    install -Dm644 "install/integration.bash" "$pkgdir/usr/share/aur-scanner/integration.bash"
    install -Dm644 "install/integration.zsh" "$pkgdir/usr/share/aur-scanner/integration.zsh"

    # Install pacman hook
    install -Dm644 "install/aur-scan.hook" "$pkgdir/usr/share/libalpm/hooks/90-aur-scanner.hook"

    # Install license
    install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

    # Install documentation
    install -Dm644 "README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
}
