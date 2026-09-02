# Maintainer: Pavel Olizko <contact@nolight.dev>
# Contributor: Massimiliano Torromeo <mtorromeo@archlinux.org>

pkgname=sonora
pkgver=0.28.1
pkgrel=1
pkgdesc='A native music streaming client, built with Rust and GPUI'
arch=('x86_64' 'aarch64')
url='https://github.com/nolight132/sonora'
license=('GPL-3.0-or-later')
depends=('glibc' 'alsa-lib' 'dbus' 'fontconfig' 'hicolor-icon-theme' 'libxcb'
         'libxkbcommon' 'libxkbcommon-x11' 'sqlite' 'vulkan-icd-loader' 'wayland')
optdepends=('vulkan-radeon: Vulkan driver for AMD GPUs'
            'vulkan-intel: Vulkan driver for Intel GPUs'
            'nvidia-utils: Vulkan driver for NVIDIA GPUs')
makedepends=('rust')
options=('!lto')
source=("https://github.com/nolight132/sonora/archive/refs/tags/v${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('d5f40b94ea14f603b4dcafc6bde54fa47b4f1dedcf05a20f4d547757dcf4481f')

prepare() {
  cd "${pkgname}-${pkgver}"
  cargo fetch
}

build() {
  cd "${pkgname}-${pkgver}"
  RUSTFLAGS='-C link-args=-Wl,-z,shstk' cargo build --frozen --release
}

package() {
  cd "${pkgname}-${pkgver}"

  install -Dm0755 target/release/sonora "${pkgdir}/usr/bin/sonora"
  install -Dm644 assets/linux/sonora.desktop \
    "${pkgdir}/usr/share/applications/sonora.desktop"
  install -Dm644 assets/linux/sonora.svg \
    "${pkgdir}/usr/share/icons/hicolor/scalable/apps/sonora.svg"

  for icon in assets/linux/icons/hicolor/*/apps/sonora.png; do
    local size
    size=$(basename "$(dirname "$(dirname "${icon}")")")
    install -Dm644 "${icon}" \
      "${pkgdir}/usr/share/icons/hicolor/${size}/apps/sonora.png"
  done

  install -Dm644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 THIRD-PARTY.md "${pkgdir}/usr/share/licenses/${pkgname}/THIRD-PARTY.md"
  install -Dm644 assets/fonts/LICENSE.txt \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.Inter"
  install -Dm644 assets/icons/LICENSE \
    "${pkgdir}/usr/share/licenses/${pkgname}/icons/LICENSE"

  for licence in assets/icons/*/LICENSE; do
    local pack
    pack=$(basename "$(dirname "${licence}")")
    install -Dm644 "${licence}" \
      "${pkgdir}/usr/share/licenses/${pkgname}/icons/LICENSE.${pack}"
  done
}
