# Maintainer: Greg Lamberson <greg at lamco dot io>
pkgname=lamco-rdp-server
pkgver=1.4.0
pkgrel=1
pkgdesc="Native Wayland RDP server for GNOME, KDE, Sway, and Hyprland with H.264 encoding and VA-API acceleration"
arch=('x86_64')
url="https://github.com/lamco-admin/lamco-rdp-server"
license=('BUSL-1.1')
depends=(
    'gcc-libs'
    'glibc'
    'dbus'
    'pipewire'
    'libpipewire'
    'xdg-desktop-portal'
    'libxkbcommon'
    'pam'
    'fuse3'
)
makedepends=(
    'cargo'
    'clang'
    'cmake'
    'make'
    'nasm'
    'pkg-config'
)
optdepends=(
    'libva: VA-API hardware-accelerated H.264 encoding'
    'vulkan-icd-loader: GPU-accelerated GUI rendering via wgpu'
    'xdg-desktop-portal-gnome: screen capture and remote input for GNOME'
    'xdg-desktop-portal-kde: screen capture and remote input for KDE Plasma'
    'xdg-desktop-portal-wlr: screen capture for Sway and wlroots compositors'
    'xdg-desktop-portal-hyprland: screen capture for Hyprland'
    'openh264: H.264 software encoding via EGFX (Cisco binary, BSD-2-Clause)'
)
# makepkg's LTO injects -flto=auto into CFLAGS; GCC LTO bitcode in native
# C libraries (aws-lc-sys, ring, opus) is invisible to the Rust linker.
options=(!lto)
backup=('etc/dbus-1/system.d/io.lamco.RdpServer.System.conf')
source=("$pkgname-$pkgver.tar.xz::https://github.com/lamco-admin/$pkgname/releases/download/v$pkgver/$pkgname-$pkgver.tar.xz")
sha256sums=('38b549510dfd15ab923a165a9af19217b7c212c919c949f88b3bc4ade9d7ab74')

build() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    # rust-lld (default since Rust 1.93) fails to link native C libraries
    # (aws-lc-sys, ring, opus). Force the system cc linker via RUSTFLAGS.
    # Thin LTO: fat LTO peaks at 8-10GB RAM; thin builds with ~4GB.
    export RUSTFLAGS="-C linker=cc ${RUSTFLAGS:-}"
    export CARGO_PROFILE_RELEASE_LTO=thin
    export CARGO_PROFILE_RELEASE_CODEGEN_UNITS=4
    # Vendored tarball: dependencies already in vendor/ with .cargo/config.toml
    cargo build --frozen --release --no-default-features --features "pam-auth,h264,gui,wayland,libei,wl-clipboard"
}

check() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    # Some tests require a Wayland session; allow failure in chroot builds
    cargo test --frozen --no-default-features --features "pam-auth,h264,gui,wayland,libei,wl-clipboard" || true
}

package() {
    cd "$pkgname-$pkgver"

    # Binaries
    install -Dm755 target/release/lamco-rdp-server "$pkgdir/usr/bin/lamco-rdp-server"
    install -Dm755 target/release/lamco-rdp-server-gui "$pkgdir/usr/bin/lamco-rdp-server-gui"

    # Systemd user service
    install -Dm644 packaging/systemd/lamco-rdp-server.service \
        "$pkgdir/usr/lib/systemd/user/lamco-rdp-server.service"

    # D-Bus service file (session bus activation)
    install -Dm644 packaging/dbus/io.lamco.RdpServer.service \
        "$pkgdir/usr/share/dbus-1/services/io.lamco.RdpServer.service"

    # D-Bus system bus policy
    install -Dm644 packaging/dbus/io.lamco.RdpServer.System.conf \
        "$pkgdir/etc/dbus-1/system.d/io.lamco.RdpServer.System.conf"

    # Polkit policy
    install -Dm644 packaging/polkit/io.lamco.RdpServer.policy \
        "$pkgdir/usr/share/polkit-1/actions/io.lamco.RdpServer.policy"

    # Desktop entry
    install -Dm644 data/io.lamco.rdp-server.desktop \
        "$pkgdir/usr/share/applications/io.lamco.rdp-server.desktop"

    # AppStream metainfo
    install -Dm644 data/io.lamco.rdp-server.metainfo.xml \
        "$pkgdir/usr/share/metainfo/io.lamco.rdp-server.metainfo.xml"

    # Icons
    install -Dm644 data/icons/io.lamco.rdp-server.svg \
        "$pkgdir/usr/share/icons/hicolor/scalable/apps/io.lamco.rdp-server.svg"
    for size in 32 48 64 128 256; do
        install -Dm644 "data/icons/io.lamco.rdp-server-${size}.png" \
            "$pkgdir/usr/share/icons/hicolor/${size}x${size}/apps/io.lamco.rdp-server.png"
    done

    # License
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
