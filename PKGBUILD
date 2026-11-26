# Maintainer: Pavel Olizko <contact@nolight.dev>

# Rendered every night from aur/sonora-nightly-bin/PKGBUILD in github.com/sonorahq/sonora by its
# nightly workflow, which overwrites any change made in the AUR repository.

pkgname=sonora-nightly-bin
_pkgname=sonora
pkgver=0.50.3.nightly.20261126
pkgrel=1
_commit=7502ea0e4f7ed14b3f1d2a115e265c01c457f26e
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
sha256sums=('de0fef9a603cd4ffe10be7f344f3117302b42f1ab7930a1a0867f4e742676569' 'dc0eb6611078abb6708d4b7ac71495a60ba01c799d0341ef89ac4584c313ff7b')
sha256sums_x86_64=('1e05cbacea90372af823147c1b26952a13cdd646eac7a2ff7c1df8ae2d438f73')
sha256sums_aarch64=('3626c99c94a6e2278a0252b1f817e67387095e2f6296ea418664d6117f5c49c3')

package() {
  cd "${_pkgname}-${_commit}"

  install -Dm755 "${srcdir}/${pkgname}-${pkgver}-${CARCH}" "${pkgdir}/usr/bin/${_pkgname}"
  install -Dm644 "${srcdir}/sonora-build-${pkgver}.json" "${pkgdir}/usr/lib/sonora/build.json"

  # The executable prints its own completion scripts, so they always match its commands.
  local shell
  for shell in bash zsh fish; do
    "${pkgdir}/usr/bin/${_pkgname}" completions "${shell}" > "${srcdir}/completion.${shell}"
  done
  install -Dm644 "${srcdir}/completion.bash" \
    "${pkgdir}/usr/share/bash-completion/completions/${_pkgname}"
  install -Dm644 "${srcdir}/completion.zsh" \
    "${pkgdir}/usr/share/zsh/site-functions/_${_pkgname}"
  install -Dm644 "${srcdir}/completion.fish" \
    "${pkgdir}/usr/share/fish/vendor_completions.d/${_pkgname}.fish"

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
