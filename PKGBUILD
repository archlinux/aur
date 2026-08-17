# Maintainer:  Rubin Simons <me@rubin55.org>

pkgname=rusty-psn
pkgver=0.6.0
pkgrel=1
pkgdesc="A GUI/CLI tool for downloading PS3 and PS4 game updates"
arch=('x86_64')
url="https://github.com/RainbowCookie32/rusty-psn"
license=('Apache-2.0')
# The GUI dlopens its windowing libraries, so they do not show up in ldd.
depends=('gcc-libs' 'glibc' 'dbus' 'libglvnd' 'libx11' 'libxcb' 'libxcursor'
         'libxi' 'libxkbcommon' 'libxkbcommon-x11' 'libxrender' 'wayland')
makedepends=('cargo')
provides=('rustypsn')
conflicts=('rusty-psn-bin')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz"
        "rusty-psn.desktop"
        "playstation-store.svg")
sha256sums=('bc782813958a8821affca3efeb53cd38c89b66a3562c859d9d2fc37420d424bc'
            '2cb6715bb0cf3646091369385e285c92a2573f1602580f60a51d5c0ea8e638a5'
            '4c6f59e5d15a93b76fc1a90ca4f8283193a870627a958eff62cda952474d089b')

prepare() {
    cd "${pkgname}-${pkgver}"
    export RUSTUP_TOOLCHAIN=stable

    # Upstream forgot to refresh Cargo.lock for the release bump, so the root
    # package is still pinned at the previous version and --locked fails.
    sed -i "/^name = \"${pkgname}\"\$/{n;s/^version = .*/version = \"${pkgver}\"/}" Cargo.lock

    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd "${pkgname}-${pkgver}"
    export RUSTUP_TOOLCHAIN=stable

    # ring builds its assembly with the cc crate; LTO hides those symbols from
    # rust-lld and linking fails with undefined ring_core_* references.
    export CFLAGS="${CFLAGS//-flto=auto/}"
    export CXXFLAGS="${CXXFLAGS//-flto=auto/}"

    # The CLI and the GUI are the same crate built with mutually exclusive
    # feature sets, so give each its own target directory.
    CARGO_TARGET_DIR=target-cli \
        cargo build --frozen --release --no-default-features --features cli
    CARGO_TARGET_DIR=target-gui \
        cargo build --frozen --release --no-default-features --features egui
}

check() {
    cd "${pkgname}-${pkgver}"
    export RUSTUP_TOOLCHAIN=stable

    # These tests query the live PSN update API; build with --nocheck offline.
    CARGO_TARGET_DIR=target-cli \
        cargo test --frozen --release --no-default-features --features cli
}

package() {
    cd "${pkgname}-${pkgver}"
    install -Dm755 "target-cli/release/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm755 "target-gui/release/${pkgname}" "${pkgdir}/usr/bin/${pkgname}-gui"
    install -Dm644 "${srcdir}/rusty-psn.desktop" "${pkgdir}/usr/share/applications/rusty-psn.desktop"
    install -Dm644 "${srcdir}/playstation-store.svg" "${pkgdir}/usr/share/pixmaps/playstation-store.svg"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
