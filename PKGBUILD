# Maintainer: munenick <https://github.com/MuNeNICK>
pkgname=hypr-rdp
pkgver=0.1.8
pkgrel=1
pkgdesc="Native RDP server for Hyprland"
arch=('x86_64')
url="https://github.com/MuNeNICK/hypr-rdp"
license=('MIT')
options=(!debug)
backup=('etc/pam.d/hypr-rdp')
depends=(
    'pam'
    'fuse3'
    'libpulse'
    'libva'
    'libxkbcommon'
    'mesa'
    'pipewire'
    'wayland'
)
makedepends=(
    'cargo'
    'clang'
    'cmake'
)
optdepends=(
    'intel-media-driver: VA-API hardware encoding for Intel GPUs'
    'libva-mesa-driver: VA-API hardware encoding for AMD GPUs'
)
source=("$pkgname-$pkgver.tar.gz::https://github.com/MuNeNICK/hypr-rdp/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('755903df5b530dda9178332c2d7c371d1ef1db9aef1eefb10d7681ed02ea3efa')

prepare() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    # Keep Rust/C build scripts isolated from makepkg hardening flags.
    unset CFLAGS CXXFLAGS LDFLAGS
    cargo build --frozen --release
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm755 "target/release/hypr-rdp" "$pkgdir/usr/bin/hypr-rdp"
    install -Dm644 pkg/pam/hypr-rdp.arch "$pkgdir/etc/pam.d/hypr-rdp"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
    install -Dm644 CHANGELOG.md "$pkgdir/usr/share/doc/$pkgname/CHANGELOG.md"
}
