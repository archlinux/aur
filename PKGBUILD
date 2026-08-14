# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix

pkgname=flaca-git
pkgver=3.9.1.r0.ga8b47d8
pkgrel=1
pkgdesc="Specialized audio CD-ripper optimized for track recovery"
arch=(x86_64)
url="https://github.com/Blobfolio/flaca"
license=(WTFPL)
depends=(
    glibc
    libgcc
    )
makedepends=(
    git
    cargo
    clang
    )
provides=(flaca)
conflicts=(flaca)
options=(!lto)
source=("git+https://github.com/Blobfolio/flaca.git")
sha256sums=('SKIP')

pkgver() {
  cd flaca
  git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd flaca
  cargo fetch --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd flaca
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target

  cargo build --frozen --release
}

package() {
  cd flaca
  install -D target/release/flaca -t ${pkgdir}/usr/bin
  install -D release/man/*.1 -t "${pkgdir}"/usr/share/man/man1/
  #install -D release/completions/flaca.bash -t "${pkgdir}"/usr/share/bash-completion/completions/

  # todo install completions
}
