# Maintainer: ZeroiJ
pkgname=clove-linux
pkgver=0.1.5
pkgrel=1
pkgdesc="Fast dithered-storage file manager"
arch=('x86_64')
url="https://github.com/ZeroiJ/clove-win"
license=('MIT')
depends=('gcc-libs' 'fontconfig' 'libxkbcommon' 'wayland' 'vulkan-icd-loader')
makedepends=('cargo' 'rust')
options=('!debug')

_runerev=db301c06ab0d68b70c4822a542fffc6615bbd419

source=(
  "${pkgname}-${pkgver}.tar.gz::https://github.com/ZeroiJ/clove-win/archive/refs/tags/v${pkgver}.tar.gz"
  "rune-${_runerev}.tar.gz::https://github.com/anomalyco/rune/archive/${_runerev}.tar.gz"
)
sha256sums=('SKIP' 'SKIP')

prepare() {
  cd "${srcdir}/clove-win-${pkgver}"
  mkdir -p prototypes
  tar -xf "${srcdir}/rune-${_runerev}.tar.gz" -C prototypes
  if [ ! -d prototypes/_rune-upstream ]; then
    mv prototypes/rune-${_runerev} prototypes/_rune-upstream
  fi
}

build() {
  cd "${srcdir}/clove-win-${pkgver}/clove-rs"
  cargo build --release --locked -p clove-ui
}

package() {
  cd "${srcdir}/clove-win-${pkgver}"
  install -Dm755 "clove-rs/target/release/clove" "${pkgdir}/usr/bin/clove"
  install -Dm644 "packaging/arch/clove.desktop" "${pkgdir}/usr/share/applications/clove.desktop"
  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/clove/LICENSE"
  for icon in 16 32 128 256 512; do
    install -Dm644 "Clove/Assets.xcassets/AppIcon.appiconset/icon_${icon}x${icon}.png" \
      "${pkgdir}/usr/share/icons/hicolor/${icon}x${icon}/apps/clove.png"
  done
}
