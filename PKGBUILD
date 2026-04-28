# Maintainer: Mahir <koktail on GitHub>
pkgname=kctop
pkgver=0.2.0
pkgrel=1
pkgdesc="koktail claude's top — a futuristic TUI system monitor for Linux"
arch=('x86_64' 'aarch64')
url="https://github.com/MahiroJV/kctop"
license=('MIT')
depends=('gcc-libs')
makedepends=('rust' 'cargo')
source=("$pkgname-$pkgver.tar.gz::https://github.com/MahiroJV/kctop/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('3b6ba881051777de0398c126757c18511743b630473e0b15cf846510d6604f49')

prepare() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release
}

package() {
    cd "$pkgname-$pkgver"

    # binary
    install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"

    # license
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

    # desktop entry
    install -dm755 "$pkgdir/usr/share/applications"
    cat > "$pkgdir/usr/share/applications/$pkgname.desktop" << DESKTOP
[Desktop Entry]
Version=1.0
Type=Application
Name=kctop
GenericName=System Monitor
Comment=koktail claude's top — futuristic TUI system monitor
Exec=kctop
Icon=utilities-system-monitor
Terminal=true
Categories=System;Monitor;
Keywords=cpu;memory;disk;network;monitor;top;
StartupNotify=false
DESKTOP

    # icon
    if [[ -f "assets/kctop.svg" ]]; then
        install -Dm644 "assets/kctop.svg" \
            "$pkgdir/usr/share/icons/hicolor/scalable/apps/$pkgname.svg"
    fi
}
