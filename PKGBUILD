# Maintainer: soloturn <soloturn@gmail.com>
# Co-Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix

pkgname=cosmic-settings-git
pkgver=r106.a549e8b
pkgrel=1
pkgdesc="settings for the COSMIC DE panel."
arch=('x86_64' 'aarch64')
url="https://github.com/pop-os/cosmic-settings"
license=('GPL3')
groups=('cosmic')
makedepends=('cargo' 'clang' 'git' 'just' 'mold')
provides=('cosmic-settings')
conflicts=('cosmic-settings')
options=('!lto')
source=(
  'git+https://github.com/pop-os/cosmic-settings.git'
)
sha256sums=(
  'SKIP'
)

pkgver() {
  cd "$srcdir/cosmic-settings"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$srcdir/cosmic-settings"
  export CARGO_HOME="$srcdir/cargo-home"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --target "$CARCH-unknown-linux-gnu"

  # Use mold linker instead of lld
  sed -i 's/lld/mold/g' justfile
}

build() {
  cd "$srcdir/cosmic-settings"
  export CARGO_HOME="$srcdir/cargo-home"
  export RUSTUP_TOOLCHAIN=stable
  # note, consider rust build time optimisations: 
  # https://matklad.github.io/2021/09/04/fast-rust-builds.html, 
  # later. for now, ignore warnings, and build with lower priority 
  # to not block user installing this pkg. to speed up build, use "mold" linker, see 
  # https://stackoverflow.com/questions/67511990/how-to-use-the-mold-linker-with-cargo
  #RUSTFLAGS="-A warnings -C link-arg=-fuse-ld=mold"
  nice just build-release
}

package() {
  cd "$srcdir/cosmic-settings"
  just rootdir="$pkgdir" install
}
