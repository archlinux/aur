# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix

pkgname=refract
pkgver=1.6.0
pkgrel=1
pkgdesc="Specialized audio CD-ripper optimized for track recovery"
arch=(x86_64)
url="https://github.com/Blobfolio/refract"
license=(WTFPL)
depends=(
    glibc
    libgcc
    libstdc++
    )
makedepends=(
    git
    cargo
    clang
    yasm
    cmake # reported makedeps for codecs
    ninja # reported makedeps for codecs
    )
optdepends=(
    'zenity: for file dialogues'
	'xdg-desktop-portal-gnome: for file dialogues'
	'xdg-desktop-portal-gtk: for file dialogues'
	'xdg-desktop-portal-kde: for file dialogues'
	)
options=(!lto)
source=("git+https://github.com/Blobfolio/refract.git#tag=v${pkgver}")
sha256sums=('23a9b0ff5b7f61183290fd71915c45453382b6005861d2de88e7ae642a3b2b5e')

prepare() {
  cd refract
  cargo fetch --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd refract
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target

  cargo build --frozen --release
}

package() {
  cd refract
  install -D target/release/refract -t ${pkgdir}/usr/bin
  install -D release/man/*.1 -t "${pkgdir}"/usr/share/man/man1/
  #install -D release/completions/refract.bash -t "${pkgdir}"/usr/share/bash-completion/completions/

  # todo install completions
}
