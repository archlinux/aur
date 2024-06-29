# Maintainer: vitaliikuzhdin <vitaliikuzhdin@gmail.com>

pkgname="starkli"
pkgver=0.3.1
pkgrel=1
pkgdesc="A blazing fast CLI tool for Starknet powered by starknet-rs"
arch=('any')
url="https://book.starkli.rs"
_url="https://github.com/xJonathanLEI/${pkgname}"
license=('Apache-2.0' 'MIT')
depends=('glibc' 'gcc-libs')
makedepends=('cargo')
_pkgsrc="${pkgname}-${pkgver}"
source=("${_pkgsrc}.tar.gz::${_url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('b666994379cd5bf7c9324d2c2cb26777d1dfa4a79ff27fd2c5eb06f04bf45137')

prepare() {
  cd "${srcdir}/${_pkgsrc}"
  [ -d "completions" ] || mkdir "completions"
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
  install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -Dm644 "LICENSE-APACHE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-APACHE-2.0"
  install -Dm644 "LICENSE-MIT" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-MIT"

  cd "completions"
  install -Dm644 "${pkgname}.bash" "${pkgdir}/usr/share/bash-completion/completions/${pkgname}"
  install -Dm644 "${pkgname}.fish" "${pkgdir}/usr/share/fish/vendor_completions.d/${pkgname}.fish"
  install -Dm644 "${pkgname}.zsh" "${pkgdir}/usr/share/zsh/site-functions/_${pkgname}"
  install -Dm644 "${pkgname}.elvish" "${pkgdir}/usr/share/elvish/completions/${pkgname}.elv"
  install -Dm644 "${pkgname}.powershell" "${pkgdir}/usr/share/powershell/Modules/${pkgname}/${pkgname}.ps1"
}
