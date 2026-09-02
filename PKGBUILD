# Maintainer: Pavel Olizko <contact@nolight.dev>

pkgname=sonora-bin
_pkgname=sonora
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
provides=("${_pkgname}=${pkgver}")
conflicts=("${_pkgname}")
options=('!strip' '!debug')
source=("${url}/archive/refs/tags/v${pkgver}/${_pkgname}-${pkgver}.tar.gz")
source_x86_64=("${_pkgname}-${pkgver}-x86_64::${url}/releases/download/v${pkgver}/sonora-v${pkgver}-x86_64-unknown-linux-gnu")
source_aarch64=("${_pkgname}-${pkgver}-aarch64::${url}/releases/download/v${pkgver}/sonora-v${pkgver}-aarch64-unknown-linux-gnu")
sha256sums=('d5f40b94ea14f603b4dcafc6bde54fa47b4f1dedcf05a20f4d547757dcf4481f')
sha256sums_x86_64=('e1589a44200a171f5fcc0e739105e251f806bf11ea5c5edb32ae3e83a51c0aa5')
sha256sums_aarch64=('eeef907d7db7ccc5b14d94e5c6412cac22ad84732df7bb9ea8861ad31836d339')

package() {
  cd "${_pkgname}-${pkgver}"

  install -Dm755 "${srcdir}/${_pkgname}-${pkgver}-${CARCH}" "${pkgdir}/usr/bin/${_pkgname}"
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

  install -Dm644 COPYING "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
  install -Dm644 THIRD-PARTY.md "${pkgdir}/usr/share/licenses/${_pkgname}/THIRD-PARTY.md"
  install -Dm644 assets/fonts/LICENSE.txt \
    "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE.Inter"
  install -Dm644 assets/icons/LICENSE \
    "${pkgdir}/usr/share/licenses/${_pkgname}/icons/LICENSE"

  for licence in assets/icons/*/LICENSE; do
    local pack
    pack=$(basename "$(dirname "${licence}")")
    install -Dm644 "${licence}" \
      "${pkgdir}/usr/share/licenses/${_pkgname}/icons/LICENSE.${pack}"
  done
}
