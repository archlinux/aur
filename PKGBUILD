# Maintainer: Matthew Cushing <cushing.matt@gmail.com>
pkgname=wflow-git
_pkgname=wflow
pkgver=0.3.0.r0.g0000000
pkgrel=1
pkgdesc="A workflow engine for Wayland automation — Shortcuts-style GUI + CLI on top of wdotool (git build)"
arch=('x86_64')
url="https://github.com/cushycush/wflow"
license=('MIT' 'Apache-2.0')
# cxx-qt-lib's generated C++ glue + makepkg's external LTO produces
# unresolved-symbol link errors. Cargo's profile.release lto = "thin"
# stays on; this only opts out of the system-driven LTO.
options=(!lto)
provides=("$_pkgname=$pkgver")
conflicts=("$_pkgname")
depends=(
    'qt6-base'
    'qt6-declarative'
    'gcc-libs'
    'glibc'
)
makedepends=('rust' 'cargo' 'git')
optdepends=(
    'libnotify: desktop notifications via notify-send'
    'wl-clipboard: clipboard via wl-copy'
    'xdg-desktop-portal: input via libei portal + Record Mode'
)
source=("$_pkgname::git+$url.git")
sha256sums=('SKIP')

pkgver() {
    cd "$_pkgname"
    # `<cargo-version>.r<commits-since-tag>.g<short-sha>` if a tag exists,
    # else fall back to `r<total-commits>.g<short-sha>`.
    if git describe --long --tags >/dev/null 2>&1; then
        git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
    else
        printf 'r%s.g%s' \
            "$(git rev-list --count HEAD)" \
            "$(git rev-parse --short HEAD)"
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
    local bin="target/release/$_pkgname"

    install -Dm755 "$bin" "$pkgdir/usr/bin/$_pkgname"

    # Shell completions
    "$bin" completions bash | install -Dm644 /dev/stdin \
        "$pkgdir/usr/share/bash-completion/completions/$_pkgname"
    "$bin" completions zsh  | install -Dm644 /dev/stdin \
        "$pkgdir/usr/share/zsh/site-functions/_$_pkgname"
    "$bin" completions fish | install -Dm644 /dev/stdin \
        "$pkgdir/usr/share/fish/vendor_completions.d/$_pkgname.fish"

    # Man pages — wflow(1) plus one page per subcommand.
    install -d "$pkgdir/usr/share/man/man1"
    "$bin" man --output "$pkgdir/usr/share/man/man1" >/dev/null

    # Docs
    install -Dm644 README.md   "$pkgdir/usr/share/doc/$_pkgname/README.md"
    install -Dm644 docs/KDL.md "$pkgdir/usr/share/doc/$_pkgname/KDL.md"

    for f in LICENSE-MIT LICENSE-APACHE LICENSE; do
        if [ -f "$f" ]; then
            install -Dm644 "$f" "$pkgdir/usr/share/licenses/$_pkgname/$f"
        fi
    done
}
