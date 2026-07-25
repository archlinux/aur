# shellcheck disable=SC2034,SC2154,SC2164
# Maintainer: pml68 <contact at pml68 dot dev>

pkgname=onetalker
pkgver=2026.7
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
install="onetalker.install"
source=(
  "$pkgname::https://codeberg.org/OneTalker/OneTalker/archive/v${pkgver}.tar.gz"
  "onetalker.sh"
)
sha256sums=('f8026cb442bda73a3bb5eafa80964a63329e2d0ffd4500ccf20c6600d630a2e7'
            '01e25123d26a68289424b1a5640c5d220f1aed8d94c41392f1a2610cac4011f5')

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
  cargo build --frozen --release --no-default-features
}

package() {
  cd "${pkgname}"

  install -Dm755 "target/release/${pkgname}" "${pkgdir}/usr/lib/${pkgname}/${pkgname}"
  install -Dm755 ../onetalker.sh "${pkgdir}/usr/bin/${pkgname}"

  install -Dm644 LICENSE.GPL-3.0-only "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 "assets/linux/org.onetalker.${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
  install -Dm644 "assets/linux/org.onetalker.${pkgname}.appdata.xml" -t "${pkgdir}/usr/share/metainfo"

  mkdir -p "${pkgdir}/usr/share/onetalker/assets"
  cp -dr assets/audio "${pkgdir}/usr/share/onetalker/assets"
  cp -dr assets/config "${pkgdir}/usr/share/onetalker/assets"
  cp -dr assets/images "${pkgdir}/usr/share/onetalker/assets"
  cp -dr assets/symbols "${pkgdir}/usr/share/onetalker/assets"
  cp -dr assets/tts "${pkgdir}/usr/share/onetalker/assets"

  cp -dr assets/linux/icons "${pkgdir}/usr/share"
}
