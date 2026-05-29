# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>
# Contributor: Marius Hirt <marius-hirt@web.de>

pkgname="zork++"
pkgver=0.11.2
pkgrel=2
pkgdesc="A project manager and build system for modern C++"
arch=(
  'x86_64'
)
url="https://github.com/zerodaycode/Zork"
license=(
  'MIT'
)
depends=(
  'glibc'
  'libgcc'
)
makedepends=(
  'cargo'
)
# checkdepends=(
#   'clang'
# )
_pkgsrc="${url##*/}-${pkgver}"
source=(
  "${url}/archive/refs/tags/v${pkgver}/${_pkgsrc}.tar.gz"
)
sha256sums=('dc0ded28fe7fd5c09f3059309c0f4f7e39b64010eb7742cf539670e57f7c389f')

_source() {
  export CARGO_HOME="${srcdir}/.cargo"
  export CARGO_TARGET_DIR=target
  export RUSTUP_TOOLCHAIN=stable
}

prepare() {
  _source

  cd "${srcdir}/${_pkgsrc}/${pkgname}"
  cargo fetch --locked --target host-tuple
}

build() {
  _source

  cd "${srcdir}/${_pkgsrc}/${pkgname}"
  cargo build --frozen --release --all-features
}

check() {
  _source

  cd "${srcdir}/${_pkgsrc}/${pkgname}"
  cargo test --frozen --all-features -- --skip test_clang_full_process
}

package() {
  cd "${srcdir}/${_pkgsrc}"
  install -vDm644 "CHANGELOG.md" "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
  install -vDm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"

  cd "${pkgname}"
  install -vDm755 "target/release/zork" "${pkgdir}/usr/bin/${pkgname}"
}
