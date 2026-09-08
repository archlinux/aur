# Maintainer: WooParadog <guohaochuan@gmail.com>
pkgname=moeka-bin
pkgver=0.1.13
pkgrel=2
pkgdesc='Local-first Markdown editor (prebuilt binaries)'
arch=('x86_64' 'aarch64')
url='https://moeka.app'
license=('GPL-3.0-or-later')
depends=(
  # Font discovery reads the system fontconfig configuration.
  'fontconfig'
  # These libraries are linked directly, including when using Wayland.
  'glibc'
  'libxcb'
  'libxkbcommon'
  'libxkbcommon-x11'
  # Both display backends use Vulkan for rendering.
  'vulkan-icd-loader'
  'vulkan-driver'
)
optdepends=(
  'noto-fonts-cjk: Chinese, Japanese and Korean text support'
  'wayland: native Wayland display support'
  'wl-clipboard: clipboard integration on Wayland'
  'xclip: clipboard integration on X11'
  'xdg-desktop-portal: file dialogs (requires a backend for your desktop)'
  'xdg-utils: open links in the default browser'
)
provides=("moeka=${pkgver}")
conflicts=('moeka')
options=('!strip' '!debug')

_release_url="https://github.com/MoekaProject/community/releases/download/v${pkgver}"
source=('moeka-x11')
source_x86_64=("moeka-${pkgver}-linux-x86_64.zip::${_release_url}/Moeka-linux-x86_64.zip")
source_aarch64=("moeka-${pkgver}-linux-arm64.zip::${_release_url}/Moeka-linux-arm64.zip")
sha256sums=('3fec93661f8950fc745b5ad87ff00d119e7b82693af13e4ec9825072622dc513')
sha256sums_x86_64=('2cfcffdb7a1ae7c5bd0a11e8556fc4c7bb95162e7f1de6d89c8fdfc78aa1acdd')
sha256sums_aarch64=('129c471b828bb59262a45e0625da8aea024579eaa787690db385181c96221a5a')

package() {
  local _upstream_arch="${CARCH}"
  if [[ ${CARCH} == aarch64 ]]; then
    _upstream_arch=arm64
  fi
  local _dist="${srcdir}/Moeka-linux-${_upstream_arch}"

  # Use Arch's runtime libraries instead of upstream's bundled copies.
  install -Dm755 "${_dist}/Moeka" "${pkgdir}/usr/bin/moeka"
  install -Dm755 "${srcdir}/moeka-x11" "${pkgdir}/usr/bin/moeka-x11"
  install -Dm644 "${_dist}/app.moeka.moeka.desktop" \
    "${pkgdir}/usr/share/applications/app.moeka.moeka.desktop"
  install -Dm644 "${_dist}/app.moeka.moeka.png" \
    "${pkgdir}/usr/share/icons/hicolor/256x256/apps/app.moeka.moeka.png"
  install -Dm644 "${_dist}/LICENSE" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 "${_dist}/THIRD_PARTY_NOTICES.md" \
    "${pkgdir}/usr/share/licenses/${pkgname}/THIRD_PARTY_NOTICES.md"
}
