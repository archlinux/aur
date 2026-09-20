# Maintainer: aNNiMON <annimon119 at gmail dot com>
_pkgauthor=aNNiMON
pkgname=effy
pkgver=0.10.0
pkgrel=1
pkgdesc="A small and friendly terminal FFmpeg helper that simplifies common tasks"
url="https://projects.annimon.com/projects/effy/"
license=('MIT')
makedepends=('cargo')
depends=('ffmpeg' 'gcc-libs' 'glibc')
arch=('x86_64' 'aarch64')
options=('!debug')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/${_pkgauthor}/${pkgname}/archive/refs/tags/v${pkgver}.tar.gz")
b2sums=('3daa388d58b5e04be22617691b793fce526ebf9f298d4dcedefb08ff8368a5c1d363705deab393482efbb988dbba1c261c837ee957a0c0cc4e83cabe0114d6ee')

prepare() {
  cd "${pkgname}-${pkgver}"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "${pkgname}-${pkgver}"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release --all-features
}

check() {
  cd "${pkgname}-${pkgver}"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo test --frozen --all-features --all-targets
}

package() {
  cd "${pkgname}-${pkgver}"
  install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$pkgname"
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
  install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
