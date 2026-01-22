# shellcheck disable=SC2034,SC2154,SC2164
# Maintainer: pml68 <contact at pml68 dot dev>

pkgname=onetalker
pkgver=2026.1
pkgrel=1
pkgdesc='An Augmentative and Alternative Communication (AAC) Aid'
arch=(x86_64)
url='https://onetalker.org'
license=('GPL-3.0-only')
depends=(
  hicolor-icon-theme
  onnxruntime
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
sha256sums=(
  'bca64ac61b65694bccf25ee0cdc1e594d9a321581cfbe29c7fe77702ba4c8d0f'
  'd568614f8a667d67e59dddab079d24ca988632f739c5e98c2f539e4a1c540a24'
)

prepare() {
  cd "${pkgname}"

  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
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

  mkdir -p "${pkgdir}/usr/share/onetalker/assets"
  cp -dr assets/audio "${pkgdir}/usr/share/onetalker/assets"
  cp -dr assets/config "${pkgdir}/usr/share/onetalker/assets"
  cp -dr assets/images "${pkgdir}/usr/share/onetalker/assets"
  cp -dr assets/symbols "${pkgdir}/usr/share/onetalker/assets"
  cp -dr assets/tts "${pkgdir}/usr/share/onetalker/assets"

  cp -dr assets/linux/icons "${pkgdir}/usr/share"
}
