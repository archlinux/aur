# Maintainer: Goldy goldy@devgoldy.xyz

pkgname=roseate
_pkgver="v0.1.0-alpha.17"
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="🌹 A fancy yet simple image viewer — highly configurable, cross-platform, GPU-accelerated and fast as fu#k."
url="https://github.com/cloudy-org/roseate"
license=(GPL-3.0-only)
provides=("roseate")
conflicts=("roseate-bin")
makedepends=("git" "cargo")
depends=("libxcb" "libxkbcommon" "openssl" "libxrandr")
arch=("x86_64")
source=("git+$url.git#tag=$_pkgver")
sha256sums=('SKIP')

prepare() {
    cd $srcdir/$pkgname
    git submodule update --init --recursive

    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --target "$(rustc -vV | sed -n "s/host: //p")"
}

build() {
    cd $srcdir/$pkgname

    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    CFLAGS+=' -ffat-lto-objects'

    cargo build --release
}

package() {
    cd $srcdir/$pkgname

    install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$pkgname"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

    cd $srcdir/$pkgname/app/assets
    install -Dm644 roseate.desktop "$pkgdir/usr/share/applications/roseate.desktop"
    install -Dm644 rose_emojis/google_noto.png "$pkgdir/usr/share/pixmaps/roseate.png"
}