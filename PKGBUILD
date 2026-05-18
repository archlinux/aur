# Maintainer: Jon Kinney <jon@headway.io>
pkgname=vernier-git
_pkgname=vernier
pkgver=0.2.4.r0.gdb5d4fc
pkgrel=1
pkgdesc="Cross-platform pixel-measurement overlay in Rust (latest main)"
arch=('x86_64' 'aarch64')
url="https://github.com/jondkinney/vernier"
license=('MIT' 'Apache-2.0')
# C-level LTO trips up cc-compiled static archives from libspa-sys /
# libspa: cc::Build picks up makepkg's -flto=auto and emits LTO IR
# objects that lld then can't resolve when linking the Rust binary.
# !debug suppresses the split `vernier-git-debug` companion package
# (same UX reason as the source PKGBUILD).
options=(!lto !debug)
depends=(
    'fontconfig'
    'freetype2'
    'libglvnd'
    'libxkbcommon'
    'pipewire'
    'wayland'
)
makedepends=(
    'cargo'
    'pkgconf'
    'git'
)
optdepends=(
    'grim: capture held-rect regions via wlr-screencopy'
    'slurp: region selection for the external screenshot shortcut'
    'wl-clipboard: copy screenshots / measurements to the clipboard'
    'libnotify: post-capture notifications'
    'xdg-desktop-portal-hyprland: global hotkey via the GlobalShortcuts portal'
)
provides=("$_pkgname=$pkgver")
conflicts=("$_pkgname" "$_pkgname-bin")
source=("$_pkgname::git+https://github.com/jondkinney/$_pkgname.git")
sha256sums=('SKIP')

pkgver() {
    cd "$_pkgname"
    # Format: <last-tag>.r<commits-since>.g<short-hash> — sortable and
    # uniquely identifies the commit. Strip the `v` prefix; replace the
    # `-N-g<sha>` git-describe suffix with `.rN.g<sha>` for pacman.
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
    # Same path-prefix scrubbing as the tagged-source PKGBUILD — keeps
    # $srcdir out of cargo registry / panic-location strings embedded
    # in the binary.
    export RUSTFLAGS="${RUSTFLAGS:-} --remap-path-prefix=$srcdir=/build"
    cargo build --frozen --release --bin vernier
}

check() {
    cd "$_pkgname"
    export CARGO_HOME="$srcdir/cargo-home"
    export RUSTUP_TOOLCHAIN=stable
    cargo test --frozen --release --workspace
}

package() {
    cd "$_pkgname"

    install -Dm755 "target/release/vernier" "$pkgdir/usr/bin/vernier"

    install -Dm644 "packaging/vernier.desktop" \
        "$pkgdir/usr/share/applications/vernier.desktop"

    # Hicolor icon tree — apps only. Status icons stay out so SNI
    # clients use the daemon's runtime-rendered icon_pixmap instead of
    # a baked-color PNG. See packaging/aur/PKGBUILD for the long form.
    install -d "$pkgdir/usr/share/icons/hicolor"
    cp -r assets/icons/hicolor/. "$pkgdir/usr/share/icons/hicolor/"
    rm -rf "$pkgdir"/usr/share/icons/hicolor/*/status

    install -Dm644 LICENSE-MIT "$pkgdir/usr/share/licenses/$pkgname/LICENSE-MIT"
    install -Dm644 LICENSE-APACHE "$pkgdir/usr/share/licenses/$pkgname/LICENSE-APACHE"

    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
