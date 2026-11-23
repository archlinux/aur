# Maintainer: Alexeyev Vitaly
# Сгенерировано syngui package -f aur --workspace из syngui-release.toml — правки делать там.
pkgname=linux-legion-git
pkgver=0.2.0.r0
pkgrel=1
arch=('x86_64')
url='https://github.com/VitaminDB/linux-legion'
license=('MIT')
pkgdesc='Control center for Lenovo Legion laptops: power modes and profiles, fans, Spectrum RGB lighting, battery (Vantage for Linux)'
depends=('fontconfig' 'freetype2' 'libxkbcommon' 'wayland' 'vulkan-icd-loader' 'hicolor-icon-theme' 'gcc-libs' 'glibc' 'gtk3' 'libayatana-appindicator' 'xdotool')
optdepends=('libx11: X11 session'
            'libxcursor: cursors in X11'
            'nvidia-utils: NVIDIA GPU monitoring')
provides=('linux-legion')
conflicts=('linux-legion' 'linux-legion-bin')
install=linux-legion.install
makedepends=('cargo' 'git')
options=('!lto' '!debug')
source=("linux-legion::git+https://github.com/VitaminDB/linux-legion.git")
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/linux-legion"
    if git describe --tags >/dev/null 2>&1; then
        git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
    else
        printf '%s.r%s.g%s' '0.2.0' "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
    fi
}

prepare() {
    cd "$srcdir/linux-legion"
    export RUSTUP_TOOLCHAIN=stable
    # Без --locked: git-зависимости (syngui и др.) свежие, Cargo.lock обновится.
    cargo fetch --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd "$srcdir/linux-legion"
    export RUSTUP_TOOLCHAIN=stable CARGO_TARGET_DIR=target
    cargo build --offline --release -p linux-legion
}

package() {
    local _root="$srcdir/linux-legion" _bins="$srcdir/linux-legion/target/release"
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
