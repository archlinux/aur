# Maintainer: Anuraj Jit Saikia <rajasaikia1644@gmail.com>
pkgname=voisu
pkgver=0.35.1
pkgrel=1
pkgdesc="Cloud-first Linux dictation for Wayland (daemon, CLI, and optional Overlay)"
arch=('x86_64')
url="https://github.com/Anuraj-Dev/voisu"
# Voisu itself is MIT. The voisu, voisu-daemon and voisu-overlay binaries
# statically link the ring crate, which adds ISC (new ring code), Apache-2.0
# and BSD-3-Clause (BoringSSL-derived code) and MIT (once_cell polyfill).
# ring's full upstream license tree is installed under licenses/voisu/ring/.
license=('MIT' 'Apache-2.0' 'ISC' 'BSD-3-Clause')
# Runtime boundaries that are NOT visible to namcap's ELF scan because Voisu
# reaches them as subprocesses, a D-Bus service, or via dlopen:
#   pipewire-audio -> pw-record (audio capture; the base `pipewire` package
#                     does NOT ship pw-record)
#   wireplumber    -> wpctl, the microphone readiness check in system.rs
#   wl-clipboard   -> wl-copy / wl-paste (clipboard Delivery fallback)
#   libsecret      -> secret-tool (provider key storage)
#   curl           -> provider HTTPS/WSS transport
#   xdg-desktop-portal -> Trigger Key binding and direct Delivery portals
# libxkbcommon is a genuine runtime dep: the xkbcommon crate declares
# #[link(name = "xkbcommon")] and system.rs uses it on the Delivery path.
depends=('gtk4'
         'gtk4-layer-shell'
         'libxkbcommon'
         'pipewire'
         'pipewire-audio'
         'wireplumber'
         'wl-clipboard'
         'libsecret'
         'curl'
         'xdg-desktop-portal')
makedepends=('cargo')
# The workspace tests shell out to python3 (process.rs, system.rs) and spawn a
# private dbus-daemon (tests/delivery.rs, tests/daemon_cli_lifecycle.rs).
checkdepends=('python' 'dbus')
optdepends=('libei: direct Delivery of the Transcript into the focused window'
            'xdg-desktop-portal-kde: portal backend for KDE Plasma'
            'xdg-desktop-portal-hyprland: portal backend for Hyprland')
# ring bundles C crypto objects; makepkg's default LTO drops ring_core_* symbols
# at link time ("undefined symbol: ring_core_0_17_14__*"). Disabling makepkg LTO
# only affects the intermediate C/C++ objects, not Rust's own release codegen.
options=('!lto')
install="$pkgname.install"
# NOTE: the release tarball checksum is SKIP only because no v0.1.0 tag exists
# yet (the first tagged release ships with the release workflow). At the first
# real release, replace the tarball 'SKIP' below with the pinned sha256 via
# `updpkgsums` and regenerate .SRCINFO.
#
# The LICENSE.ring-* sidecars are verbatim copies of ring 0.17.14's license
# tree; they are installed under their UPSTREAM names and paths so that the
# cross-references inside ring's own LICENSE manifest resolve.
source=("$pkgname-$pkgver.tar.gz::https://github.com/Anuraj-Dev/voisu/archive/refs/tags/v$pkgver.tar.gz"
        'LICENSE.ring'
        'LICENSE.ring-BoringSSL'
        'LICENSE.ring-other-bits'
        'LICENSE.ring-once_cell-APACHE'
        'LICENSE.ring-once_cell-MIT'
        'LICENSE.ring-fiat')
sha256sums=('513bedf9ac3de5ab81bc9124a352595f953bf8a372c797f0371093369e98e3d5'
            'b3d734001a94efff3579978d953391aa7115f877657d25eb54037a43875d078a'
            '005fc765ddc5115da796cca915baa9557abae13ff35e0a47c47affc56f6c414d'
            'f025ccfb7dfb6bdfedc75ca0f67acc69e6fb4998143d834f7c2f38a29989680f'
            'a60eea817514531668d7e00765731449fe14d059d3249e0bc93b36de45f759f2'
            '6ee2ed6c77710de911761acd5fc1ad1da00f476beb1a7ef27e78c2d1858deafc'
            '9eacbcb81be660840c714a560a9d65ba07913db98dd4baf969f78dd499fdd60f')

prepare() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    # Fetch exactly the Cargo.lock-pinned dependencies (whole graph, including
    # the feature-gated Overlay deps) so build()/check() run fully offline.
    cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    # Base build is GTK-free: produces voisu and voisu-daemon.
    cargo build --frozen --release --workspace
    # The Overlay is feature-gated behind voisu-app/overlay.
    cargo build --frozen --release -p voisu-app --features overlay --bin voisu-overlay
}

check() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo test --frozen --release --workspace
}

package() {
    cd "$pkgname-$pkgver"

    install -Dm755 target/release/voisu "$pkgdir/usr/bin/voisu"
    install -Dm755 target/release/voisu-daemon "$pkgdir/usr/bin/voisu-daemon"
    install -Dm755 target/release/voisu-overlay "$pkgdir/usr/bin/voisu-overlay"

    # systemd *user* units (Voisu never runs privileged system services).
    install -Dm644 packaging/voisu.service \
        "$pkgdir/usr/lib/systemd/user/voisu.service"
    install -Dm644 packaging/voisu-overlay.service \
        "$pkgdir/usr/lib/systemd/user/voisu-overlay.service"

    # Desktop entry makes a resolvable app_id (voisu) available to portal
    # backends that support it; the stable session token is the primary fix.
    install -Dm644 packaging/voisu.desktop \
        "$pkgdir/usr/share/applications/voisu.desktop"

    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

    # ring's license tree, kept at its upstream names/paths so the
    # cross-references inside ring's LICENSE manifest actually resolve.
    local ringlic="$pkgdir/usr/share/licenses/$pkgname/ring"
    install -Dm644 "$srcdir/LICENSE.ring"            "$ringlic/LICENSE"
    install -Dm644 "$srcdir/LICENSE.ring-BoringSSL"  "$ringlic/LICENSE-BoringSSL"
    install -Dm644 "$srcdir/LICENSE.ring-other-bits" "$ringlic/LICENSE-other-bits"
    install -Dm644 "$srcdir/LICENSE.ring-once_cell-APACHE" \
        "$ringlic/src/polyfill/once_cell/LICENSE-APACHE"
    install -Dm644 "$srcdir/LICENSE.ring-once_cell-MIT" \
        "$ringlic/src/polyfill/once_cell/LICENSE-MIT"
    install -Dm644 "$srcdir/LICENSE.ring-fiat" \
        "$ringlic/third_party/fiat/LICENSE"

    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
