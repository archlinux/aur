# Maintainer: Pavel Olizko <contact@nolight.dev>

# Rendered every night from aur/sonora-nightly-bin/PKGBUILD in github.com/sonorahq/sonora by its
# nightly workflow, which overwrites any change made in the AUR repository.

pkgname=sonora-nightly-bin
_pkgname=sonora
pkgver=0.48.1.nightly.20261108
pkgrel=1
_commit=3f931bb30c048190b0c9f6ca60c846353b04d593
pkgdesc='A native, familiar music streaming client (nightly build of main)'
arch=('x86_64' 'aarch64')
url='https://github.com/sonorahq/sonora'
license=('GPL-3.0-or-later')
depends=('glibc' 'alsa-lib' 'dbus' 'fontconfig' 'hicolor-icon-theme' 'libxcb'
         'libxkbcommon' 'libxkbcommon-x11' 'sqlite' 'vulkan-icd-loader' 'wayland')
optdepends=('vulkan-radeon: Vulkan driver for AMD GPUs'
            'vulkan-intel: Vulkan driver for Intel GPUs'
            'nvidia-utils: Vulkan driver for NVIDIA GPUs'
            'pipewire-alsa: audio output through PipeWire'
            'pulseaudio-alsa: audio output through PulseAudio'
            'webkit2gtk-4.1: sign in to YouTube Music through a browser window')
provides=("${_pkgname}=${pkgver%%.nightly.*}")
conflicts=("${_pkgname}" "${_pkgname}-bin")
options=('!strip' '!debug')
source=("${_pkgname}-${_commit}.tar.gz::${url}/archive/${_commit}.tar.gz")
source_x86_64=("${pkgname}-${pkgver}-x86_64::${url}/releases/download/nightly/sonora-nightly-x86_64-unknown-linux-gnu")
source_aarch64=("${pkgname}-${pkgver}-aarch64::${url}/releases/download/nightly/sonora-nightly-aarch64-unknown-linux-gnu")
sha256sums=('d40bba401ab7a38b022969be0d6ac14127b4845d5b434369748ad22bcc47e7ea')
sha256sums_x86_64=('9e491d5660ced46ff8bd1c784a389f26946d5fa06de0a6919d4eb02e348a6f11')
sha256sums_aarch64=('56372560df62b875a606237729b1739d5436aec57cacdb656d0ee50e347a7a40')

package() {
  cd "${_pkgname}-${_commit}"

  install -Dm755 "${srcdir}/${pkgname}-${pkgver}-${CARCH}" "${pkgdir}/usr/bin/${_pkgname}"
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
