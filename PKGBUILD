pkgname=oneclient
pkgver=1.0.3
pkgrel=1
pkgdesc='Next-generation open source Minecraft launcher'
url='https://polyfrost.org/projects/oneclient'
arch=('x86_64')
license=('GPL-3.0-only')

makedepends=('rust' 'pnpm' 'nodejs' 'clang' 'nasm' 'perl')
depends=(
    'openssl' 'dbus' 'gtk3' 'libayatana-appindicator' 'librsvg' 'webkit2gtk-4.1'
    'libgl' 'libpulse' 'libx11' 'libxcursor' 'libxext' 'libxxf86vm'
)
optdepends=(
    'xorg-xrandr: very legacy minecraft versions'
)
conflicts=('oneclient-bin')
source=("$pkgname-$pkgver.tar.gz::https://github.com/Polyfrost/OneLauncher/archive/refs/tags/oneclient-${pkgver}.tar.gz")
sha256sums=('SKIP')
options=('!lto')

prepare() {
    cd "OneLauncher-oneclient-${pkgver}"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
    pnpm install --frozen-lockfile
}

build() {
    cd "OneLauncher-oneclient-${pkgver}"
    export RUSTUP_TOOLCHAIN=stable
    pnpm --filter @oneclient/frontend build
    cargo build --frozen --release -p oneclient_gui
}

check() {
    cd "OneLauncher-oneclient-${pkgver}"
    export RUSTUP_TOOLCHAIN=stable
    cargo test --frozen -p oneclient_gui
}

package() {
    cd "OneLauncher-oneclient-${pkgver}"
    install -Dm755 "target/release/oneclient_gui" "$pkgdir/usr/bin/oneclient"
    install -Dm644 "apps/oneclient/distribution/icons/128x128.png" "$pkgdir/usr/share/icons/hicolor/128x128/apps/org.polyfrost.oneclient.png"
    install -Dm644 "apps/oneclient/distribution/icons/512x512.png" "$pkgdir/usr/share/icons/hicolor/512x512/apps/org.polyfrost.oneclient.png"
    install -Dm644 "apps/oneclient/distribution/flatpak/org.polyfrost.oneclient" "$pkgdir/usr/share/applications/org.polyfrost.oneclient.desktop"
}
