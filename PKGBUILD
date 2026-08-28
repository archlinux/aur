# Maintainer: Norbert Preining <norbert@preining.info>

pkgname=jsongrep
pkgver=0.10.0
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
b2sums=('3d20d5d9def35a36ea9c1da91c24c428ab1346cf1dd93043d664868b1f5f100d13d7f7134de8f41c8df94d1771629e97f3709f16595530dcc9c983a86320a022')

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
