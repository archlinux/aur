# Maintainer: Kief Studio <packages@kief.studio>
#
# Rolling build from the latest commit on the default branch. SKIP is mandatory
# for a VCS source, so provenance comes from verifying the HEAD commit's GPG
# signature against our key (validpgpkeys + `git verify-commit` in prepare()).
# The repo's branch ruleset requires signed commits, so HEAD should always
# verify; if it does not, the build aborts. NOTE: this is a WEAKER guarantee
# than the tagged packages (aur-scanner / ks-aur-scanner), which verify a signed
# release tag pinned to a reviewed version. Prefer the tagged packages on
# production systems.
pkgname=aur-scanner-git
pkgver=1.0.3.r0.g7aae5c0
pkgrel=2
pkgdesc="Security scanner for Arch Linux AUR packages - detect malicious PKGBUILDs before installation"
arch=('x86_64' 'aarch64')
url="https://github.com/KiefStudioMA/ks-aur-scanner"
license=('GPL-3.0-or-later')
depends=('gcc-libs' 'openssl')
makedepends=('cargo' 'git' 'clang')
provides=('aur-scanner' 'aur-scan')
conflicts=('aur-scanner' 'ks-aur-scanner')
options=('!debug')
# Import the signing key first:  gpg --recv-keys 25631EAE3F43999050B7D7021132BF893C33FB51
source=("git+https://github.com/KiefStudioMA/ks-aur-scanner.git")
validpgpkeys=('25631EAE3F43999050B7D7021132BF893C33FB51') # gitleaks:allow (public GPG key fingerprint, not a secret)
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
    # Verify the checked-out commit is signed by our key before building any of
    # its code. The branch ruleset requires signed commits; a failure here means
    # an unsigned/untrusted commit reached HEAD -- abort rather than build it.
    if ! git verify-commit HEAD; then
        echo "ERROR: HEAD commit is not signed by a trusted key (validpgpkeys)." >&2
        echo "       Import it:  gpg --recv-keys 25631EAE3F43999050B7D7021132BF893C33FB51" >&2
        return 1
    fi
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd ks-aur-scanner
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --release --all --locked
}

check() {
    cd ks-aur-scanner
    export RUSTUP_TOOLCHAIN=stable
    cargo test --release --all --locked
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
