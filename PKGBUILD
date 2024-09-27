# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

pkgname="code2prompt"
pkgver=2.0.0
pkgrel=2
pkgdesc="A CLI tool to convert your codebase into a single LLM prompt"
arch=('x86_64')
url="https://github.com/mufeedvh/${pkgname}"
license=('MIT')
makedepends=('cargo')
depends=('gcc-libs' 'glibc' 'zlib')
_pkgsrc="${pkgname}-${pkgver}"
source=("${_pkgsrc}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('cf08be573e816ebe8852cd8afa6fd122f6b5c00c081ac058ada326647cf8251c')

prepare() {
  cd "${srcdir}/${_pkgsrc}"
  sed -i 's/default_features/default-features/g' Cargo.toml

  export RUSTUP_TOOLCHAIN=stable
  # cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
  cargo fetch --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  CFLAGS+=" -ffat-lto-objects"
  
  cd "${srcdir}/${_pkgsrc}"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release --all-features
}

check() {
  cd "${srcdir}/${_pkgsrc}"
  export RUSTUP_TOOLCHAIN=stable
  cargo test --frozen --all-features
}

package() {
  cd "${srcdir}/${_pkgsrc}"
  install -Dm755 "target/release/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
  install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -Dm644 "LICENSE"   "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
