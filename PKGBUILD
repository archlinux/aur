# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix

pkgname=refract-git
pkgver=1.6.0.r0.ga350461
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
provides=(refract)
conflicts=(refract)
options=(!lto)
source=("git+https://github.com/Blobfolio/refract.git")
sha256sums=('SKIP')

pkgver() {
  cd refract
  git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

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
