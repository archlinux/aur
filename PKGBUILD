# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

pkgname="nodtool"
pkgver=1.4.4
pkgrel=1
pkgdesc="CLI tool for reading GameCube and Wii disc images"
arch=('aarch64' 'i686' 'x86_64')
url="https://github.com/encounter/nod"
license=('MIT OR Apache-2.0')
depends=('gcc-libs' 'glibc')
makedepends=('cargo')
_pkgsrc="${url##*/}-${pkgver}"
source=("${_pkgsrc}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
b2sums=('42a2ff1722e7e9f9ad5ba22b09443a583ab4d29f8f0d78e62e2ee5b253bf03b388f17019fe2c383df3612a13cec83660743a912fc757cf141cfe7f8dbf03a9b0')

prepare() {
  cd "${srcdir}/${_pkgsrc}"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
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
  install -vDm755 "target/release/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
  install -vDm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -vDm644 "LICENSE-MIT" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-MIT"
  install -vDm644 "LICENSE-APACHE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-APACHE-2.0"
}
