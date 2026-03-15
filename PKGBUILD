# Maintainer: munenick <https://github.com/MuNeNICK>
pkgname=hypr-rdp-git
pkgver=0.1.0.r0.g3d5c7b6
pkgrel=1
pkgdesc="Native RDP server for Hyprland"
arch=('x86_64')
url="https://github.com/MuNeNICK/hypr-rdp"
license=('MIT')
depends=(
    'libxkbcommon'
    'libva'
    'pipewire'
)
makedepends=(
    'git'
    'cargo'
    'cmake'
    'clang'
)
optdepends=(
    'openh264: software H.264 encoding fallback'
    'intel-media-driver: VA-API hardware encoding for Intel GPUs'
    'libva-mesa-driver: VA-API hardware encoding for AMD GPUs'
)
provides=('hypr-rdp')
conflicts=('hypr-rdp')
source=("${pkgname}::git+https://github.com/MuNeNICK/hypr-rdp.git")
sha256sums=('SKIP')

pkgver() {
    cd "$pkgname"
    git describe --long --tags --abbrev=7 2>/dev/null | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "0.1.0.r%s.g%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

prepare() {
    cd "$pkgname"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd "$pkgname"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release
}

package() {
    cd "$pkgname"
    install -Dm755 "target/release/hypr-rdp" "$pkgdir/usr/bin/hypr-rdp"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
