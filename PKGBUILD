# Maintainer: Pavel Olizko <contact@nolight.dev>

# Rendered every night from aur/sonora-nightly-bin/PKGBUILD in github.com/sonorahq/sonora by its
# nightly workflow, which overwrites any change made in the AUR repository.

pkgname=sonora-nightly-bin
_pkgname=sonora
pkgver=0.50.3.nightly.20261122
pkgrel=1
_commit=8f01fd7fd59103bf0103906712955ddea392d135
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
sha256sums=('a8afeb625dd941291c95d7cccf760df23e566e5043527d5ac849bd50d0c1464b' '5038927d0ba558fb12b98964a2493b002dbdfd2583a5b6487c523dfe35036854')
sha256sums_x86_64=('69a577dbb5ada88e4ec2e981cc2b66a25c9e7d643878a2d3ca1cdb61da760929')
sha256sums_aarch64=('667c0867e996878889e480611e1b47dce2923342721dbaf8c3b144da7dda2530')

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
