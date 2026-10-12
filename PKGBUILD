# Maintainer: robertfoster

pkgname=lactea
pkgver=0.1.2 # renovate: datasource=github-releases depName=M0Rf30/lactea extractVersion=^v(?<version>.*)$
pkgrel=1
pkgdesc="MilkDrop 2 / projectM-compatible music visualizer on wgpu, with C library"
arch=(x86_64 aarch64)
url="https://github.com/M0Rf30/lactea"
license=('MIT OR Apache-2.0')
depends=(
  alsa-lib
  libgcc
  glibc
  hicolor-icon-theme
  libpipewire
  libxkbcommon
  vulkan-icd-loader
  wayland
)
makedepends=(
  cargo
  clang
  pkgconf
)
optdepends=(
  'projectm-presets-m0rf30-git: preset collection'
  'pipewire-pulse: capture of the default sink monitor ("what you hear")'
)
options=(!lto)
conflicts=("${pkgname}-bin")
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('8c442763b6d9abea51ef49bbe38381864d5fd6c8d59bbee2091e85f773db70a4')

prepare() {
  cd "${pkgname}-${pkgver}"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "${pkgname}-${pkgver}"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release -p lactea-app -p lactea-capi
}

package() {
  cd "${pkgname}-${pkgver}"
  local _rel=target/release

  install -Dm755 "${_rel}/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
  install -Dm644 "packaging/${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
  install -Dm644 "packaging/${pkgname}.svg" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/${pkgname}.svg"

  install -Dm755 "${_rel}/lib${pkgname}_capi.so" "${pkgdir}/usr/lib/lib${pkgname}_capi.so"
  install -Dm644 "crates/lactea-capi/include/${pkgname}.h" "${pkgdir}/usr/include/${pkgname}.h"
  install -Dm644 crates/lactea-capi/examples/c/*.c -t "${pkgdir}/usr/share/doc/${pkgname}/examples"

  install -Dm644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
  install -Dm644 LICENSE-MIT LICENSE-APACHE THIRD_PARTY_NOTICES.md -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
