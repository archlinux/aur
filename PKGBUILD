# Maintainer: Mathieu GRENET <mathieu@mgth.fr>
# Release package: built from the source of the v$pkgver tag. After
# tagging, refresh the checksum (updpkgsums) and .SRCINFO
# (makepkg --printsrcinfo > .SRCINFO).

pkgname=unsampled-piano
pkgver=0.1.0
pkgrel=1
pkgdesc="Physically modelled piano, no samples: standalone player, CLAP and VST3 plugins"
arch=('x86_64' 'aarch64')
url="https://github.com/mgth/unsampled-piano"
license=('GPL-3.0-or-later')
# The window loads X11 or Wayland, xkbcommon and OpenGL at run time.
depends=('alsa-lib' 'gcc-libs' 'glibc' 'hicolor-icon-theme' 'libglvnd' 'libpipewire'
         'libx11' 'libxcursor' 'libxi' 'libxkbcommon' 'libxkbcommon-x11' 'wayland')
# jack: only its pkg-config file, for the build (jack-sys); libjack is
# loaded at run time.
makedepends=('cargo' 'clang' 'jack' 'pkgconf')
optdepends=('pipewire-jack: the player as a graph node with MIDI in and out (or jack2)')
# makepkg's LTO turns libspa's C wrappers into bitcode Rust's linker cannot read.
options=('!lto')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('a44638341471867f26ae1fb95f9dfe4d6bef96daf5c99defa821c10ebc15b1de')

prepare() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable CARGO_TARGET_DIR=target
    # No build paths in the binaries (generated sources' locations).
    export RUSTFLAGS="${RUSTFLAGS:-} --remap-path-prefix=$srcdir=/build"
    installer/linux/make-archive.sh --no-tar --frozen
}

package() {
    cd "$pkgname-$pkgver"
    target/linux/$pkgname-$pkgver-linux-$CARCH/install.sh --destdir "$pkgdir" \
        --prefix /usr --clap-dir /usr/lib/clap --vst3-dir /usr/lib/vst3
}
