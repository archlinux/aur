# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
# Contributor: soloturn <soloturn@gmail.com>
pkgname=cosmic-launcher-git
pkgver=r179.fa00cf1
pkgrel=1
pkgdesc="WIP Layer Shell frontend for cosmic-launcher."
arch=('x86_64' 'aarch64')
url="https://github.com/pop-os/cosmic-launcher"
license=('GPL-3.0-or-later')
groups=('cosmic')
depends=(
  'hicolor-icon-theme'
  'libxkbcommon'
  'pop-launcher-git'
  'wayland'
)
makedepends=(
  'cargo'
  'git'
  'intltool'
  'just'
  'mold'
)
checkdepends=()
optdepends=()
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
replaces=()
backup=()
options=()
install=
source=('git+https://github.com/pop-os/cosmic-launcher.git')
sha256sums=('SKIP')

pkgver() {
  cd "${pkgname%-git}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "${pkgname%-git}"
  export CARGO_HOME="$srcdir/cargo-home"
  export RUSTUP_TOOLCHAIN=stable
  just vendor

  # Use mold linker instead of lld
  sed -i 's/lld/mold/g' justfile
}

build() {
  cd "${pkgname%-git}"
  # note, consider rust build time optimisations: 
  # https://matklad.github.io/2021/09/04/fast-rust-builds.html, 
  # later. for now, ignore warnings, and build with lower priority 
  # to not block user installing this pkg. to speed up build, use "mold" linker, see 
  # https://stackoverflow.com/questions/67511990/how-to-use-the-mold-linker-with-cargo
  RUSTFLAGS="-A warnings -C link-arg=-fuse-ld=mold"
  just build-vendored
}

package() {
  cd "${pkgname%-git}"
  just rootdir="$pkgdir" install
}
