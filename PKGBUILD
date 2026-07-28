# Maintainer: Kief Studio <packages@kief.studio>
#
# RELEASE CANDIDATE channel. This builds the GPG-signed pre-release tag
# (v2.1.0-rc.1) so testers can opt into the next release before it is promoted
# to stable. It installs the same binaries as `aur-scanner` and therefore
# conflicts with it -- do NOT run both. For production systems prefer the
# stable `aur-scanner` / `ks-aur-scanner` packages.
#
# 2.1.0-rc.1 focus: correctness + Atomic Arch coverage depth. Config auto-load
# from XDG and /etc (threat-intel actually works without -c), false-positive
# hygiene, ALPM .hook scanning, wave-3/4/5 Atomic Arch rules. Review the
# CHANGELOG before enabling threat intel or driving the tool from scripts/CI.
pkgname=aur-scanner-rc
# AUR pkgver may not contain a hyphen, so the semver pre-release '2.1.0-rc.1'
# becomes '2.1.0rc1' here; the upstream git tag keeps the canonical form.
pkgver=2.1.0rc1
_tag=v2.1.0-rc.1
pkgrel=1
pkgdesc="Security scanner for Arch Linux AUR packages (release candidate) - detect malicious PKGBUILDs before installation"
arch=('x86_64' 'aarch64')
url="https://github.com/KiefStudioMA/ks-aur-scanner"
license=('GPL-3.0-or-later')
depends=('gcc-libs' 'openssl')
makedepends=('cargo' 'clang' 'git')
provides=('aur-scan')
conflicts=('aur-scanner' 'aur-scanner-git' 'ks-aur-scanner')
options=('!debug' '!strip')
# Source is the GPG-signed pre-release tag, verified against our signing key.
# Integrity comes from git + the tag signature (validpgpkeys), which is stronger
# than hashing a GitHub-generated tarball -- so sha256sums is intentionally SKIP.
# Import the key first if makepkg can't find it:
#   gpg --recv-keys 25631EAE3F43999050B7D7021132BF893C33FB51
source=("git+https://github.com/KiefStudioMA/ks-aur-scanner.git#tag=${_tag}?signed")
validpgpkeys=('25631EAE3F43999050B7D7021132BF893C33FB51') # gitleaks:allow (public GPG key fingerprint, not a secret)
sha256sums=('SKIP')

prepare() {
    cd "ks-aur-scanner"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd "ks-aur-scanner"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --release --all --locked
}

check() {
    cd "ks-aur-scanner"
    export RUSTUP_TOOLCHAIN=stable
    cargo test --release --all --locked
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
    install -Dm644 "install/integration.fish" "$pkgdir/usr/share/aur-scan/integration.fish"
    install -Dm644 "install/integration.nu" "$pkgdir/usr/share/aur-scan/integration.nu"

    # Community rules example
    install -Dm644 "install/rules.d/example.toml" "$pkgdir/usr/share/aur-scanner/rules.d/example.toml"

    # pacman hook, shipped as an opt-in example (NOT auto-enabled). It runs after
    # makepkg has already built the package -- prefer the shell integration above.
    install -Dm644 "install/aur-scan.hook" "$pkgdir/usr/share/aur-scan/aur-scan.hook.example"

    # License + docs
    install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 "README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
}
