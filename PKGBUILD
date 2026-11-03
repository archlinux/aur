# Maintainer: Pierre Bertet <hi@bpier.re>
pkgname=plex-tray
pkgver=0.1.0
pkgrel=3
pkgdesc='Desktop tray controls for the system Plex Media Server service'
arch=('x86_64')
url='https://github.com/bpierre/plex-tray'
license=('MIT')
# Runtime services and xdg-open are required even though they are not linked libraries.
depends=('glibc' 'libgcc' 'dbus' 'systemd' 'polkit' 'plex-media-server' 'xdg-utils' 'hicolor-icon-theme')
makedepends=('cargo')
checkdepends=('desktop-file-utils')
optdepends=('libnotify: desktop notifications for service errors')
options=('!debug')
source=("$pkgname-$pkgver.tar.gz::$url/releases/download/v$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('507c50e5fd9c3c6c1ff0c51df59ef145e7214824a65fce495991b8ef2ab6bda6')
_target="$CARCH-unknown-linux-gnu"

prepare() {
    cd "$srcdir/$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$_target"
}

build() {
    cd "$srcdir/$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --release --frozen --target "$_target"
}

check() {
    cd "$srcdir/$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    desktop-file-validate plex-tray.desktop
    cargo test --frozen --target "$_target"
    ./target/"$_target"/release/plex-tray --help >/dev/null
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    install -Dm755 target/"$_target"/release/plex-tray "$pkgdir/usr/bin/plex-tray"
    install -Dm644 plex-tray.desktop "$pkgdir/usr/share/applications/plex-tray.desktop"
    install -Dm644 icons/plex-tray.svg "$pkgdir/usr/share/icons/hicolor/scalable/apps/plex-tray.svg"
    install -Dm644 icons/plex-tray-symbolic.svg "$pkgdir/usr/share/icons/hicolor/scalable/apps/plex-tray-symbolic.svg"
    install -Dm644 50-plex-tray.rules "$pkgdir/usr/share/polkit-1/rules.d/50-plex-tray.rules"
    install -Dm644 README.md "$pkgdir/usr/share/doc/plex-tray/README.md"
    install -Dm644 CONTRIBUTING.md "$pkgdir/usr/share/doc/plex-tray/CONTRIBUTING.md"
    install -Dm644 RELEASING.md "$pkgdir/usr/share/doc/plex-tray/RELEASING.md"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/plex-tray/LICENSE"
    ln -s ../../licenses/plex-tray/LICENSE "$pkgdir/usr/share/doc/plex-tray/LICENSE"
}
