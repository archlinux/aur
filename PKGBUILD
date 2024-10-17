# Maintainer: HMH <henry@freedesk.net>

pkgname=weylus
pkgver=0.11.4
pkgrel=3
pkgdesc="Use your tablet as graphic tablet/touch screen on your computer."
arch=("x86_64")
url="https://github.com/H-M-H/Weylus"
license=("AGPL3")
conflicts=("weylus-bin")
source=("$pkgname-$pkgver.zip::https://github.com/H-M-H/Weylus/archive/v$pkgver.zip" "linking.patch" "const.patch" "cargo_lock.patch")
sha256sums=("9cc838e6406ea763c448e64775c42a8faf62a43e63a14facfbdbe0704336e4f8" "SKIP" "SKIP" "SKIP")

makedepends=(cargo typescript gcc libx11 pkg-config git make cmake)

prepare() {
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_HOME="$srcdir/cargo"
    cd "Weylus-$pkgver"
    git apply < ../linking.patch
    git apply < ../const.patch
    git apply < ../cargo_lock.patch
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    export CARGO_HOME="$srcdir/cargo"
    export CFLAGS="$CFLAGS -fno-lto"
    export CXXFLAGS="$CXXFLAGS -fno-lto"
    cd "Weylus-$pkgver"
    cargo build --frozen --release --features="ffmpeg-system"
}

package() {
    cd "Weylus-$pkgver"
    install -vDm755 "target/release/weylus" "$pkgdir/usr/bin/weylus"
    install -vDm755 "weylus.desktop" "$pkgdir/usr/share/applications/weylus.desktop"
    install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}

depends=(libxtst libxcursor libxinerama libxft libxrandr libxcomposite libdrm libva ffmpeg dbus gst-plugins-base-libs)
optdepends=("gst-plugin-pipewire: Wayland support")
