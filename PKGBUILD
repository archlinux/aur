# Maintainer: Matvel007
pkgname=tidy-cleaner-git
_pkgname=tidy-cleaner
pkgver=0.1.0.r0.g0000000
pkgrel=1
pkgdesc="Modern, ultra-fast, and safe system cleaner, manager, and hardware telemetry dashboard for Linux (git master branch)"
arch=('x86_64' 'aarch64')
url="https://github.com/Matvel007/Tidy-Cleaner"
license=('MIT')
depends=('gcc-libs' 'glibc')
makedepends=('cargo' 'git')
optdepends=(
    'polkit: Elevated privilege actions (system-wide uninstallation)'
    'nvidia-utils: GPU telemetry for NVIDIA graphics cards'
    'flatpak: Flatpak application management'
    'snapd: Snap application management'
    'yay: AUR package management'
    'paru: AUR package management'
)
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("git+$url.git")
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/Tidy-Cleaner"
    git describe --long --tags --abbrev=7 2>/dev/null | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g' || \
    printf "0.1.0.r%s.g%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

prepare() {
    cd "$srcdir/Tidy-Cleaner"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd "$srcdir/Tidy-Cleaner"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --release --frozen
}

check() {
    cd "$srcdir/Tidy-Cleaner"
    export RUSTUP_TOOLCHAIN=stable
    cargo test --frozen
}

package() {
    cd "$srcdir/Tidy-Cleaner"
    install -Dm755 "target/release/$_pkgname" "$pkgdir/usr/bin/$_pkgname"
    install -Dm644 "tidy-cleaner.desktop" "$pkgdir/usr/share/applications/$_pkgname.desktop"
    install -Dm644 "resources/icons/logo.svg" "$pkgdir/usr/share/icons/hicolor/scalable/apps/$_pkgname.svg"
    install -Dm644 "resources/icons/logo.png" "$pkgdir/usr/share/pixmaps/$_pkgname.png"
    install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
    install -Dm644 "README.md" "$pkgdir/usr/share/doc/$_pkgname/README.md"
}
