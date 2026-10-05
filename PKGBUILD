# Maintainer: Matvel007
pkgname=tidy-cleaner
pkgver=0.2.0
pkgrel=1
pkgdesc="Modern, ultra-fast, and safe system cleaner, manager, and hardware telemetry dashboard for Linux"
arch=('x86_64' 'aarch64')
url="https://github.com/Matvel007/Tidy-Cleaner"
license=('MIT')
depends=('gcc-libs' 'glibc' 'fontconfig')
makedepends=('cargo')
optdepends=(
    'polkit: Elevated privilege actions (system-wide uninstallation)'
    'nvidia-utils: GPU telemetry for NVIDIA graphics cards'
    'flatpak: Flatpak application management'
    'snapd: Snap application management'
    'yay: AUR package management'
    'paru: AUR package management'
)
provides=("$pkgname")
conflicts=("$pkgname-git")
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('SKIP')

prepare() {
    cd "Tidy-Cleaner-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd "Tidy-Cleaner-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --release --frozen
}

check() {
    cd "Tidy-Cleaner-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    cargo test --frozen
}

package() {
    cd "Tidy-Cleaner-$pkgver"
    install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
    install -Dm644 "tidy-cleaner.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
    install -Dm644 "resources/icons/logo.svg" "$pkgdir/usr/share/icons/hicolor/scalable/apps/$pkgname.svg"
    install -Dm644 "resources/icons/logo.png" "$pkgdir/usr/share/pixmaps/$pkgname.png"
    install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 "README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
}
