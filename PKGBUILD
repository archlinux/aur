# Maintainer: Claudia Pellegrino <aur ät cpellegrino.de>

_upstream_pkgname=trane-cli
pkgname=trane
pkgver=0.2.2
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

sha512sums=(
  '85af830c2b2ad03102a589bac127c754d690883feb3debac7f59006fac4f50a7b6786d848a896d17d4212bb7442ae9a88d4fbf5618c4e447b0c60958a72e8ee3'
)

prepare() {
  cargo fetch \
    --manifest-path "${_upstream_pkgname}-${pkgver}/Cargo.toml" \
    --target "${CARCH}-unknown-linux-gnu"
}

build() {
  export RUSTUP_TOOLCHAIN=stable
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
