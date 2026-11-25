# Maintainer: robertfoster

pkgname=mandara-bin
_pkgname="${pkgname%-bin}"
_appid=org.mandara.studio
pkgver=0.38.5 # renovate: datasource=github-releases depName=theHamdiz/mandara
pkgrel=1
pkgdesc="GPU-accelerated, design-first Wayland desktop shell for MangoWM, Niri and Hyprland (binary release)"
arch=(x86_64 aarch64)
url="https://github.com/theHamdiz/mandara"
license=(GPL-3.0-or-later)
# only glibc/libgcc are DT_NEEDED; the rest are dlopen'd at runtime
depends=(
  fontconfig
  freetype2
  glibc
  hicolor-icon-theme
  libgcc
  libxkbcommon
  pam
  vulkan-icd-loader
  wayland
)
optdepends=(
  'xdg-desktop-portal: open links and follow the system appearance'
  'pipewire-pulse: sound controls, per-app volume and the visualizer'
  'noto-fonts: Arabic and fallback glyphs'
  'inter-font: the default interface font'
  'greetd: Mandara Login as your login manager'
  'accountsservice: Studio user management'
  'udisks2: the Drives panel'
  'upower: battery details'
  'power-profiles-daemon: power profiles'
  'geoclue: location for weather and prayer times'
  'networkmanager: the Network panel'
  'sound-theme-freedesktop: shell sounds'
)
provides=("${_pkgname}")
conflicts=("${_pkgname}")
backup=("etc/pam.d/${_pkgname}-lock")
options=(!strip !debug)
source_x86_64=("${url}/releases/download/v${pkgver}/${_pkgname}-${pkgver}-x86_64-linux-gnu.tar.gz")
source_aarch64=("${url}/releases/download/v${pkgver}/${_pkgname}-${pkgver}-aarch64-linux-gnu.tar.gz")
sha256sums_x86_64=('b68eb62c3b762f2758241258a2ca75682b6b6cc50de1f6392f1ec443531dc6aa')
sha256sums_aarch64=('01effe01315df593f3af994178830e35413e46b21b36bdebd0af4854dfb575a0')

package() {
  cd "${_pkgname}-${pkgver}-${CARCH}-linux-gnu"

  install -Dm755 "bin/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
  install -Dm644 "share/applications/${_appid}.desktop" \
    "${pkgdir}/usr/share/applications/${_appid}.desktop"
  install -Dm644 "share/icons/hicolor/scalable/apps/${_appid}.svg" \
    "${pkgdir}/usr/share/icons/hicolor/scalable/apps/${_appid}.svg"
  install -Dm644 "share/pam.d/${_pkgname}-lock" "${pkgdir}/etc/pam.d/${_pkgname}-lock"

  # language packs, looked up under share/mandara/locales/<version>/
  install -d "${pkgdir}/usr/share/${_pkgname}"
  cp -r --no-preserve=ownership "share/${_pkgname}/locales" "${pkgdir}/usr/share/${_pkgname}/"

  install -Dm644 -t "${pkgdir}/usr/share/doc/${pkgname}" README.md PLUGINS.md
  install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}" LICENSE.md COPYRIGHT.md
}
