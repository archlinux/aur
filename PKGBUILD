# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>
# Contributor: Marius Hirt <marius-hirt@web.de>

pkgname="zork++"
pkgver=0.10.1
pkgrel=1
pkgdesc="A modern C++ project manager and build system for modern C++"
arch=('any')
url='https://github.com/zerodaycode/Zork'
license=('MIT')
depends=('glibc' 'gcc-libs')
makedepends=('cargo')
# checkdepends=('clang' 'gcc')
_pkgsrc="Zork-${pkgver}"
source=("${_pkgsrc}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('a894c1acc492dee0a359936fe992eb26e0a4317772d211327a8c2c7b2b18e547')

prepare() {
  cd "${srcdir}/${_pkgsrc}/${pkgname}"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "${srcdir}/${_pkgsrc}/${pkgname}"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release --all-features
}

check() {
  cd "${srcdir}/${_pkgsrc}/${pkgname}"
  export RUSTUP_TOOLCHAIN=stable
  # Integration tests would need clang20 and gcc, so we skip them
  # cargo test --frozen --all-features
  cargo test --release --frozen --all-features --bins
  cargo test --release --frozen --all-features --lib
  cargo test --release --frozen --all-features --doc
}

package() {
  cd "${srcdir}/${_pkgsrc}"
  install -Dm755 "${pkgname}/target/release/zork" "${pkgdir}/usr/bin/${pkgname}"
  install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -Dm644 "LICENSE"   "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
