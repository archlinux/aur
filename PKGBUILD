# Maintainer: konyogony <dev@wayclip.com>
pkgname=wayclip-cli
pkgver=0.1.41
pkgrel=1
pkgdesc="The CLI interface for Wayclip, an instant replay tool built for the Linux community."
arch=('x86_64')
url="https://github.com/Wayclip/cli"
license=('MIT')
depends=('pipewire' 'wayland' 'alsa-lib' 'ffmpeg' 'gstreamer' 'gst-plugins-base' 'dbus' 'libxcb')
makedepends=('rust' 'cargo' 'clang' 'git')

_core_ver="v0.1.3"
source=("$pkgname-$pkgver.tar.gz::https://github.com/Wayclip/cli/archive/refs/tags/v$pkgver.tar.gz"
        "wayclip-core.tar.gz::https://github.com/Wayclip/core/releases/download/$_core_ver/wayclip-$_core_ver-x86_64-unknown-linux-gnu.tar.gz")
sha256sums=('SKIP' 'SKIP')

prepare() {
    tar -xzf "$srcdir/$pkgname-$pkgver.tar.gz" -C "$srcdir" --strip-components=1
    
    mkdir -p "$srcdir/wayclip-core-binaries"
    tar -xzf "$srcdir/wayclip-core.tar.gz" -C "$srcdir/wayclip-core-binaries" --strip-components=1
}

build() {
    cd "$srcdir"
    cargo build --release
}

package() {
    install -Dm755 "$srcdir/target/release/wayclip-cli" "$pkgdir/usr/bin/wayclip-cli"

    install -Dm755 "$srcdir/wayclip-core-binaries/daemon" "$pkgdir/usr/bin/wayclip-daemon"
    install -Dm755 "$srcdir/wayclip-core-binaries/trigger" "$pkgdir/usr/bin/wayclip-trigger"

    sed -i 's|__WAYCLIP_DAEMON_PATH__|/usr/bin/wayclip-daemon|' "$srcdir/assets/wayclip-daemon.service"
    
    install -Dm644 "$srcdir/assets/wayclip-daemon.service" "$pkgdir/usr/lib/systemd/user/wayclip-daemon.service"
}
