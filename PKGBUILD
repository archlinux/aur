# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

pkgname="fcp"
pkgver=0.2.2
pkgrel=1
pkgdesc="A significantly faster alternative to the classic Unix cp(1) command"
arch=(
  'aarch64'
  'x86_64'
)
url="https://github.com/svetlitski/${pkgname}"
license=(
  'BSD-3-Clause'
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
)
b2sums=('51cc55f051eb62c7375f21130e398daa69692d0fa63973bef518666634e8e2592a951c9e2a98f40108c30582d2e0fa8cc6bfd1c9db7f0bc7240f36767e4dffa2')

_source() {
  export CARGO_HOME="${srcdir}/.cargo"
  export CARGO_TARGET_DIR=target
  export RUSTUP_TOOLCHAIN=nightly
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
