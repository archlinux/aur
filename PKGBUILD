# Maintainer: Kief Studio <packages@kief.studio>
pkgname=aur-scanner
pkgver=1.0.2
pkgrel=1
pkgdesc="Security scanner for Arch Linux AUR packages - detect malicious PKGBUILDs before installation"
arch=('x86_64' 'aarch64')
url="https://github.com/KiefStudioMA/ks-aur-scanner"
license=('GPL-3.0-or-later')
depends=('gcc-libs' 'openssl')
makedepends=('cargo' 'clang' 'git')
provides=('aur-scan')
conflicts=('aur-scanner-git' 'ks-aur-scanner')
# Source is the GPG-signed release tag, verified against our signing key.
# Integrity comes from git + the tag signature (validpgpkeys), which is stronger
# than hashing a GitHub-generated tarball -- so sha256sums is intentionally SKIP.
# Import the key first if makepkg can't find it:
#   gpg --recv-keys 25631EAE3F43999050B7D7021132BF893C33FB51
source=("git+https://github.com/KiefStudioMA/ks-aur-scanner.git#tag=v$pkgver?signed")
validpgpkeys=('25631EAE3F43999050B7D7021132BF893C33FB51') # gitleaks:allow (public GPG key fingerprint, not a secret)
sha256sums=('SKIP')

prepare() {
    cd "ks-aur-scanner"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd "ks-aur-scanner"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --release --all
}

check() {
    cd "ks-aur-scanner"
    export RUSTUP_TOOLCHAIN=stable
    cargo test --release --all
}

package() {
    cd "ks-aur-scanner"

    # Binaries
    install -Dm755 "target/release/aur-scan" "$pkgdir/usr/bin/aur-scan"
    install -Dm755 "target/release/aur-scan-wrap" "$pkgdir/usr/bin/aur-scan-wrap"
    install -Dm755 "target/release/aur-scan-hook" "$pkgdir/usr/bin/aur-scan-hook"

    # Shell integration -- the recommended gate. Source it from your shell rc to
    # scan AUR packages BEFORE makepkg builds them.
    install -Dm644 "install/integration.bash" "$pkgdir/usr/share/aur-scan/integration.bash"
    install -Dm644 "install/integration.zsh" "$pkgdir/usr/share/aur-scan/integration.zsh"

    # Community rules example
    install -Dm644 "install/rules.d/example.toml" "$pkgdir/usr/share/aur-scanner/rules.d/example.toml"

    # pacman hook, shipped as an opt-in example (NOT auto-enabled). It runs after
    # makepkg has already built the package -- prefer the shell integration above.
    install -Dm644 "install/aur-scan.hook" "$pkgdir/usr/share/aur-scan/aur-scan.hook.example"

    # License + docs
    install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 "README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
}
