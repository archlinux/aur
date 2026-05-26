# Maintainer: munenick <https://github.com/MuNeNICK>
pkgname=hypr-rdp-git
pkgver=0.1.1.r0.gffa17c9
pkgrel=1
pkgdesc="Native RDP server for Hyprland"
arch=('x86_64')
url="https://github.com/MuNeNICK/hypr-rdp"
license=('MIT')
options=(!debug)
depends=(
    'ffmpeg'
    'libva'
    'libxkbcommon'
    'mesa'
    'pipewire'
    'wayland'
)
makedepends=(
    'git'
    'cargo'
    'clang'
    'cmake'
)
optdepends=(
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
    printf "0.1.1.r%s.g%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

prepare() {
    cd "$pkgname"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd "$pkgname"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    # Keep Rust/C build scripts isolated from makepkg hardening flags.
    unset CFLAGS CXXFLAGS LDFLAGS
    cargo build --release
}

package() {
    cd "$pkgname"
    install -Dm755 "target/release/hypr-rdp" "$pkgdir/usr/bin/hypr-rdp"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
