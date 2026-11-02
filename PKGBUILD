# Maintainer: vikingowl <christian@nachtigall.dev>
pkgname=owlry
pkgver=2.8.1
pkgrel=1
pkgdesc="Lightweight Wayland application launcher — UI, daemon, and providers in one binary"
arch=('x86_64')
url="https://somegit.dev/Owlibou/owlry"
license=('GPL-3.0-or-later')
depends=(
    'gcc-libs'
    'gtk4'
    'gtk4-layer-shell'
    'bash'
    'coreutils'
    'util-linux'
    'systemd'
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

source=(
    "$pkgname-$pkgver.tar.gz::https://somegit.dev/Owlibou/owlry/archive/387892ebb19e49604e74745a549ae0d0bfdaaf96.tar.gz"
    "owlry-user-migrate-run.sh"
    "owlry-user-migrate.sh"
    "owlry-user-migrate.hook"
    "owlry-user-migrate.service"
    "README.md"
    "upgrading.md"
)
b2sums=(
    'adae411bf29e99d56e9636cea0e0d7604595468368abf371c9b388330bfbd71c2916f38c670200206a63309b89fd4a3dd49b6ce3f2b698b5ed44982a51aa1a8b'
    'c578b5e62b9e4e361b8b46ad56b75af4abf711a3cc5d29a223f99baaf97a0f730db85dc15132d4b84846155914b11dc19560d5b89937eb2831ce927a5f2674a1'
    'b3b31c5ef7f02659e4d7fb5a3f0da4210af3eed2b4f4c8a60a83634d3dec7f56d22a5967bbdef79a07e6e567820266d0ec7df8013b5de60ffd4ce64e4d2e5655'
    '020f2e3171bc51ae8547c143c1207da4f6708665ec40960d4ab8fbaea3ff237296895f63f7422e3984c17466d5ee6b048c492218f1bd40c87c81b602cf218465'
    'b43c4ad151bf2ecd6a4255813bc4046c3d69e5115748da2389d5f24ae926d28353744a064fa6ad204f61dda78df3b79662dba10e540a008ff00885b2fc893f9c'
    '1568892982cd8a912fbaea3596484ce4ef55a8a1b0db13774796b66512216276093883754edfd5e898e9b7682f3db02f5b923872fec1cb713ce51546d8449478'
    '07a4ce5fd8bf3f62efe902f4acec35bd88311552c84f95ac5f27de89f6dc49e8f32c5d42e212fa12aec20e2da52ef91b4ef451923fb063fe198db79dad09b0f1'
)

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

    # Owlry Issue 24 automatic socket migration artifacts.
    install -Dm755 "$srcdir/owlry-user-migrate-run.sh" \
        "$pkgdir/usr/share/libalpm/hooks/owlry-user-migrate-run.sh"
    install -Dm644 "$srcdir/owlry-user-migrate.hook" \
        "$pkgdir/usr/share/libalpm/hooks/owlry-user-migrate.hook"
    install -Dm755 "$srcdir/owlry-user-migrate.sh" \
        "$pkgdir/usr/lib/owlry/user-migrate.sh"
    install -Dm644 "$srcdir/owlry-user-migrate.service" \
        "$pkgdir/usr/lib/systemd/user/owlry-user-migrate.service"

    # Documentation + example configuration.
    install -Dm644 "$srcdir/README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
    install -Dm644 "$srcdir/upgrading.md" "$pkgdir/usr/share/doc/$pkgname/docs/upgrading.md"
    install -Dm644 data/owlry.example.lua "$pkgdir/usr/share/doc/$pkgname/owlry.example.lua"
    install -Dm644 data/config.example.toml "$pkgdir/usr/share/doc/$pkgname/config.example.toml"
    install -Dm644 data/style.example.css "$pkgdir/usr/share/doc/$pkgname/style.example.css"

    # Man page.
    install -Dm644 data/owlry.1 "$pkgdir/usr/share/man/man1/owlry.1"

    # Themes.
    install -d "$pkgdir/usr/share/$pkgname/themes"
    install -Dm644 data/themes/*.css "$pkgdir/usr/share/$pkgname/themes/"
}
