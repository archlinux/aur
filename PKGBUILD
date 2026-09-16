# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix

pkgname=riprip
pkgver=0.6.1
pkgrel=1
pkgdesc="Specialized audio CD-ripper optimized for track recovery"
arch=(x86_64)
url="https://github.com/Blobfolio/riprip"
license=(WTFPL)
depends=(
    glibc
    #libcdio
    libgcc
    )
makedepends=(
    git
    cargo
    clang
    )
#options=(!lto)
source=("git+https://github.com/Blobfolio/riprip.git#tag=v${pkgver}")
sha256sums=('e6e7e800beb385a8c4a13c980cbc8ce9eafa9c87f5f79341120c07d2f352edbe')

prepare() {
  cd riprip
  cargo fetch --target host-tuple
}

build() {
  cd riprip
  CFLAGS+=" -ffat-lto-objects"
  CXXFLAGS+=" -ffat-lto-objects"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release
}

package() {
  cd riprip
  install -D target/release/riprip -t "${pkgdir}"/usr/bin
  install -D release/man/*.1 -t "${pkgdir}"/usr/share/man/man1/

  # todo install completions
}
