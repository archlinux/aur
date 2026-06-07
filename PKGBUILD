# Maintainer: Jon Kinney <jon@headway.io>
pkgname=hyprcorrect-git
_pkgname=hyprcorrect
pkgver=0.4.1
pkgrel=1
pkgdesc="Keyboard-driven desktop spelling and typo corrector (latest main)"
arch=('x86_64' 'aarch64')
url="https://github.com/jondkinney/hyprcorrect"
license=('MIT' 'Apache-2.0')
options=(!debug)
depends=(
    'fontconfig'
    'freetype2'
    'hyprland'
    'libglvnd'
    'libsecret'
    'libxkbcommon'
    'wayland'
    'wtype'
)
makedepends=(
    'cargo'
    'git'
    'pkgconf'
)
optdepends=(
    'wl-clipboard: enables the clipboard / selection fallback when the keystroke buffer is empty'
)
provides=("$_pkgname=$pkgver")
conflicts=("$_pkgname" "$_pkgname-bin")
source=("$_pkgname::git+https://github.com/jondkinney/$_pkgname.git")
sha256sums=('SKIP')

pkgver() {
    cd "$_pkgname"
    # <last-tag>.r<commits-since>.g<short-hash> — sortable + uniquely
    # identifies the commit. Strip `v`, rewrite the git-describe suffix
    # for pacman.
    git describe --long --tags --abbrev=7 \
        | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    cd "$_pkgname"
    export CARGO_HOME="$srcdir/cargo-home"
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd "$_pkgname"
    export CARGO_HOME="$srcdir/cargo-home"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    export RUSTFLAGS="${RUSTFLAGS:-} --remap-path-prefix=$srcdir=/build"
    cargo build --frozen --release --bin hyprcorrect
}

check() {
    cd "$_pkgname"
    export CARGO_HOME="$srcdir/cargo-home"
    export RUSTUP_TOOLCHAIN=stable
    cargo test --frozen --release --workspace
}

package() {
    cd "$_pkgname"

    install -Dm755 "target/release/hyprcorrect" "$pkgdir/usr/bin/hyprcorrect"
    install -Dm644 "packaging/hyprcorrect.desktop" \
        "$pkgdir/usr/share/applications/hyprcorrect.desktop"
    install -Dm644 "assets/icons/hicolor/scalable/apps/hyprcorrect.svg" \
        "$pkgdir/usr/share/icons/hicolor/scalable/apps/hyprcorrect.svg"
    for size in 16 22 24 32 48 64 128 256 512; do
        install -Dm644 "assets/icons/hicolor/${size}x${size}/apps/hyprcorrect.png" \
            "$pkgdir/usr/share/icons/hicolor/${size}x${size}/apps/hyprcorrect.png"
    done
    install -Dm644 LICENSE-MIT "$pkgdir/usr/share/licenses/$pkgname/LICENSE-MIT"
    install -Dm644 LICENSE-APACHE "$pkgdir/usr/share/licenses/$pkgname/LICENSE-APACHE"
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
