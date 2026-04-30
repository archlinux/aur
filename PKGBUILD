# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

pkgname="cwdemangle"
pkgver=1.0.0
pkgrel=2
pkgdesc="CodeWarrior C++ symbol demangler"
arch=(
  'aarch64'
  'armv7h'
  'x86_64'
)
url="https://github.com/encounter/${pkgname}"
license=(
  'MIT OR Apache-2.0'
)
depends=(
  'glibc'
  'libgcc'
)
makedepends=(
  'cargo'
)
_pkgsrc="${url##*/}-${pkgver}"
source=(
  "${url}/archive/refs/tags/v${pkgver}/${_pkgsrc}.tar.gz"
  "${pkgname}-Cargo.lock"
)
b2sums=('77a05426d13f58ebc05f22aefee8c12d11b6997c0b54d26be641aeaa952f5973fde80934a3d7839463de6dbf9d093f030bf57d4f3a66ffe9f6ec0966013c0f0a'
        '50e1eacda6a68b25e6827bc3263a5c57ea25d816c7ea66315205524c7a2776cc71de8b5e8513397a2a5d036dd8825ad0ccc7ecf06702db8e189fa3e3cf7cb92d')

_source() {
  export CARGO_HOME="${srcdir}/.cargo"
  export CARGO_TARGET_DIR=target
  export RUSTUP_TOOLCHAIN=stable
}

prepare() {
  _source

  cd "${srcdir}"
  cp -v "${pkgname}-Cargo.lock" "${_pkgsrc}/Cargo.lock"

  cd "${_pkgsrc}"
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  _source

  cd "${srcdir}/${_pkgsrc}"
  cargo build --frozen --release --all-features
}

check() {
  _source

  cd "${srcdir}/${_pkgsrc}"
  cargo test --frozen --all-features
}

package() {
  cd "${srcdir}/${_pkgsrc}"
  install -vDm755 "target/release/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
  install -vDm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -vDm644 "LICENSE-MIT" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-MIT"
  install -vDm644 "LICENSE-APACHE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-APACHE"
}
