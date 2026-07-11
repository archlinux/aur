# Maintainer: A Farzat <a@farzat.xyz>
# Contributor: Mikael Blomstrand <gmail: kmbloms>

_pkgname=svgbob
pkgname=svgbob-git
pkgver=0.7.6.r620.6d00ad9
pkgrel=1
pkgdesc='Convert your ascii diagram scribbles into happy little SVG'
arch=('i686' 'x86_64')
url="https://github.com/ivanceras/svgbob"
license=('Apache-2.0')
depends=('gcc-libs')
conflicts=('svgbob')
provides=('svgbob')
makedepends=('cargo' 'git')
source=("git+https://github.com/ivanceras/svgbob.git")
sha1sums=('SKIP')

pkgver() {
    cd "${srcdir}/svgbob"
    printf "%s.r%s.%s" "$(grep '^version = ' crates/svgbob_cli/Cargo.toml | sed -e "s/version = \"//" -e "s/\"//" -e "s/-//")"\
                       "$(git rev-list --count HEAD)"\
                       "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "${srcdir}/svgbob/crates/svgbob_cli"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --target host-tuple
}

build() {
  cd "${srcdir}/svgbob/crates/svgbob_cli"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release --all-features
}

package() {
  install -Dm755 "${srcdir}/svgbob/crates/svgbob_cli/target/release/svgbob_cli" "${pkgdir}/usr/bin/svgbob"
  install -Dm644 "${srcdir}/svgbob/README.md" "${pkgdir}/usr/share/doc/${_pkgname}"
}
