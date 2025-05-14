# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

pkgname="asm-processor"
pkgver=1.0.0
pkgrel=1
pkgdesc="Pre-process .c files and post-process .o files to enable embedding MIPS assembly into IDO-compiled C"
arch=('aarch64' 'x86_64')
url="https://github.com/simonlindholm/${pkgname}"
license=('Unlicense')
depends=('gcc-libs' 'glibc')
makedepends=('cargo')
_pkgsrc="${url##*/}-${pkgver}"
source=("${_pkgsrc}.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz")
b2sums=('ae023e78341875ec24f3b5e3bbaa17354480892a4ed452759507120c731e6c8811599dd046562da1194add2609dd1b1d3640f97304a31ee5f36c5affa504200b')

prepare() {
  cd "${srcdir}/${_pkgsrc}/rust"
  sed -zE \
    's%(\[\[package\]\]([^]]|\n)*name = "asm-processor"([^]]|\n)*version = )"[^"]*"%\1"'"$pkgver"'"%g' \
    -i Cargo.lock

  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "${srcdir}/${_pkgsrc}/rust"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release --all-features
}

# check() {
#   cd "${srcdir}/${_pkgsrc}/rust"
#   export RUSTUP_TOOLCHAIN=stable
#   cargo test --frozen --all-features
# }

package() {
  cd "${srcdir}/${_pkgsrc}"
  install -vDm755 "rust/target/release/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
  install -vDm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -vDm644 "LICENSE"   "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
