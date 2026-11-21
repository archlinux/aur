# Maintainer: Pavel Olizko <contact@nolight.dev>

# Rendered every night from aur/sonora-nightly-bin/PKGBUILD in github.com/sonorahq/sonora by its
# nightly workflow, which overwrites any change made in the AUR repository.

pkgname=sonora-nightly-bin
_pkgname=sonora
pkgver=0.50.3.nightly.20261121
pkgrel=1
_commit=9980bdc863312bbf47aaa24af586b0f32a8d1cec
pkgdesc='A native, familiar music streaming client (nightly build of main)'
arch=('x86_64' 'aarch64')
url='https://github.com/sonorahq/sonora'
license=('GPL-3.0-or-later')
depends=('glibc' 'alsa-lib' 'dbus' 'fontconfig' 'hicolor-icon-theme' 'libxcb'
         'libxkbcommon' 'libxkbcommon-x11' 'vulkan-icd-loader' 'wayland')
optdepends=('vulkan-radeon: Vulkan driver for AMD GPUs'
            'vulkan-intel: Vulkan driver for Intel GPUs'
            'nvidia-utils: Vulkan driver for NVIDIA GPUs'
            'pipewire-alsa: audio output through PipeWire'
            'pulseaudio-alsa: audio output through PulseAudio'
            'webkit2gtk-4.1: sign in to YouTube Music through a browser window')
provides=("${_pkgname}=${pkgver%%.nightly.*}")
conflicts=("${_pkgname}" "${_pkgname}-bin")
options=('!strip' '!debug')
source=("${_pkgname}-${_commit}.tar.gz::${url}/archive/${_commit}.tar.gz"
        "sonora-build-${pkgver}.json::${url}/releases/download/nightly-build/sonora-build.json")
source_x86_64=("${pkgname}-${pkgver}-x86_64::${url}/releases/download/nightly-build/sonora-nightly-x86_64-unknown-linux-gnu")
source_aarch64=("${pkgname}-${pkgver}-aarch64::${url}/releases/download/nightly-build/sonora-nightly-aarch64-unknown-linux-gnu")
sha256sums=('0d445731c66edacf11a154cef49411c65ab21df01f8ac7b6ff2dd407a9dcc779' 'eef057c44cb273baf3087c72383b469eb8fba97ced786a773039054e4490cfc7')
sha256sums_x86_64=('f898cac632e39fdb381d00ca8f626fea7d9114a66785a65e619147872581646f')
sha256sums_aarch64=('3162d58cfe5fedd32606f8978ae74a18dbbf3630a2b34a2d7835551c1616327a')

package() {
  cd "${_pkgname}-${_commit}"

  install -Dm755 "${srcdir}/${pkgname}-${pkgver}-${CARCH}" "${pkgdir}/usr/bin/${_pkgname}"
  install -Dm644 "${srcdir}/sonora-build-${pkgver}.json" "${pkgdir}/usr/lib/sonora/build.json"
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
