# Maintainer: IvelOt <contact@ivelot.dev>
pkgname=hal-9001
pkgver=0.1.1
pkgrel=1
pkgdesc="Pure Rust TUI system control hub for Arch users (BTW) tired of 14 separate tools (No AI!)"
arch=('x86_64' 'aarch64')
url="https://github.com/IvelOt/hal-9001"
license=('MIT')
depends=('dbus' 'glibc' 'gcc-libs')
makedepends=('rust')
optdepends=(
    'networkmanager: suporte ao gerenciamento de Wi-Fi e rede (D-Bus)'
    'bluez: suporte a descoberta, pareamento e telemetria de Bluetooth'
    'udisks2: gerenciamento, montagem e ejeção de unidades de armazenamento'
    'upower: monitoramento de bateria e perfis de energia'
    'pipewire: mixer de áudio e controle de volume por aplicativo (via wpctl)'
    'pulseaudio: fallback de mixer de áudio (via pactl)'
    'xorg-xrandr: gerenciamento e auto-expansão de múltiplos monitores sob X11'
    'wlr-randr: gerenciamento de múltiplos monitores sob Wayland (wlroots)'
    'hyprland: gerenciamento de múltiplos monitores sob Hyprland (hyprctl)'
    'sudo: elevação de privilégios para formatação de partições e gravação de ISO'
)
provides=('hal-9001' 'hal9001')
conflicts=('hal-9001-bin')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('045617ff8c3c2da57ef29caef239f029fff094d0bfbbebfc9f0e651ba0c22251')

prepare() {
    cd "$srcdir/$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
    cd "$srcdir/$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release --all-features
}

check() {
    cd "$srcdir/$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    cargo test --frozen --all-features
}

package() {
    cd "$srcdir/$pkgname-$pkgver"

    # Binário principal
    install -Dm755 "target/release/hal9001" "$pkgdir/usr/bin/hal9001"
    ln -sf "/usr/bin/hal9001" "$pkgdir/usr/bin/hal-9001"

    # Arquivo Desktop e Configuração de Exemplo
    install -Dm644 "packaging/desktop/hal-9001.desktop" "$pkgdir/usr/share/applications/hal-9001.desktop"
    install -Dm644 "config.toml" "$pkgdir/etc/hal-9001/config.toml"
    install -Dm644 "config.toml" "$pkgdir/usr/share/doc/$pkgname/config.toml.example"
    install -Dm644 "README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"

    # Licença
    install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
