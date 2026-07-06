# shellcheck disable=SC2034,SC2154,SC2164
# Maintainer: pml68 <contact at pml68 dot dev>

pkgname=onetalker
pkgver=2026.5.1
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
sha256sums=('07e1ba105d76a99313b30df049611a6a64086748f04ac78544d11575963a768c'
            'b5e568db1798812001a8c495b8049a5bb23a9434df933548c0e6762c49f1c9b3')

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
