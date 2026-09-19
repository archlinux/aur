# Maintainer: aNNiMON <annimon119 at gmail dot com>
_pkgauthor=aNNiMON
pkgname=effy
pkgver=0.9.0
pkgrel=1
pkgdesc="A small and friendly terminal FFmpeg helper that simplifies common tasks"
url="https://projects.annimon.com/projects/effy/"
license=('MIT')
makedepends=('cargo')
depends=('ffmpeg' 'gcc-libs' 'glibc')
arch=('x86_64' 'aarch64')
options=('!debug')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/${_pkgauthor}/${pkgname}/archive/refs/tags/v${pkgver}.tar.gz")
b2sums=('2e5aed2147199b8566383fe62cea9f343f6caf85eca523806ed7e24f378e18e66e14618780629db971cf596a44722ee2a78b545fc6f031661536f99d65b88dd5')

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
