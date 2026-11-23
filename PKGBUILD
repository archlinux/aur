# Maintainer: Alexeyev Vitaly
# Сгенерировано syngui package -f aur --workspace из syngui-release.toml — правки делать там.
pkgname=linux-legion
pkgver=0.2.0
pkgrel=1
arch=('x86_64')
url='https://github.com/VitaminDB/linux-legion'
license=('MIT')
pkgdesc='Control center for Lenovo Legion laptops: power modes and profiles, fans, Spectrum RGB lighting, battery (Vantage for Linux)'
depends=('fontconfig' 'freetype2' 'libxkbcommon' 'wayland' 'vulkan-icd-loader' 'hicolor-icon-theme' 'gcc-libs' 'glibc' 'gtk3' 'libayatana-appindicator' 'xdotool')
optdepends=('libx11: X11 session'
            'libxcursor: cursors in X11'
            'nvidia-utils: NVIDIA GPU monitoring')
conflicts=('linux-legion-git' 'linux-legion-bin')
install=linux-legion.install
makedepends=('cargo' 'git')
options=('!lto' '!debug')
source=("linux-legion-$pkgver.tar.gz::https://github.com/VitaminDB/linux-legion/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('3850eef090152065edd8ec2ae96eb13ebee865afae7730a6bce48e086d8b592c')

prepare() {
    cd "$srcdir/linux-legion-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    # Cargo.lock тега: версии git-зависимостей (syngui и др.) закреплены.
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd "$srcdir/linux-legion-$pkgver"
    export RUSTUP_TOOLCHAIN=stable CARGO_TARGET_DIR=target
    cargo build --offline --release -p linux-legion
}

package() {
    local _root="$srcdir/linux-legion-$pkgver" _bins="$srcdir/linux-legion-$pkgver/target/release"
    cd "$_root"
    install -Dm755 "$_bins/linux-legion" "$pkgdir/usr/bin/linux-legion"
    install -Dm644 'packaging/linux-legion.desktop' "$pkgdir/usr/share/applications/linux-legion.desktop"
    install -Dm644 'packaging/70-linux-legion.rules' "$pkgdir/usr/lib/udev/rules.d/70-linux-legion.rules"
    install -Dm644 'packaging/linux-legion-autoapply.service' "$pkgdir/usr/lib/systemd/user/linux-legion-autoapply.service"
    install -Dm644 'assets/icon/linux-legion.svg' "$pkgdir/usr/share/icons/hicolor/scalable/apps/linux-legion.svg"
    install -Dm644 'assets/icon/linux-legion-16.png' "$pkgdir/usr/share/icons/hicolor/16x16/apps/linux-legion.png"
    install -Dm644 'assets/icon/linux-legion-32.png' "$pkgdir/usr/share/icons/hicolor/32x32/apps/linux-legion.png"
    install -Dm644 'assets/icon/linux-legion-48.png' "$pkgdir/usr/share/icons/hicolor/48x48/apps/linux-legion.png"
    install -Dm644 'assets/icon/linux-legion-64.png' "$pkgdir/usr/share/icons/hicolor/64x64/apps/linux-legion.png"
    install -Dm644 'assets/icon/linux-legion-128.png' "$pkgdir/usr/share/icons/hicolor/128x128/apps/linux-legion.png"
    install -Dm644 'assets/icon/linux-legion-256.png' "$pkgdir/usr/share/icons/hicolor/256x256/apps/linux-legion.png"
    install -Dm644 'assets/icon/linux-legion-512.png' "$pkgdir/usr/share/icons/hicolor/512x512/apps/linux-legion.png"
    install -Dm644 'README.md' "$pkgdir/usr/share/doc/linux-legion/README.md"
    install -Dm644 'LICENSE' "$pkgdir/usr/share/licenses/linux-legion/LICENSE"
}
