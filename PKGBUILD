# Maintainer: Norbert Preining <norbert@preining.info>

pkgname=jsongrep
pkgver=0.7.0
pkgrel=1
pkgdesc="CLI tool for fast querying of JSON documents using regular path expressions"
arch=(x86_64)
url=https://github.com/micahkepe/jsongrep
license=(MIT)
makedepends=(
  cargo
  git
)
source=(git+${url}.git#tag=v${pkgver})
b2sums=('8b979934bcbe74ac970387e7667d966b29a4f7819cf37bea481cbd3ca6175e524424819cbe12ea3c03bee9d537f43afa1dd88b612eaf1685aad679823335dc59')

prepare() {
  cargo fetch \
    --locked \
    --manifest-path ${pkgname}/Cargo.toml
}

build() {
  cargo build \
    --release \
    --frozen \
    --manifest-path ${pkgname}/Cargo.toml
  ${pkgname}/target/release/jg generate shell bash > jg.bash
  ${pkgname}/target/release/jg generate man -o .
}

check() {
  cargo test \
    --release \
    --frozen \
    --manifest-path ${pkgname}/Cargo.toml
}

package() {
  cargo install \
    --frozen \
    --offline \
    --no-track \
    --path ${pkgname} \
    --root "${pkgdir}"/usr
  install -Dm 644 ${pkgname}/LICENSE -t "${pkgdir}"/usr/share/licenses/${pkgname}/
  install -Dm 644 jg.bash -t "${pkgdir}"/etc/bash_completion/
  install -Dm 644 jg.1 -t "${pkgdir}"/usr/share/man/man1/
  install -Dm 644 jg-generate.1 -t "${pkgdir}"/usr/share/man/man1/
  install -Dm 644 jg-generate-man.1 -t "${pkgdir}"/usr/share/man/man1/
  install -Dm 644 jg-generate-shell.1 -t "${pkgdir}"/usr/share/man/man1/
}

# vim: ts=2 sw=2 et:
