# Maintainer: prietus <prietus@live.com>
pkgname=aur-guard-git
_pkgname=aur-guard
pkgver=r1.0000000
pkgrel=1
pkgdesc="Security scanner for AUR PKGBUILDs — detects malicious patterns before makepkg runs (git)"
arch=('x86_64' 'aarch64')
url="https://github.com/prietus/aur-guard"
license=('MIT')
depends=('gcc-libs' 'pacman')
makedepends=('cargo' 'git')
provides=("$_pkgname")
conflicts=("$_pkgname" "${_pkgname}-bin")
install="${_pkgname}.install"
source=("${_pkgname}::git+${url}.git")
sha256sums=('SKIP')

pkgver() {
    cd "$_pkgname"
    # Format: r<commit_count>.<short_sha>  — Arch convention for -git packages.
    printf 'r%s.%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

prepare() {
    cd "$_pkgname"
    export CARGO_HOME="$srcdir/cargo-home"
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd "$_pkgname"
    export CARGO_HOME="$srcdir/cargo-home"
    export CARGO_TARGET_DIR=target
    cargo build --release --frozen
}

check() {
    cd "$_pkgname"
    # Smoke test the freshly-built binary against the bundled fixtures.
    if ./target/release/aur-guard check --no-diff --threshold malicious test-fixtures/PKGBUILD.malicious >/dev/null; then
        echo "smoke test FAILED: scanner missed the malicious fixture" >&2
        return 1
    fi
    if ! ./target/release/aur-guard check --no-diff test-fixtures/PKGBUILD.benign >/dev/null; then
        echo "smoke test FAILED: scanner flagged the benign fixture" >&2
        return 1
    fi
    echo "aur-guard :: smoke tests ok"
}

package() {
    cd "$_pkgname"

    install -Dm0755 "target/release/aur-guard" "$pkgdir/usr/bin/aur-guard"

    # System-shipped pacman hook (NOT /etc/pacman.d/hooks/, that path is for admin overrides).
    # The committed hook file points at /usr/local/bin/aur-guard; rewrite to /usr/bin/aur-guard.
    install -d "$pkgdir/usr/share/libalpm/hooks"
    sed 's|/usr/local/bin/aur-guard|/usr/bin/aur-guard|g' hooks/aur-guard.hook \
        > "$pkgdir/usr/share/libalpm/hooks/aur-guard.hook"
    chmod 0644 "$pkgdir/usr/share/libalpm/hooks/aur-guard.hook"

    # makepkg shim — shipped but NOT activated. /usr/local/bin is the admin's
    # territory, an AUR package cannot drop files there. The .install scriptlet
    # tells the user how to enable it manually.
    install -d "$pkgdir/usr/share/aur-guard"
    sed 's|/usr/local/bin/aur-guard|/usr/bin/aur-guard|g' scripts/makepkg \
        > "$pkgdir/usr/share/aur-guard/makepkg-shim"
    chmod 0755 "$pkgdir/usr/share/aur-guard/makepkg-shim"

    install -Dm0644 LICENSE "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
    install -Dm0644 README.md "$pkgdir/usr/share/doc/$_pkgname/README.md"
}
