# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

pkgname="starkli"
pkgver=0.3.5
pkgrel=1
pkgdesc="A blazing fast CLI tool for Starknet powered by starknet-rs"
arch=('x86_64')
url="https://book.starkli.rs"
_url="https://github.com/xJonathanLEI/${pkgname}"
license=('Apache-2.0' 'MIT')
makedepends=('cargo')
depends=('glibc' 'gcc-libs' 'libusb')
_pkgsrc="${pkgname}-${pkgver}"
source=("${_pkgsrc}.tar.gz::${_url}/archive/refs/tags/v${pkgver}.tar.gz")
b2sums=('fe54d67f077eea3d1dd2debac97c637ce19195ee0cfe8aaa53bab0b799b26950be236bab8c6a0e5c65f9f51cbd0ee24e978cf91771313da80defb6364a0c1af5')

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
  install -Dm755 "target/release/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
  install -Dm644 "README.md"      "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -Dm644 "LICENSE-APACHE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-APACHE-2.0"
  install -Dm644 "LICENSE-MIT"    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-MIT"

  cd "completions"
  install -Dm644 "${pkgname}.bash"       "${pkgdir}/usr/share/bash-completion/completions/${pkgname}"
  install -Dm644 "${pkgname}.fish"       "${pkgdir}/usr/share/fish/vendor_completions.d/${pkgname}.fish"
  install -Dm644 "${pkgname}.zsh"        "${pkgdir}/usr/share/zsh/site-functions/_${pkgname}"
  install -Dm644 "${pkgname}.elvish"     "${pkgdir}/usr/share/elvish/completions/${pkgname}.elv"
  install -Dm644 "${pkgname}.powershell" "${pkgdir}/usr/share/powershell/Modules/${pkgname}/${pkgname}.ps1"
}
