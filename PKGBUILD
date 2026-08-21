# Maintainer: VConet <v-conet@outlook.com>
pkgname=open-cad-studio
_pkgname=OpenCADStudio
pkgver=0.9.7
pkgrel=1
pkgdesc="A CAD application built with Rust — 2D/3D drawing, DWG/DXF support, and GPU-accelerated rendering"
arch=('x86_64')
url="https://github.com/HakanSeven12/OpenCADStudio"
license=('GPL-3.0-only')
depends=('xdg-desktop-portal' 'glibc' 'libgcc' 'wayland')
makedepends=('cargo' 'git')
source=(
    "$url/archive/refs/tags/v${pkgver}.tar.gz"
    "logo.png"
    "OpenCADStudio.desktop"
)
sha256sums=(
    'c56a5da1bad8262f94fcba0e188e865c27d3329b670bfa425de6dc3329296c9f'
    '0d1be965a2d3d2b9013be97fd18b4e5bee92369547cf184c19de0629879f362b'
    'ad8b78df51f5bb346a41812b649b7f201c460c045982080c51539398fb9b2f93'
)
options=(!lto)
prepare() {
    cd "$srcdir/$_pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd "$srcdir/$_pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    # export CARGO_PROFILE_RELEASE_LTO=false
    cargo build --frozen --release
}

package() {
    cd "$srcdir/$_pkgname-$pkgver"
    install -Dm755 "target/release/OpenCADStudio" "$pkgdir/usr/bin/OpenCADStudio"
    install -Dm644 "$srcdir/OpenCADStudio.desktop" "$pkgdir/usr/share/applications/OpenCADStudio.desktop"
    install -Dm644 "$srcdir/logo.png" "$pkgdir/usr/share/icons/hicolor/512x512/apps/OpenCADStudio.png"
    install -Dm644 "assets/logo.svg" "$pkgdir/usr/share/icons/hicolor/scalable/apps/OpenCADStudio.svg"
}
