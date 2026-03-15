# Maintainer: Tenchirox <tenchirox@github.com>
pkgname=all4laser-git
pkgver=0.1
pkgrel=1
pkgdesc="Open-source laser engraver controller built with Rust and egui"
arch=('x86_64' 'aarch64')
url="https://github.com/Tenchirox/All4Laser"
license=('GPL-3.0-only')
depends=(
    'gcc-libs'
    'glibc'
    'libxcb'
    'libxkbcommon'
    'libglvnd'
    'mesa'
    'fontconfig'
    'freetype2'
    'systemd-libs'
    'v4l-utils'
    'gtk3'
    'openssl'
)
makedepends=(
    'git'
    'rust'
    'cargo'
    'pkg-config'
    'cmake'
)
provides=("all4laser=${pkgver}")
conflicts=('all4laser')
source=("${pkgname}::git+https://github.com/Tenchirox/All4Laser.git")
sha256sums=('SKIP')

pkgver() {
    cd "${pkgname}"
    git describe --long --tags 2>/dev/null | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g' \
        || printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    cd "${pkgname}"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd "${pkgname}"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --release
}

check() {
    cd "${pkgname}"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo test --release
}

package() {
    cd "${pkgname}"

    # Binary
    install -Dm755 "target/release/all4laser" "${pkgdir}/usr/bin/all4laser"

    # Desktop entry
    install -Dm644 "assets/all4laser.desktop" "${pkgdir}/usr/share/applications/all4laser.desktop"

    # Icon
    install -Dm644 "A4L.png" "${pkgdir}/usr/share/icons/hicolor/256x256/apps/all4laser.png"

    # License
    install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

    # Documentation
    install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
