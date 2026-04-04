# Maintainer: Norbert Preining <norbert@preining.info>

pkgname=jsongrep
pkgver=0.8.1
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
b2sums=('0cedc3e92b459768efbb3bacbfc1bd4b6ed71eb30d63389a3eaf1883243de4052a09c56222db6bb09c151cdf695ce9f42d5902e36953b15cfbdb445bc1087931')

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
