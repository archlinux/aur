# Maintainer: Coobyk <coobyk@github>

pkgname=gpu-screen-recorder-gpui
pkgver=5.7.10
pkgrel=2
pkgdesc="GPUI (Rust) frontend for gpu-screen-recorder"
arch=('x86_64')
url="https://github.com/Coobyk/gpu-screen-recorder-gpui"
license=('GPL-3.0-only')
# makepkg's `lto` option (enabled by default) adds `-flto=auto` to CFLAGS. The C
# shim inside wayland-backend is then a GCC LTO object, and rustc bundles it
# into the rlib without an archive-index entry, so ld.lld cannot resolve
# `wl_log_trampoline_to_rust_client` and the final link fails. Opting out of
# LTO here avoids that; it does nothing useful for a Rust build anyway.
options=('!lto')
depends=(
    'gpu-screen-recorder'
    'libglvnd'
    'vulkan-icd-loader'
    'wayland'
    'libxkbcommon'
    'libxkbcommon-x11'
    'libxcb'
    'libxau'
    'libxdmcp'
)
makedepends=(
    'rust'
    'pkgconf'
    'fontconfig'
    'freetype2'
    'libx11'
)
# Mutually exclusive with the prebuilt package.
conflicts=('gpu-screen-recorder-gpui-bin')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('b92de7aff6ec31bca982f0952e55eef81ffdf56240a8300aa622843bc36d10f6')

build() {
    cd "$pkgname-$pkgver"
    cargo build --release --locked
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
    install -Dm644 "com.coobyk.gpu_screen_recorder.desktop" \
        "$pkgdir/usr/share/applications/com.coobyk.gpu_screen_recorder.desktop"
    # The application icon plus the tray-idle/recording/paused variants that
    # the tray looks up by icon name.
    for f in icons/hicolor/scalable/apps/*.svg; do
        install -Dm644 "$f" \
            "$pkgdir/usr/share/icons/hicolor/scalable/apps/$(basename "$f")"
    done
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
