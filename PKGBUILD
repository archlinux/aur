# Maintainer: LeTuR <magicletur@protonmail.com>
pkgname=thurbox
pkgver=1.3.2
pkgrel=1
pkgdesc="TUI for orchestrating multiple coding-agent CLI sessions in persistent tmux panels"
arch=('x86_64' 'aarch64')
url="https://github.com/Thurbeen/thurbox"
license=('MIT')
# tmux/git are required at runtime. sqlite/glibc are the shared libraries
# the binary links (verified with readelf; gcc-libs is implicitly satisfied).
# The clipboard backend (arboard) loads X11/Wayland libs lazily, not hard deps.
depends=('tmux' 'git' 'sqlite' 'glibc')
makedepends=('cargo')
optdepends=('claude-code: Claude Code agent CLI'
            'aider-chat: aider agent CLI'
            'opencode-bin: opencode agent CLI')
provides=('thurbox')
conflicts=('thurbox-bin')
source=("$pkgname-$pkgver.tar.gz::https://github.com/Thurbeen/thurbox/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('60e2288e827c7cbae5e9132af829ff489dc42c8ce36ebbea12f0140b1837c443')

prepare() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    # Fetch with the pristine manifest so --locked is satisfied.
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
    # Link the system SQLite instead of vendoring it: Arch discourages
    # bundled libraries, and the vendored static lib also fails to link
    # under Rust's default rust-lld. Dropping the feature makes
    # libsqlite3-sys use the system libsqlite3.so via pkg-config. This
    # rewrites Cargo.lock, hence --offline (not --frozen) in build().
    sed -i '/^rusqlite/ s/, features = \["bundled"\]//' Cargo.toml
}

build() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    export LIBSQLITE3_SYS_USE_PKG_CONFIG=1
    # build.rs reads the real version from this env var; without it the
    # binary reports 0.0.0-dev (Cargo.toml is a static dev marker).
    export THURBOX_RELEASE_VERSION="v$pkgver"
    cargo build --offline --release --bin thurbox --bin thurbox-cli
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm0755 -t "$pkgdir/usr/bin/" \
        target/release/thurbox \
        target/release/thurbox-cli
    install -Dm0644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm0644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
