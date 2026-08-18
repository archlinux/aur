# Maintainer: vikingowl <christian@nachtigall.dev>
pkgname=owlry
pkgver=2.6.0
pkgrel=1
pkgdesc="Lightweight Wayland application launcher — UI, daemon, and providers in one binary"
arch=('x86_64')
url="https://somegit.dev/Owlibou/owlry"
license=('GPL-3.0-or-later')
depends=(
    'gcc-libs'
    'gtk4'
    'gtk4-layer-shell'
)
makedepends=('cargo')
optdepends=(
    'cliphist: clipboard history provider'
    'wl-clipboard: clipboard write and emoji copy'
    'rofimoji: emoji, kaomoji, and Unicode character picker'
    'xdotool: optional X11 rofimoji typer'
    'wtype: optional Wayland rofimoji typer'
    'ydotool: optional fallback Wayland rofimoji typer'
    'wl-ime-type: optional Wayland IME rofimoji typer'
    'fd: filesystem search provider (primary backend)'
    'plocate: filesystem search provider (fallback backend)'
)
# v2.0 replaces the entire pre-collapse package set. paru/pacman -Syu
# transparently swaps the old packages for owlry-2.0.0 via these arrays.
# Notes:
#   - owlry-{core,lua,rune}: functionality merged into owlry; Lua runtime
#     deferred to a later release with the Lua config layer (D4 / Phase 3).
#   - owlry-plugin-*: every plugin became a feature-gated module in owlry.
#     This PKGBUILD builds with --features full so all of them are present.
#   - owlry-plugin-{weather,media,pomodoro}: widgets are deferred per D20.
#     Listed here so users on those packages get a clean upgrade; widget
#     functionality returns in a later 2.x release.
#   - owlry-plugin-scripts: replaced by user Lua config (D12), Phase 3+.
#   - owlry-meta-*: superseded by the single owlry package.
_v2_retired=(
    'owlry-core'
    'owlry-lua'
    'owlry-rune'
    # Plugins folded into owlry as feature-gated modules.
    'owlry-plugin-clipboard'
    'owlry-plugin-emoji'
    'owlry-plugin-filesearch'
    'owlry-plugin-ssh'
    'owlry-plugin-systemd'
    'owlry-plugin-websearch'
    # Deferred providers (D20+); package replaced so users get a clean
    # transition. Functionality returns in a later 2.x release.
    'owlry-plugin-bookmarks'
    'owlry-plugin-media'
    'owlry-plugin-pomodoro'
    'owlry-plugin-weather'
    # Replaced by user Lua config (D12), Phase 3+.
    'owlry-plugin-scripts'
    # Pre-v2 transitional stubs (pkgrel -99) where calc/conv/power were
    # already folded into owlry-core. Listed so any straggler installs
    # are swept up by the v2 upgrade.
    'owlry-plugin-calculator'
    'owlry-plugin-converter'
    'owlry-plugin-system'
    # Meta-bundles superseded by the single owlry package.
    'owlry-meta-essentials'
    'owlry-meta-widgets'
    'owlry-meta-tools'
    'owlry-meta-full'
)
replaces=("${_v2_retired[@]}")
conflicts=("${_v2_retired[@]}")

# Only claim packages whose functionality is present in this build. The
# remaining retired packages above stay in replaces/conflicts solely so
# upgrades from the pre-v2 package split remain automatic.
provides=(
    'owlry-core'
    'owlry-lua'
    'owlry-plugin-clipboard'
    'owlry-plugin-emoji'
    'owlry-plugin-filesearch'
    'owlry-plugin-ssh'
    'owlry-plugin-systemd'
    'owlry-plugin-websearch'
    'owlry-plugin-calculator'
    'owlry-plugin-converter'
    'owlry-plugin-system'
)

install=owlry.install

source=("$pkgname-$pkgver.tar.gz::https://somegit.dev/Owlibou/owlry/archive/owlry-v$pkgver.tar.gz")
b2sums=('cb51cf15a454684e257f08d7f68de85b26a3706e5e93885469e137dbdceb3879b8637c1f83d7b80757567239ee44cc5c9e54c66d2a5361315cdaa0f591eb9083')

prepare() {
    cd "owlry"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd "owlry"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    # Force GNU ld.bfd. Arch's `extra/rust` defaults rustc to `-fuse-ld=lld`,
    # and LLD's single-pass arg processing can't satisfy `-llua5.4` because
    # mlua-sys+lua-src emit the `-l` flag before their `-L $OUT_DIR/lib`
    # search path in the final link line (cargo:rustc-link-lib emitted
    # before cargo:rustc-link-search). BFD does multi-pass and finds the
    # archive regardless. RUSTFLAGS env-var beats any cargo config rustflags,
    # which is necessary here because Arch's rust pkg appears to set its own
    # RUSTFLAGS that we need to fully override.
    export RUSTFLAGS="-C link-arg=-fuse-ld=bfd"
    # 'full' enables every optional provider — the AUR binary is the
    # batteries-included experience. cargo install consumers can still opt
    # to --no-default-features and pick their own subset.
    cargo build --frozen --release --features full
}

check() {
    cd "owlry"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    export RUSTFLAGS="-C link-arg=-fuse-ld=bfd"
    cargo test --frozen --release --features full
}

package() {
    cd "owlry"

    # Single binary.
    install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"

    # systemd user units (renamed from owlryd.* in v2 — see D15).
    install -Dm644 systemd/owlry.service "$pkgdir/usr/lib/systemd/user/owlry.service"
    install -Dm644 systemd/owlry.socket "$pkgdir/usr/lib/systemd/user/owlry.socket"

    # Documentation + example configuration.
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
    install -Dm644 data/owlry.example.lua "$pkgdir/usr/share/doc/$pkgname/owlry.example.lua"
    install -Dm644 data/config.example.toml "$pkgdir/usr/share/doc/$pkgname/config.example.toml"
    install -Dm644 data/style.example.css "$pkgdir/usr/share/doc/$pkgname/style.example.css"

    # Man page.
    install -Dm644 data/owlry.1 "$pkgdir/usr/share/man/man1/owlry.1"

    # Themes.
    install -d "$pkgdir/usr/share/$pkgname/themes"
    install -Dm644 data/themes/*.css "$pkgdir/usr/share/$pkgname/themes/"
}
