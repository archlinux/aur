# Maintainer: cyqsimon <28627918+cyqsimon@users.noreply.github.com>

pkgname=rng-rename
pkgver=0.6.3
pkgrel=1
pkgdesc="A CLI tool to rename files to randomly generated strings."
arch=("x86_64" "i686" "armv6h" "armv7h" "aarch64")
url="https://github.com/cyqsimon/rng-rename"
license=("AGPL3")
conflicts=("${pkgname}-git" "${pkgname}-bin")
depends=("gcc-libs")
makedepends=("cargo")
source=("${pkgname}-${pkgver}.tar.gz::https://static.crates.io/crates/${pkgname}/${pkgname}-${pkgver}.crate")
sha512sums=('3a9dc955cd183f36fae1895ff49299a1bd06ed81aa2cf75dbde8642dcb711cb4e7fc702c3ef457cf9e2d49251a0fd37482480363feea30d4f034d6962b447e5a')

prepare() {
  cd ${pkgname}-${pkgver}
  cargo fetch --locked
}

build() {
  cd ${pkgname}-${pkgver}
  cargo build --release --frozen
  target/release/rng-rename complete bash > completion.bash
  target/release/rng-rename complete fish > completion.fish
  target/release/rng-rename complete zsh > completion.zsh
}

package() {
  cd ${pkgname}-${pkgver}
  install -Dm755 -t "${pkgdir}/usr/bin" target/release/rng-rename
  install -Dm644 completion.bash "${pkgdir}/usr/share/bash-completion/completions/rng-rename"
  install -Dm644 completion.fish "${pkgdir}/usr/share/fish/vendor_completions.d/rng-rename.fish"
  install -Dm644 completion.zsh "${pkgdir}/usr/share/zsh/site-functions/_rng-rename"
}
