# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

pkgname="envio"
pkgver=0.8.0
pkgrel=1
pkgdesc="A Modern And Secure CLI Tool For Managing Environment Variables"
arch=(
  'aarch64'
  'i686'
  'x86_64'
)
url="https://github.com/envio-cli/${pkgname}"
license=(
  'Apache-2.0 OR MIT'
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
sha256sums=('694e68d3434c951f17d778315eb8ed3de9d4934ae834d7368bd700751a385620')

_source() {
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_HOME="${srcdir}/.cargo"
  export CARGO_TARGET_DIR=target
}

prepare() {
  _source

  cd "${srcdir}/${_pkgsrc}"
  cargo fetch --locked --target host-tuple
}

build() {
  _source
  CFLAGS+=" -ffat-lto-objects"

  cd "${srcdir}/${_pkgsrc}"
  cargo build --frozen --release --all-features
}

check() {
  _source

  cd "${srcdir}/${_pkgsrc}"
  cargo test --frozen --all-features
}

package() {
  _source

  cd "${srcdir}/${_pkgsrc}"
  install -vDm755 "${CARGO_TARGET_DIR}/release/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
  install -vDm644 "README.md"        "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -vDm644 "LICENSE-APACHE"   "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-APACHE-2.0"
  install -vDm644 "LICENSE-MIT"      "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-MIT"
  install -vDm644 "man/${pkgname}.1" "${pkgdir}/usr/share/man/man1/${pkgname}.1"

  cd "completions"
  install -vDm644 "${pkgname}.bash" "${pkgdir}/usr/share/bash-completion/completions/${pkgname}"
  install -vDm644 "${pkgname}.fish" "${pkgdir}/usr/share/fish/vendor_completions.d/${pkgname}.fish"
  install -vDm644 "_${pkgname}.ps1" "${pkgdir}/usr/share/powershell/Completions/${pkgname}.ps1"
  install -vDm644 "_${pkgname}"     "${pkgdir}/usr/share/zsh/site-functions/_${pkgname}"
}
