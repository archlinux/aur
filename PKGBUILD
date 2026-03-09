# Maintainer: txtsd <aur.archlinux@ihavea.quest>

pkgname=cpx-copy
_pkgname=${pkgname%-copy}
pkgver=0.1.4
pkgrel=1
pkgdesc='A modern, fast file copy tool for Linux with progress bars, resume capability, and more.'
arch=(x86_64)
url='https://github.com/11happy/cpx'
license=('MIT')
depends=(
  gcc-libs
  glibc
)
makedepends=(cargo)
checkdepends=(cargo)
conflicts=(cpx cpx-bin)
options=('!lto')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('f7d8b7d1926c007d358780dbf82e4ef6b0a84cb44ea3f68732f29a83e78a0495')

prepare() {
  cd "${_pkgname}-${pkgver}"

  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "${_pkgname}-${pkgver}"

  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release
}

check() {
  cd "${_pkgname}-${pkgver}"

  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo test --frozen --release
}

package() {
  cd "${_pkgname}-${pkgver}"

  install -Dm755 "target/release/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

  install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
