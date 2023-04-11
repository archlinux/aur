# Maintainer: soloturn <soloturn@gmail.com>
# Co-Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix

pkgname=cosmic-bg-git
pkgver=r47.fe4bf3a
pkgrel=1
pkgdes="background for the COSMIC DE."
arch=('x86_64' 'aarch64')
url="https://github.com/pop-os/cosmic-bg"
license=('GPL3')
groups=('cosmic')
depends=(
  'libxkbcommon' 'wayland'
)
makedepends=('cargo' 'clang' 'git' 'just' 'mold')
provides=('cosmic-bg')
conflicts=('cosmic-bg')
options=('!lto')
source=(
  'git+https://github.com/pop-os/cosmic-bg.git'
)
sha256sums=(
  'SKIP'
)

pkgver() {
  cd "$srcdir/cosmic-bg"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$srcdir/cosmic-bg"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd "$srcdir/cosmic-bg"
  export RUSTUP_TOOLCHAIN=stable
  # note, consider rust build time optimisations: 
  # https://matklad.github.io/2021/09/04/fast-rust-builds.html, 
  # later. for now, ignore warnings, and build with lower priority 
  # to not block user installing this pkg. to speed up build, use "mold" linker, see 
  # https://stackoverflow.com/questions/67511990/how-to-use-the-mold-linker-with-cargo
  RUSTFLAGS="-A warnings -C link-arg=-fuse-ld=mold"
  nice just
}

package() {
  cd "$srcdir/cosmic-bg"
  just rootdir="$pkgdir" install
}
