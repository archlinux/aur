# Maintainer: ido
#
# Builds radiopittray from the public GitHub repository.
#
# Updating the package:
#   1. commit and push your changes in the radiopittray repository,
#   2. bump pkgver (keep it in sync with version in Cargo.toml),
#   3. bump _commit to the new HEAD (git rev-parse HEAD),
#   4. regenerate the sha256sums array at the bottom of this file
#      (makepkg -gi prints it; this makepkg keeps checksums in the
#      PKGBUILD itself, not in a separate file),
#   5. bump pkgrel only when this file itself changes.
#
# Package names note: this targets CachyOS, where the GStreamer plugin
# packages are called gst-plugins-base / gst-plugins-good / gst-libav.
# On plain Arch use gstreamer-plugins-base / gstreamer-plugins-good /
# gstreamer-libav instead.

pkgname=radiopittray
pkgver=0.1.0
pkgrel=4
pkgdesc="System tray radio player for your RadioPit.fm library"
arch=(x86_64)
url="https://radiopit.fm"
license=(GPL-3.0)
depends=(
    # gtk::init() and the GLib main context the tray menu is pumped on
    glib2
    gtk3
    # audio: core + standard elements + mp3/aac decoders + ffmpeg (libav)
    # for anything else the streams might throw at the player
    gstreamer
    gst-plugins-base
    gst-plugins-good
    gst-libav
    # system tray (StatusNotifierItem, dlopened by the tray-icon crate)
    libayatana-appindicator
    # xdg-open for the "Open radiopit.fm" menu item
    xdg-utils
)
makedepends=(
    cargo
    rust
    pkgconf
)
# Public GitHub repository of radiopittray; the build is pinned to a commit
# so makepkg stays reproducible.
_commit="4e4642d2a91e18a8a03780c6bf48f999d9ab29bf"
source=(
    "radiopittray-$pkgver::git+https://github.com/idovitz/radiopittray#commit=$_commit"
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
sha256sums=('e255ad1eddeff3a4077df8b51d9d4cd2463b51e4a13c202a8cf316fe9e940721'
            '7df4446a7f7059ed1403440d7af0087f82e481b5189fca7cfa1f600d7042843f')
