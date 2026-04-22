# Maintainer: Matthew Cushing <hgxtymphwn@privaterelay.appleid.com>
pkgname=wdotool-git
_pkgname=wdotool
pkgver=0.1.3.r4.g6793da2
pkgrel=1
pkgdesc="xdotool-compatible input automation for Wayland (git, rolling)"
arch=('x86_64' 'aarch64')
url="https://github.com/cushycush/wdotool"
license=('MIT' 'Apache-2.0')
depends=('libxkbcommon' 'wayland')
makedepends=('cargo' 'git')
provides=("$_pkgname")
conflicts=("$_pkgname" "$_pkgname-bin")
source=("$_pkgname::git+$url.git")
sha256sums=('SKIP')

pkgver() {
    cd "$_pkgname"
    # <cargo_version>.r<commits_since_latest_tag>.g<short_sha>
    # Falls back to the plain commit count if no tags are reachable.
    if git describe --long --tags 2>/dev/null | grep -q .; then
        git describe --long --tags \
            | sed -E 's/^v//; s/-([0-9]+)-g/.r\1.g/'
    else
        printf "0.r%s.g%s" \
            "$(git rev-list --count HEAD)" \
            "$(git rev-parse --short=7 HEAD)"
    fi
}

prepare() {
    cd "$_pkgname"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd "$_pkgname"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release
}

check() {
    cd "$_pkgname"
    export RUSTUP_TOOLCHAIN=stable
    cargo test --frozen --release
}

package() {
    cd "$_pkgname"
    install -Dm755 "target/release/$_pkgname" "$pkgdir/usr/bin/$_pkgname"
    install -Dm644 README.md "$pkgdir/usr/share/doc/$_pkgname/README.md"
    install -Dm644 LICENSE-MIT "$pkgdir/usr/share/licenses/$_pkgname/LICENSE-MIT"
    install -Dm644 LICENSE-APACHE "$pkgdir/usr/share/licenses/$_pkgname/LICENSE-APACHE"
}
