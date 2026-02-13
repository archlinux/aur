# Maintainer: Greg Lamberson <greg at lamco dot io>
pkgname=lamco-rdp-server
pkgver=1.3.1
pkgrel=1
pkgdesc="Native Wayland RDP server using xdg-desktop-portal for screen capture and input"
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
    'nasm'
    'pkg-config'
)
optdepends=(
    'libva: VAAPI hardware-accelerated video encoding'
    'xdg-desktop-portal-gnome: portal backend for GNOME'
    'xdg-desktop-portal-kde: portal backend for KDE Plasma'
    'xdg-desktop-portal-wlr: portal backend for wlroots compositors'
    'xdg-desktop-portal-hyprland: portal backend for Hyprland'
)
backup=('etc/dbus-1/system.d/io.lamco.RdpServer.System.conf')
source=("$pkgname-$pkgver.tar.xz::https://github.com/lamco-admin/$pkgname/releases/download/v$pkgver/$pkgname-$pkgver.tar.xz")
sha256sums=('0b0108544cea53aa69f7c85b2753982aa705cee370e9a927ad975d183094ce64')

build() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    # Vendored tarball: dependencies already in vendor/ with .cargo/config.toml
    cargo build --frozen --release --no-default-features --features "pam-auth,h264"
}

check() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    # Some tests require a Wayland session; allow failure in chroot builds
    cargo test --frozen --no-default-features --features "pam-auth,h264" || true
}

package() {
    cd "$pkgname-$pkgver"

    # Binary
    install -Dm755 target/release/lamco-rdp-server "$pkgdir/usr/bin/lamco-rdp-server"

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

    # AppStream metainfo
    install -Dm644 packaging/flatpak/io.lamco.rdp-server.metainfo.xml \
        "$pkgdir/usr/share/metainfo/io.lamco.rdp-server.metainfo.xml"

    # Icons
    install -Dm644 assets/icons/io.lamco.rdp-server.svg \
        "$pkgdir/usr/share/icons/hicolor/scalable/apps/io.lamco.rdp-server.svg"
    for size in 32 48 64 128 256; do
        install -Dm644 "assets/icons/io.lamco.rdp-server-${size}.png" \
            "$pkgdir/usr/share/icons/hicolor/${size}x${size}/apps/io.lamco.rdp-server.png"
    done

    # License
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
