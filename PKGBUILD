# Maintainer: DonutsDelivery <megusta52@proton.me>
pkgname=donuttaskmanager
pkgver=0.4.0
pkgrel=1
pkgdesc="GTK4/libadwaita task manager and performance monitor for Linux (formerly Task Manager)"
arch=('x86_64' 'aarch64')
url="https://github.com/DonutsDelivery/task-manager-linux"
license=('MIT')
depends=('gtk4' 'libadwaita' 'dbus' 'hicolor-icon-theme')
makedepends=('cargo')
optdepends=(
    'nvidia-utils: NVIDIA GPU monitoring via NVML'
    'lm_sensors: CPU temperature monitoring'
)
provides=('task-manager-linux')
conflicts=('task-manager-linux' 'donuttaskmanager-bin')
replaces=('task-manager-linux')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('c3a45e9e8273db159f8b0c00407a559f3524d0a32b8cacc1861ad2c971f9ce18')

_src="task-manager-linux-$pkgver"

prepare() {
    cd "$_src"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd "$_src"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release
}

package() {
    cd "$_src"
    local appid=online.donutsdelivery.DonutTaskManager
    install -Dm755 target/release/donut-taskmgr "$pkgdir/usr/bin/donut-taskmgr"
    install -Dm644 "data/$appid.desktop" "$pkgdir/usr/share/applications/$appid.desktop"
    install -Dm644 "data/$appid.metainfo.xml" "$pkgdir/usr/share/metainfo/$appid.metainfo.xml"
    install -d "$pkgdir/usr/share/icons"
    cp -r icons/hicolor "$pkgdir/usr/share/icons/"
    install -Dm644 "icons/$appid.svg" "$pkgdir/usr/share/icons/hicolor/scalable/apps/$appid.svg"
    install -Dm755 scripts/setup-shortcut.sh "$pkgdir/usr/share/donut-taskmgr/setup-shortcut.sh"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
