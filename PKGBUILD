# Maintainer: Pavel Olizko <contact@nolight.dev>
# Contributor: Massimiliano Torromeo <mtorromeo@archlinux.org>

pkgname=sonora
pkgver=0.51.0
pkgrel=1
pkgdesc='A native, familiar music streaming client'
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
makedepends=('rust' 'cmake')
options=('!lto')
source=("https://github.com/sonorahq/sonora/archive/refs/tags/v${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('af7b15060010f966630666214a21a1b7004c39d8c9a9c3e02e8510425960f5fa')

prepare() {
  cd "${pkgname}-${pkgver}"
  cargo fetch
}

build() {
  cd "${pkgname}-${pkgver}"
  RUSTFLAGS='-C link-args=-Wl,-z,shstk' cargo build --frozen --release

  local shell
  for shell in bash zsh fish; do
    target/release/sonora completions "${shell}" > "completion.${shell}"
  done
}

package() {
  cd "${pkgname}-${pkgver}"

  install -Dm0755 target/release/sonora "${pkgdir}/usr/bin/sonora"
  install -Dm644 completion.bash "${pkgdir}/usr/share/bash-completion/completions/sonora"
  install -Dm644 completion.zsh "${pkgdir}/usr/share/zsh/site-functions/_sonora"
  install -Dm644 completion.fish "${pkgdir}/usr/share/fish/vendor_completions.d/sonora.fish"
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
