# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

pkgname="envio"
pkgver=0.6.1
pkgrel=2
pkgdesc="A Modern And Secure CLI Tool For Managing Environment Variables"
arch=('x86_64' 'aarch64' 'i686')
url="https://envio-cli.github.io/home"
_url="https://github.com/envio-cli/${pkgname}"
license=('Apache-2.0' 'MIT')
depends=('gcc-libs' 'glibc' 'gpgme' 'libgpg-error')
makedepends=('cargo')
_pkgsrc="${pkgname}-${pkgver}"
source=("${_pkgsrc}.tar.gz::${_url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('24cd7c485226be7f7921a95ae4edaf3cb510c90a339c51e51423c3eb4deee6dc')

prepare() {
  cd "${srcdir}/${_pkgsrc}"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  CFLAGS+=" -ffat-lto-objects"

  cd "${srcdir}/${_pkgsrc}"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release --all-features
}

# check() {
#   cd "${srcdir}/${_pkgsrc}"
#   export RUSTUP_TOOLCHAIN=stable
#   cargo test --frozen --all-features
# }

package() {
  cd "${srcdir}/${_pkgsrc}"
  install -Dm755 "target/release/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
  install -Dm644 "README.md"        "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -Dm644 "LICENSE-APACHE"   "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-APACHE-2.0"
  install -Dm644 "LICENSE-MIT"      "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-MIT"
  install -Dm644 "man/${pkgname}.1" "${pkgdir}/usr/share/man/man1/${pkgname}.1"

  cd "completions"
  install -Dm644 "${pkgname}.bash" "${pkgdir}/usr/share/bash-completion/completions/${pkgname}"
  install -Dm644 "${pkgname}.fish" "${pkgdir}/usr/share/fish/vendor_completions.d/${pkgname}.fish"
  install -Dm644 "_${pkgname}"     "${pkgdir}/usr/share/zsh/site-functions/_${pkgname}"
  install -Dm644 "_${pkgname}.ps1" "${pkgdir}/usr/share/powershell/Completions/${pkgname}.ps1"
}
