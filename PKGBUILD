# Maintainer: asafelobotomy
# Builds noti-fi from the release's source archive against the Qt installed on your machine. Use:   cd packaging && makepkg -si
# (the panel runs on any Qt 6 since 0.8.2; building it here simply avoids the prebuilt binaries).
pkgname=noti-fi
pkgver=0.21.11
pkgrel=1
pkgdesc="Notification daemon (notifd), command line (notify) and control panel for KDE Plasma and Hyprland on Wayland"
arch=('x86_64')
url="https://github.com/asafelobotomy/noti-fi"
license=('MIT')
# dbus: `notify serve` runs Quickshell on a private dbus-daemon; pipewire (pw-dump) and python: screen-share detection
depends=('quickshell' 'qt6-base' 'qt6-declarative' 'kirigami' 'qqc2-desktop-style' 'sqlite' 'dbus' 'pipewire' 'python')
makedepends=('cargo')
# The panel links cxx-qt's C++ objects into a Rust binary, and rustc links with lld by default. Under
# makepkg's default `lto`, those objects are GCC LTO bytecode that lld can't read (undefined cxxbridge
# symbols), so LTO is off.
options=('!lto')
optdepends=('qt6-multimedia: audio and video players in popups' 'flatpak: per-app notification permissions for Flatpak apps' 'uq: the Notifications page in uQ Settings')
# The source archive the release workflow uploads (git archive of the tag). The release's `aur` artifact holds this
# PKGBUILD with its real checksum and a .SRCINFO, ready to push to the AUR; here it stays SKIP between releases.
source=("$pkgname-$pkgver.tar.gz::$url/releases/download/v$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('327f024aa8897fc2e2f7308df4ae78eeeb40d9f2cf6f806f554193ac6eddedb1')

prepare() {
    cd "$pkgname-$pkgver"
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd "$pkgname-$pkgver"
    cargo build --release --frozen -p notify-cli -p notify-panel
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm755 target/release/notify target/release/notify-panel -t "$pkgdir/usr/bin"
    install -Dm644 packaging/org.notify.Panel.desktop -t "$pkgdir/usr/share/applications"
    install -Dm644 packaging/org.notify.Panel.metainfo.xml -t "$pkgdir/usr/share/metainfo"
    install -Dm644 packaging/org.notify.Panel.svg -t "$pkgdir/usr/share/icons/hicolor/scalable/apps"
    install -Dm644 -t "$pkgdir/usr/share/uq/settings/pages/noti-fi" uq/pages/noti-fi/*
    install -Dm644 -t "$pkgdir/usr/share/uq/diag" uq/diag/noti-fi.toml
    install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
    install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
}
