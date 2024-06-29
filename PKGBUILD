# Maintainer: vitaliikuzhdin <vitaliikuzhdin@gmail.com>

pkgname="envio"
pkgver=0.5.1
pkgrel=1
pkgdesc="A Modern And Secure CLI Tool For Managing Environment Variables"
arch=('any')
url="https://envio-cli.github.io/home"
_url="https://github.com/envio-cli/${pkgname}"
license=('Apache-2.0' 'MIT')
depends=('glibc' 'gcc-libs' 'gpgme' 'libgpg-error')
makedepends=('cargo')
_pkgsrc="${pkgname}-${pkgver}"
source=("${_pkgsrc}.tar.gz::${_url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('d0009a19dc081d3e7e1b36e8e9fdc29f675d8ac80ddd08565777e6b7d7a99bb1')

prepare() {
  cd "${srcdir}/${_pkgsrc}"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "${srcdir}/${_pkgsrc}"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release --all-features
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
}
