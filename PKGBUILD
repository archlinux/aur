# Maintainer: Goldy goldy@devgoldy.xyz

pkgname=roseate
_pkgver="0.1.0-alpha.17"
pkgver=${_pkgver//-/.}
pkgrel=2
pkgdesc="🌹 A fancy yet simple image viewer — highly configurable, cross-platform, GPU-accelerated and fast."
url="https://github.com/cloudy-org/roseate"
license=(GPL-3.0-only)
makedepends=("git" "cargo")
depends=("libxcb" "libxkbcommon" "openssl" "libxrandr" "gcc-libs" "glibc")
arch=("x86_64")
source=("git+$url.git#tag=v$_pkgver")
sha256sums=("SKIP")
options=(!lto) # negating lto is required as the ring dependency fails otherwise: 
# https://github.com/WilliamVenner/gmpublisher/issues/262
provides=("roseate")
conflicts=("roseate-bin")

prepare() {
    cd $srcdir/$pkgname
    git submodule update --init --recursive

    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$(rustc --print host-tuple)"
}

build() {
    cd $srcdir/$pkgname

    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release
}

package() {
    cd $srcdir/$pkgname
    install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$pkgname"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

    cd $srcdir/$pkgname/app/assets
    install -Dm644 roseate.desktop "$pkgdir/usr/share/applications/roseate.desktop"
    install -Dm644 rose_emojis/google_noto.png "$pkgdir/usr/share/pixmaps/roseate.png"
}