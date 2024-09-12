# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>
# Contributor: Marius Hirt <marius-hirt@web.de>

pkgname="zork++"
pkgver=0.11.2
pkgrel=1
pkgdesc="A project manager and build system for modern C++"
arch=('any')
url='https://github.com/zerodaycode/Zork'
license=('MIT')
makedepends=('cargo')
# checkdepends=('clang')
depends=('glibc' 'gcc-libs')
_pkgsrc="Zork-${pkgver}"
source=("${_pkgsrc}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('dc0ded28fe7fd5c09f3059309c0f4f7e39b64010eb7742cf539670e57f7c389f')

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
