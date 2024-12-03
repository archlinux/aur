# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

pkgname="starkli"
pkgver=0.3.6
pkgrel=1
pkgdesc="A blazing fast CLI tool for Starknet powered by starknet-rs"
arch=('x86_64')
url="https://book.starkli.rs"
_url="https://github.com/xJonathanLEI/${pkgname}"
license=('Apache-2.0 OR MIT')
depends=('gcc-libs' 'glibc' 'libusb')
makedepends=('cargo')
_pkgsrc="${pkgname}-${pkgver}"
source=("${_pkgsrc}.tar.gz::${_url}/archive/refs/tags/v${pkgver}.tar.gz")
b2sums=('f35ec82318652d07302f0893f2da99ab8a3b15b909cef8f84a4290a06d5ded3601e86b35065242f9e4b83d74a40dddabfd523d3ab75fecff17f0c30b42509dc4')

prepare() {
  cd "${srcdir}/${_pkgsrc}"
  mkdir -p "completions"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "${srcdir}/${_pkgsrc}"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release --all-features

  for _sh in bash fish zsh elvish powershell; do
    ./"target/release/${pkgname}" completions "${_sh}" > "completions/${pkgname}.${_sh}"
  done
}

check() {
  cd "${srcdir}/${_pkgsrc}"
  export RUSTUP_TOOLCHAIN=stable
  cargo test --frozen --all-features
}

package() {
  cd "${srcdir}/${_pkgsrc}"
  install -vDm755 "target/release/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
  install -vDm644 "README.md"      "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -vDm644 "LICENSE-APACHE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-APACHE-2.0"
  install -vDm644 "LICENSE-MIT"    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-MIT"

  cd "completions"
  install -vDm644 "${pkgname}.bash"       "${pkgdir}/usr/share/bash-completion/completions/${pkgname}"
  install -vDm644 "${pkgname}.fish"       "${pkgdir}/usr/share/fish/vendor_completions.d/${pkgname}.fish"
  install -vDm644 "${pkgname}.zsh"        "${pkgdir}/usr/share/zsh/site-functions/_${pkgname}"
  install -vDm644 "${pkgname}.elvish"     "${pkgdir}/usr/share/elvish/completions/${pkgname}.elv"
  install -vDm644 "${pkgname}.powershell" "${pkgdir}/usr/share/powershell/Modules/${pkgname}/${pkgname}.ps1"
}
