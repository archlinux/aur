# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix

pkgname=riprip-git
pkgver=0.5.9.r0.g3fb58d1
pkgrel=1
pkgdesc="Specialized audio CD-ripper optimized for track recovery"
arch=(x86_64)
url="https://github.com/Blobfolio/riprip"
license=(WTFPL)
depends=(
    glibc
    libcdio
    libgcc
    )
makedepends=(
    git
    cargo
    clang
    )
provides=(riprip)
conflicts=(riprip)
options=(!lto)
source=("git+https://github.com/Blobfolio/riprip.git")
sha256sums=('SKIP')

pkgver() {
  cd riprip
  git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd riprip
  cargo fetch --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd riprip
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target

  cargo build --frozen --release
}

package() {
  cd riprip
  install -D target/release/riprip -t ${pkgdir}/usr/bin
  install -D release/man/*.1 -t "${pkgdir}"/usr/share/man/man1/

  # todo install completions
}
