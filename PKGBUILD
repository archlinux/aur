# shellcheck disable=SC2034,SC2154,SC2164
# Maintainer: pml68 <contact at pml68 dot dev>

pkgname=onetalker
pkgver=2026.3.2
pkgrel=1
pkgdesc='An Augmentative and Alternative Communication (AAC) Aid'
arch=(x86_64)
url='https://onetalker.org'
license=('GPL-3.0-only')
depends=(
  hicolor-icon-theme
  onnxruntime
  protobuf
  alsa-lib
  gcc-libs
  glibc
  bash
)
makedepends=(
  cargo
  clang
  cmake
)
options=('!lto' '!debug')
provides=("$pkgname")
conflicts=("$pkgname")
source=(
  "$pkgname::https://codeberg.org/OneTalker/OneTalker/archive/v${pkgver}.tar.gz"
  "onetalker.sh"
)
sha256sums=('de91bb736fd4ae12b951a9cac7caa8716f00bff3d3c7504ff93fde44b3ed2180'
            '4243aaabe21c117f37dea70c5d253b9f09eb2d474813174bf9883d053afe17e4')

prepare() {
  cd "${pkgname}"

  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc --print host-tuple)"
}

build() {
  cd "${pkgname}"

  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  export RUSTFLAGS="${RUSTFLAGS} --remap-path-prefix $srcdir=src"
  cargo build --frozen --release
}

package() {
  cd "${pkgname}"

  install -Dm755 "target/release/${pkgname}" "${pkgdir}/opt/${pkgname}/${pkgname}"
  install -Dm755 ../onetalker.sh "${pkgdir}/usr/bin/${pkgname}"

  install -Dm644 LICENSE.GPL-3.0-only "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 "assets/linux/org.onetalker.${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
  install -Dm644 "assets/linux/org.onetalker.${pkgname}.appdata.xml" -t "${pkgdir}/usr/share/metainfo"

  mkdir -p "${pkgdir}/opt/${pkgname}/assets"
  cp -dr assets/audio "${pkgdir}/opt/${pkgname}/assets"
  cp -dr assets/config "${pkgdir}/opt/${pkgname}/assets"
  cp -dr assets/images "${pkgdir}/opt/${pkgname}/assets"
  cp -dr assets/symbols "${pkgdir}/opt/${pkgname}/assets"
  cp -dr assets/tts "${pkgdir}/opt/${pkgname}/assets"

  cp -dr assets/linux/icons "${pkgdir}/usr/share"
}
