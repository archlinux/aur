# Maintainer: Mathieu GRENET <mathieu@mgth.fr>
# Development package: the latest commit of main.

pkgname=unsampled-piano-git
_name=unsampled-piano
pkgver=0.2.0.r151.gc7c604f
pkgrel=1
pkgdesc="Physically modelled piano, no samples: standalone player, CLAP and VST3 plugins (development version)"
arch=('x86_64' 'aarch64')
url="https://github.com/mgth/unsampled-piano"
license=('GPL-3.0-or-later')
# The window loads X11 or Wayland, xkbcommon and OpenGL at run time.
depends=('alsa-lib' 'gcc-libs' 'glibc' 'hicolor-icon-theme' 'libglvnd' 'libpipewire'
         'libx11' 'libxcursor' 'libxi' 'libxkbcommon' 'libxkbcommon-x11' 'wayland')
# jack: only its pkg-config file, for the build (jack-sys); libjack is
# loaded at run time.
makedepends=('cargo' 'clang' 'git' 'jack' 'pkgconf')
optdepends=('pipewire-jack: the player as a graph node with MIDI in and out (or jack2)')
# makepkg's LTO turns libspa's C wrappers into bitcode Rust's linker cannot read.
options=('!lto')
provides=("$_name")
conflicts=("$_name")
source=("$_name::git+$url.git")
sha256sums=('SKIP')

# Cargo version, commits since the start, commit.
pkgver() {
    cd "$_name"
    local version
    version=$(sed -n 's/^version = "\(.*\)"/\1/p' Cargo.toml | head -1)
    printf "%s.r%s.g%s" "$version" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

prepare() {
    cd "$_name"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd "$_name"
    export RUSTUP_TOOLCHAIN=stable CARGO_TARGET_DIR=target
    # No build paths in the binaries (generated sources' locations).
    export RUSTFLAGS="${RUSTFLAGS:-} --remap-path-prefix=$srcdir=/build"
    installer/linux/make-archive.sh --no-tar --frozen
}

package() {
    cd "$_name"
    local version
    version=$(sed -n 's/^version = "\(.*\)"/\1/p' Cargo.toml | head -1)
    target/linux/$_name-$version-linux-$CARCH/install.sh --destdir "$pkgdir" \
        --prefix /usr --clap-dir /usr/lib/clap --vst3-dir /usr/lib/vst3
}
