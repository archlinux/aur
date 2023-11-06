# Maintainer: soloturn <soloturn@gmail.com>
# Co-Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix

pkgname=cosmic-applibrary-git
pkgver=r97.514c155
pkgrel=1
pkgdesc="applibrary for the COSMIC DE panel."
arch=('x86_64' 'aarch64')
url="https://github.com/pop-os/cosmic-applibrary"
license=('GPL3')
depends=(
  'gtk4' 'libinput' 'libglvnd' 'libpipewire' 'libpulse'
  'libxkbcommon' 'pop-launcher' 'systemd-libs' 'wayland'
)
groups=('cosmic')
makedepends=('cargo' 'git' 'just' 'mold')
provides=('cosmic-applibrary')
conflicts=('cosmic-applibrary')
options=('!lto')
source=(
  'git+https://github.com/pop-os/cosmic-applibrary.git'
)
sha256sums=(
  'SKIP'
)

pkgver() {
  cd "$srcdir/cosmic-applibrary"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$srcdir/cosmic-applibrary"
  export CARGO_HOME="$srcdir/cargo-home"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd "$srcdir/cosmic-applibrary"
  export CARGO_HOME="$srcdir/cargo-home"
  export RUSTUP_TOOLCHAIN=stable
  # note, consider rust build time optimisations: 
  # https://matklad.github.io/2021/09/04/fast-rust-builds.html, 
  # later. for now, ignore warnings, and build with lower priority 
  # to not block user installing this pkg. to speed up build, use "mold" linker, see 
  # https://stackoverflow.com/questions/67511990/how-to-use-the-mold-linker-with-cargo
  RUSTFLAGS="-A warnings -C link-arg=-fuse-ld=mold"
  nice just build-release
}

package() {
  cd "$srcdir/cosmic-applibrary"
  just rootdir="$pkgdir" install
}
