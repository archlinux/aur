# Maintainer: soloturn <soloturn@gmail.com>
# Co-Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix

pkgname=cosmic-applets-git
pkgver=r591.ff21419
pkgrel=1
pkgdesc="applets for the COSMIC DE panel."
arch=('x86_64' 'aarch64')
url="https://github.com/pop-os/cosmic-applets"
license=('GPL3')
groups=('cosmic')
depends=(
  'gtk4' 'libinput' 'libglvnd' 'libpipewire' 'libpulse'
  'libxkbcommon' 'pop-launcher' 'systemd-libs' 'wayland'
)
makedepends=('cargo' 'clang' 'git' 'just' 'mold')
provides=('cosmic-applets')
conflicts=('cosmic-applets')
options=('!lto')
source=(
  'git+https://github.com/pop-os/cosmic-applets.git'
)
sha256sums=(
  'SKIP'
)

pkgver() {
  cd "$srcdir/cosmic-applets"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$srcdir/cosmic-applets"
  export CARGO_HOME="$srcdir/cargo-home"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd "$srcdir/cosmic-applets"
  export CARGO_HOME="$srcdir/cargo-home"
  export RUSTUP_TOOLCHAIN=stable
  # note, consider rust build time optimisations: 
  # https://matklad.github.io/2021/09/04/fast-rust-builds.html, 
  # later. for now, ignore warnings, and build with lower priority 
  # to not block user installing this pkg. to speed up build, use "mold" linker, see 
  # https://stackoverflow.com/questions/67511990/how-to-use-the-mold-linker-with-cargo
  RUSTFLAGS="-A warnings -C link-arg=-fuse-ld=mold"
  nice just build
}

package() {
  cd "$srcdir/cosmic-applets"
  just rootdir="$pkgdir" install
}
