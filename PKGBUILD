# Maintainer: Pomotui contributors
pkgname=pomotui-git
pkgver=r0.1.0
pkgrel=1
pkgdesc="Terminal Pomodoro timer with TUI, CLI, and Waybar frontends (git build)"
arch=('x86_64')
url="https://github.com/SaintFore/pomotui"
license=('MIT')
depends=('gcc-libs' 'sqlite')
makedepends=('cargo' 'git')
provides=('pomotui')
conflicts=('pomotui')
optdepends=(
    'libnotify: desktop notifications via notify-send'
    'pulseaudio: sound playback via paplay'
    'waybar: Waybar module integration'
)
source=('pomotui::git+https://github.com/SaintFore/pomotui.git')
sha256sums=('SKIP')
install=pomotui.install

pkgver() {
    cd pomotui
    printf 'r%s.%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    cd pomotui
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd pomotui
    cargo build --frozen --release --workspace
}

check() {
    cd pomotui
    cargo test --frozen --workspace --all-targets --all-features
}

package() {
    cd pomotui

    # Binaries
    install -Dm755 "target/release/pomotui"        "${pkgdir}/usr/bin/pomotui"
    install -Dm755 "target/release/pomotui-tui"     "${pkgdir}/usr/bin/pomotui-tui"
    install -Dm755 "target/release/pomotui-service"  "${pkgdir}/usr/bin/pomotui-service"

    # systemd user units — patch binary path for system-wide install
    sed 's|%h/.local/bin/pomotui-service|/usr/bin/pomotui-service|' \
        packaging/systemd/pomotui.service >pomotui.service
    install -Dm644 packaging/systemd/pomotui.socket \
        "${pkgdir}/usr/lib/systemd/user/pomotui.socket"
    install -Dm644 pomotui.service \
        "${pkgdir}/usr/lib/systemd/user/pomotui.service"

    # Desktop entry
    local desktop_exec="/usr/bin/pomotui-tui"
    sed -e "s|@EXEC@|${desktop_exec}|" \
        -e "s|@TRY_EXEC@|${desktop_exec}|" \
        packaging/pomotui.desktop.in >pomotui.desktop
    install -Dm644 pomotui.desktop \
        "${pkgdir}/usr/share/applications/pomotui.desktop"

    # Icons
    install -Dm644 favicon_io/pomotui-16x16.png \
        "${pkgdir}/usr/share/icons/hicolor/16x16/apps/pomotui.png"
    install -Dm644 favicon_io/pomotui-32x32.png \
        "${pkgdir}/usr/share/icons/hicolor/32x32/apps/pomotui.png"
    install -Dm644 favicon_io/pomotui-192x192.png \
        "${pkgdir}/usr/share/icons/hicolor/192x192/apps/pomotui.png"
    install -Dm644 favicon_io/pomotui-512x512.png \
        "${pkgdir}/usr/share/icons/hicolor/512x512/apps/pomotui.png"

    # Config example and animation
    install -Dm644 packaging/defaults/config.toml \
        "${pkgdir}/usr/share/pomotui/config.example.toml"
    install -Dm644 packaging/defaults/building-collapse.animation \
        "${pkgdir}/usr/share/pomotui/building-collapse.animation"

    # License
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
