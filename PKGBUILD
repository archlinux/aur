# Maintainer: Ido van Verseveld <ido at vanverseveld dot org>
#
# Builds radiopittray from the official GitHub releases (tag source tarball).
#
# Updating the package:
#   1. tag the release in the radiopittray repository (vX.Y.Z),
#   2. bump pkgver (keep it in sync with version in Cargo.toml),
#   3. regenerate the sha256sums array at the bottom of this file
#      (makepkg -gi prints it; this makepkg keeps checksums in the
#      PKGBUILD itself, not in a separate file),
#   4. bump pkgrel only when this file itself changes.
#
# Note: Arch adopted the upstream GStreamer plugin package names in 2023,
# so gst-plugins-base / gst-plugins-good / gst-libav work on Arch and
# CachyOS alike.

pkgname=radiopittray
pkgver=0.2.0
pkgrel=1
pkgdesc="System tray radio player for your RadioPit.fm library"
arch=(x86_64)
url="https://github.com/idovitz/radiopittray"
license=(GPL-3.0)
depends=(
    # linked transitively via the gstreamer crate (glib-sys)
    glib2
    # audio: core + standard elements + mp3/aac decoders + ffmpeg (libav)
    # for anything else the streams might throw at the player
    gstreamer
    gst-plugins-base
    gst-plugins-good
    gst-libav
    # xdg-open for the "Open radiopit.fm" menu item
    xdg-utils
)
makedepends=(
    cargo
    rust
    pkgconf
)
# Official GitHub release; the source tarball of the tag v$pkgver, which
# makes the build reproducible against a fixed release.
source=(
    "$pkgname-$pkgver.tar.gz::https://github.com/idovitz/radiopittray/archive/refs/tags/v$pkgver.tar.gz"
    "$pkgname.desktop"
)

build() {
    # makepkg's "lto" build option appends -flto=auto to CFLAGS/CXXFLAGS.
    # The C code that the ring crate (via rustls) compiles then ends up as
    # LTO bitcode that rustc's linker cannot resolve. Rust applies its own
    # LTO in the release profile, so the system C flags are not needed here.
    unset CFLAGS CXXFLAGS LDFLAGS
    cd "$pkgname-$pkgver"
    # Remap the build directory out of the binary: build-script output
    # paths (glutin's generated bindings) would otherwise end up in the
    # binary and makepkg warns about the $srcdir reference.
    RUSTFLAGS="--remap-path-prefix=$srcdir=." \
        cargo build --release --locked
}

package() {
    install -Dm755 "$pkgname-$pkgver/target/release/$pkgname" \
        -D "$pkgdir/usr/bin/$pkgname"
    install -Dm644 "$pkgname-$pkgver/README.md" \
        -D "$pkgdir/usr/share/doc/$pkgname/README.md"
    install -Dm644 "$pkgname-$pkgver/LICENSE" \
        -D "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 "$srcdir/$pkgname.desktop" \
        -D "$pkgdir/usr/share/applications/$pkgname.desktop"
}
sha256sums=('eebd8138db02cc7640b53912773a73b3c8b4dcd17b92c33dee549e5fdcd23bd9'
            '7df4446a7f7059ed1403440d7af0087f82e481b5189fca7cfa1f600d7042843f')
