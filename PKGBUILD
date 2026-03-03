# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

pkgname="envio"
pkgver=0.7.0
pkgrel=1
pkgdesc="A Modern And Secure CLI Tool For Managing Environment Variables"
arch=(
  'aarch64'
  'i686'
  'x86_64'
)
url="https://envio-cli.github.io/home"
_url="https://github.com/envio-cli/${pkgname}"
license=(
  'Apache-2.0 OR MIT'
)
depends=(
  'dbus'
  'glibc'
  'gpgme'
  'libgcc'
  'libgpg-error'
)
makedepends=(
  'cargo'
)
_pkgsrc="${pkgname}-${pkgver}"
source=(
  "${_url}/archive/refs/tags/v${pkgver}/${_pkgsrc}.tar.gz"
)
sha256sums=('729a02ac8a5e129fa5129de6ee62f7e2c408502dafc25924d65d02558caa5a08')

_source() {
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_HOME="${srcdir}/.cargo"
  export CARGO_TARGET_DIR=target
}

prepare() {
  _source
  local build_timestamp="$(date --utc --date="@${SOURCE_DATE_EPOCH:-$(date +%s)}" +"%Y-%m-%d %H:%M:%S")"

  cd "${srcdir}/${_pkgsrc}"
  ENVIO_VERSION="${pkgver}" ./"scripts/replace-version.sh"
  sed -e "s/build_timestamp)/\"${build_timestamp}\")/g" \
      -i 'build/application.rs'

  # --locked
  cargo fetch --target host-tuple
}

build() {
  _source
  CFLAGS+=" -ffat-lto-objects"

  cd "${srcdir}/${_pkgsrc}"
  cargo build --frozen --release --all-features
}

# check() {
#   _source

#   cd "${srcdir}/${_pkgsrc}"
#   cargo test --frozen --all-features
# }

package() {
  cd "${srcdir}/${_pkgsrc}"
  install -vDm755 "target/release/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
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
