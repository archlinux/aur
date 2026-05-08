# Maintainer: vitaliikuzhdin <vitaliikuzhdin@gmail.com>

pkgname="fast-ssh"
pkgver=0.3.2
pkgrel=2
pkgdesc="Quickly connect to your services by navigating through your SSH config"
arch=(
  'x86_64'
)
url="https://github.com/Julien-R44/${pkgname}"
license=(
  'MIT'
)
depends=(
  'glibc'
  'libgcc'
  'openssh'
)
makedepends=(
  'cargo'
)
_pkgsrc="${url##*/}-${pkgver}"
source=(
  "${url}/archive/refs/tags/v${pkgver}/${_pkgsrc}.tar.gz"
)
sha256sums=('36f9bbd91297766cd72d40a1db6484e334022d674bb81c8dfa73c4cc2f0b6844')

_source() {
  export CARGO_HOME="${srcdir}/.cargo"
  export CARGO_TARGET_DIR=target
  export RUSTUP_TOOLCHAIN=stable
}

prepare() {
  _source

  cd "${srcdir}/${_pkgsrc}"
  cargo fetch --locked --target host-tuple
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
  install -vDm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
