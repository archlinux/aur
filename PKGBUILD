# Maintainer: Claudia Pellegrino <aur ät cpellegrino.de>

_upstream_pkgname=trane-cli
pkgname=trane
pkgver=0.19.0
pkgrel=1
pkgdesc='Automated system for learning complex skills'
arch=('x86_64')
url='https://github.com/trane-project/trane-cli'
license=('GPL3')
makedepends=('cargo')
conflicts=('trane-git')

source=(
  "${pkgname}-${pkgver}.tar.gz::https://github.com/trane-project/trane-cli/archive/v${pkgver}.tar.gz"
)

sha512sums=('a4a7124afefb9dbeac8c5f36800db9cb43f5cf0c30c41ecc652b48d05e250f58de474709554a1fdcc6451f5608f03e45509fccd08b3667612cc4d692e3e7ee21')

prepare() {
  cargo fetch \
    --manifest-path "${_upstream_pkgname}-${pkgver}/Cargo.toml" \
    --target "${CARCH}-unknown-linux-gnu"
}

build() {
  # The `parking_lot` dependency requires Rust 1.59 or newer.
  # See also upstream PR:
  # https://github.com/Amanieu/parking_lot/pull/347
  #
  # Set the following value back to `stable` once upstream has
  # released a fixed version of the `parking_lot` crate.
  # export RUSTUP_TOOLCHAIN=1.59

  export CARGO_TARGET_DIR=target
  cargo build --frozen --release --all-features \
    --manifest-path "${_upstream_pkgname}-${pkgver}/Cargo.toml"
}

package() {
  echo >&2 'Packaging the license'
  install -D -m 644 -t "${pkgdir}/usr/share/licenses/${pkgname}" \
    "${_upstream_pkgname}-${pkgver}/LICENSE"

  echo >&2 'Packaging the documentation'
  install -D -m 644 -t "${pkgdir}/usr/share/doc/${pkgname}" \
    "${_upstream_pkgname}-${pkgver}/README.md"

  echo >&2 'Packaging the executable'
  install -D -m 755 -t "${pkgdir}/usr/bin/" \
    "${srcdir}/${CARGO_TARGET_DIR}/release/${pkgname}"
}
