# Maintainer: sphekes <sphekes@qq.com>

pkgname=artcraft-launcher-appimage
pkgver=0.8.1
pkgrel=1
pkgdesc='Install, update and launch the Craft App Suite (AppImage)'
arch=('x86_64' 'aarch64')
url='https://github.com/storytold/craft-launcher'
license=(
  'MIT OR Apache-2.0'
  'CC0-1.0'
  'CC-BY-4.0'
  'OFL-1.1'
  'LicenseRef-ArtCraft-Brand'
)
depends=(
  'bash'
  'glibc'
  'gcc-libs'
  'hicolor-icon-theme'
  'libxkbcommon'
  'vulkan-icd-loader'
)
makedepends=('desktop-file-utils')
optdepends=(
  'wayland: native Wayland display support'
  'libx11: X11 and XWayland display support'
  'libxcursor: X11 cursor handling'
  'libxi: X11 input handling'
  'libxrandr: X11 display resolution handling'
  'libglvnd: GPU rendering through EGL'
  'mesa: GPU rendering through Mesa'
  'vulkan-driver: GPU rendering through Vulkan'
  'xdg-desktop-portal: desktop integration and file dialogs'
  'noto-fonts-cjk: Chinese, Japanese and Korean text'
)
provides=("artcraft-launcher=${pkgver}")
conflicts=(
  'artcraft-launcher'
  'artcraft-launcher-bin'
  'artcraft-launcher-git'
  'ai.storyteller.artcraft-launcher'
)
options=('!strip' '!debug')

_name=artcraft-launcher
_appid=ai.storyteller.artcraft-launcher
_archive=craft-launcher-${pkgver}
_appimage=${_name}-${pkgver}-linux-${CARCH}.AppImage

source=(
  'artcraft-launcher'
  "${_archive}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz"
)
sha256sums=('fb90a2e1b07057d5817e363a339fe691c99414230782f57a0c6edc94db1f6cac'
            '89895657bec69d5dfc225bfb8a7f202392b7b4dbdc7cf40421ebcb77a1a06f8a')
sha256sums_x86_64=('83cdba12e4f9be2d7556ed53aecb927e0d9b8a30fbceb36a2c8b768d65b4fd83')
sha256sums_aarch64=('7163faf4c5394843a8c77ec9e688c8cba35eab4a0aa4535f37b02dd14819dae6')
source_x86_64=(
  "${url}/releases/download/v${pkgver}/${_name}-${pkgver}-linux-x86_64.AppImage"
)
source_aarch64=(
  "${url}/releases/download/v${pkgver}/${_name}-${pkgver}-linux-aarch64.AppImage"
)
noextract=(
  "${_name}-${pkgver}-linux-x86_64.AppImage"
  "${_name}-${pkgver}-linux-aarch64.AppImage"
)

prepare() {
  chmod +x "${_appimage}"
  "./${_appimage}" --appimage-extract \
    "usr/share/applications/${_appid}.desktop" >/dev/null
  "./${_appimage}" --appimage-extract \
    "usr/share/icons/hicolor/*/apps/${_appid}.*" >/dev/null
}

check() {
  desktop-file-validate \
    "squashfs-root/usr/share/applications/${_appid}.desktop"
  test -f "squashfs-root/usr/share/icons/hicolor/256x256/apps/${_appid}.png"
  test -f "squashfs-root/usr/share/icons/hicolor/scalable/apps/${_appid}.svg"
}

package() {
  install -Dm755 "${_appimage}" \
    "${pkgdir}/opt/${pkgname}/${_name}.AppImage"
  install -Dm755 "${_name}" "${pkgdir}/usr/bin/${_name}"
  install -Dm644 "squashfs-root/usr/share/applications/${_appid}.desktop" \
    "${pkgdir}/usr/share/applications/${_appid}.desktop"

  local icon doc
  while IFS= read -r -d '' icon; do
    install -Dm644 "${icon}" "${pkgdir}/${icon#squashfs-root/}"
  done < <(find squashfs-root/usr/share/icons/hicolor -type f \
    \( -name "${_appid}.png" -o -name "${_appid}.svg" \) -print0)

  for doc in LICENSE-MIT LICENSE-APACHE NOTICE ATTRIBUTION.md; do
    install -Dm644 "${_archive}/${doc}" \
      "${pkgdir}/usr/share/licenses/${pkgname}/${doc}"
  done
  install -Dm644 "${_archive}/docs/brand/LICENSE-brand.txt" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-brand.txt"
  for doc in OFL-Archivo.txt OFL-GeistMono.txt OFL-Inter.txt; do
    install -Dm644 "${_archive}/assets/fonts/${doc}" \
      "${pkgdir}/usr/share/licenses/${pkgname}/${doc}"
  done
}
