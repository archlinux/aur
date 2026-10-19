# Maintainer: VConet <v-conet@outlook.com>
pkgname=open-cad-studio
_pkgname=OpenCADStudio 
pkgver=2026.42
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
sha256sums=('f9ce82707406f32a0d2f57e45cc4039e1e8be8bfea49affed68d13b79a5e5b34'
            '7c0c21229d5cc12db7ee404188652adce00a3acb51ec2631221c5605c01741bf'
            '178b67c82a369bf193dfe87e26ea8cc5dab823b0dc9382466c971e5845bc1638')
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
    install -Dm644 "$srcdir/logo.png" "$pkgdir/usr/share/icons/hicolor/512x512/apps/OpenCadStudio.png"
    install -Dm644 "assets/logo.svg" "$pkgdir/usr/share/icons/hicolor/scalable/apps/OpenCadStudio.svg"
}
