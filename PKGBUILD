# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_name="rav1e"
pkgname="lib32-${_name}"
pkgver=0.8.1
pkgrel=2
pkgdesc="An AV1 encoder focused on speed and safety (32-bit)"
arch=(
  'x86_64'
)
url="https://github.com/xiph/${_name}"
license=(
  'BSD-2-Clause'
)
depends=(
  # "${_name}>=${pkgver}"
  'lib32-gcc-libs'
  'lib32-glibc'
)
makedepends=(
  'cargo-c'
  'lib32-rust-libs'
  'nasm'
  'rust'
)
provides=(
  "lib${_name}.so"
)
options=(
  '!lto'
)
_pkgsrc="${url##*/}-${pkgver}"
source=(
  "${url}/archive/refs/tags/v${pkgver}/${_pkgsrc}.tar.gz"
  "${_pkgsrc}-Cargo.lock::${url}/releases/download/v${pkgver}/Cargo.lock"
)
sha256sums=('06d1523955fb6ed9cf9992eace772121067cca7e8926988a1ee16492febbe01e'
            '861482385bdef579e207bb371937dd49cb9ff47d9406c40660b760fa672d0589')
b2sums=('a7b396df8f0ac3cb7f4f7f6e4bac5b9500037f3518f3ac2914088f45928a443d81b59a5f4d777f49c7877713444c4b019db5baf27063b3f1c4a7bf82595de3ec'
        '4c0e7e271f8cd96bf5d47162a0072a7ba4ddb6f40ec03fc6deddd7b3166fffcdc60ddf85829d49359a9d49fe9a3fba1ed4ef2ea8c4303475076eba9ea6ae1cc4')

_source() {
  export CARGO_HOME="${srcdir}/.cargo"
  export CARGO_TARGET_DIR=target
  export RUSTUP_TOOLCHAIN=stable
  export _rust_target="$(rustc -vV | sed -n 's/host: //p' | sed 's/x86_64/i686/')"
}

prepare() {
  _source

  cd "${srcdir}"
  cp -vf "${_pkgsrc}-Cargo.lock" "${_pkgsrc}/Cargo.lock"  

  cd "${_pkgsrc}"
  cargo fetch --locked --target "${_rust_target}"
}

# build() {
#   _source
#   local cargo_options=(
#     --target "${_rust_target}"
#     --release
#     --frozen
#     --no-default-features
#     --features asm,threading,signal_support # binaries
#   )

#   cd "${srcdir}/${_pkgsrc}"
#   cargo  build "${cargo_options[@]}"
#   cargo cbuild "${cargo_options[@]}" \
#     --prefix='/usr' \
#     --libdir='/usr/lib32'
# }

check() {
  _source
  local cargo_options=(
    --target "${_rust_target}"
    --release
    --frozen
    --offline
    --no-default-features
    --features asm,threading,signal_support # binaries
  )

  cd "${srcdir}/${_pkgsrc}"
  cargo test "${cargo_options[@]}"
}

package() {
  _source
  local cargo_options=(
    --target "${_rust_target}"
    --frozen
    --offline
    --no-default-features
    --features asm,threading,signal_support # binaries
  )

  cd "${srcdir}/${_pkgsrc}"
  cargo  install "${cargo_options[@]}" \
    --no-track \
    --path . \
    --root="${pkgdir}/usr"
  cargo cinstall "${cargo_options[@]}" \
    --prefix /usr \
    --destdir="${pkgdir}" \
    --libdir='/usr/lib32'

  install -vDm644 "LICENSE" "PATENTS" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  
  cd "${pkgdir}/usr"
  rm -rf "bin" "include"
}
