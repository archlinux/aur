# Maintainer: sphekes <sphekes@qq.com>

pkgname=openidea-appimage
pkgver=0.1.51
pkgrel=1
pkgdesc='Open-source IntelliJ IDEA-style IDE rebuilt in Rust (AppImage)'
arch=('x86_64' 'aarch64')
url='https://github.com/l0ng-ai/openidea'
license=('Apache-2.0' 'MIT' 'LicenseRef-SCOWL')
depends=(
  'bash' 'glibc' 'gcc-libs' 'hicolor-icon-theme'
  'e2fsprogs' 'expat' 'fontconfig' 'freetype2' 'fribidi' 'gmp'
  'harfbuzz' 'libdrm' 'libglvnd' 'libgpg-error' 'libx11' 'libxcb'
  'mesa' 'wayland' 'zlib'
)
makedepends=('desktop-file-utils')
optdepends=(
  'xdg-desktop-portal: file dialogs and desktop integration'
  'xdg-utils: opening external URLs and files'
  'git: Git version control'
  'openssh: SSH remote development and Git transport'
  'noto-fonts-cjk: Chinese, Japanese and Korean text'
)
provides=("openidea=${pkgver}")
conflicts=('openidea' 'openidea-bin' 'openidea-git')
options=('!strip' '!debug')

_appid=ai.l0ng.openidea
_raw=https://raw.githubusercontent.com/l0ng-ai/openidea
case ${CARCH} in
  x86_64) _asset_arch=amd64 ;;
  aarch64) _asset_arch=aarch64 ;;
esac
_appimage=OpenIDEA_${pkgver}_${_asset_arch}.AppImage
source=(
  'openidea'
  'LICENSE'
  "openidea-${pkgver}-LICENSE::${_raw}/v${pkgver}/LICENSE"
  "openidea-${pkgver}-NOTICE::${_raw}/v${pkgver}/NOTICE"
  "openidea-${pkgver}-THIRD_PARTY_LICENSES.md::${_raw}/v${pkgver}/THIRD_PARTY_LICENSES.md"
  "openidea-${pkgver}-LICENSE-lombok::${_raw}/v${pkgver}/java/lombok/LICENSE"
  "openidea-${pkgver}-LICENSE-en_US::${_raw}/v${pkgver}/crates/ide-spell/src/dict/LICENSE-en_US"
  "openidea-${pkgver}-LICENSE-cspell-dicts::${_raw}/v${pkgver}/crates/ide-spell/src/dict/LICENSE-cspell-dicts"
  "openidea-${pkgver}-LICENSE-angular::${_raw}/v${pkgver}/src/editor/core/cm/angular/LICENSE"
)
sha256sums=('164afa76e861e7be17ec716f60e1d8a81f749cd130c3787515d6fbe07c9521a4'
            '0e6e92b1c9bb5fdf32f6073ad79ac9828462974a75e6609abf9d74512634e16a'
            'cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30'
            '682a1ac37ab5a629459e66f21e5eb9f392ea74c886e09d6f5042fc1d49194bda'
            '254733caa98e0178b36dbcbd63305061931d8d4335d58f7470c7c07ac1dfb936'
            '250b9253554760a7e003fc360d452b407f00d8993c76d96c9ff9397607be4aeb'
            '2a7e8d8ae9e8facc84818546ae2a8d83aec5e9c80a675ff789acd1c338b53b3d'
            '6245ecd81789d113a600fa0e4f5f503e6d1b4f425860f6047dc945560dfcf13c'
            '05c6130cda97e7600ca91427a41e8a065efcf82365fc0293e7de80faec494c07')
sha256sums_x86_64=('05bc012e461e59f29a31276faf4ea13e12f3795cccc1756c2cc3867d0b8c4198')
sha256sums_aarch64=('8d179c12babd61607ebcebbe4a69962521a8fc45c97023a23f741b6a96949a2a')
source_x86_64=("${url}/releases/download/v${pkgver}/OpenIDEA_${pkgver}_amd64.AppImage")
source_aarch64=("${url}/releases/download/v${pkgver}/OpenIDEA_${pkgver}_aarch64.AppImage")
noextract=("OpenIDEA_${pkgver}_amd64.AppImage" "OpenIDEA_${pkgver}_aarch64.AppImage")

prepare() {
  chmod +x "${_appimage}"
  "./${_appimage}" --appimage-extract 'usr/share/applications/*.desktop' >/dev/null
  "./${_appimage}" --appimage-extract 'usr/share/icons/hicolor/*/apps/*' >/dev/null
  cp squashfs-root/usr/share/applications/OpenIDEA.desktop "${_appid}.desktop"
  sed -i \
    -e 's/^Exec=[^[:space:]]*/Exec=openidea/' \
    -e 's/^TryExec=.*/TryExec=openidea/' \
    -e "s/^Icon=.*/Icon=${_appid}/" "${_appid}.desktop"
}

check() {
  desktop-file-validate "${_appid}.desktop"
  test -f squashfs-root/usr/share/icons/hicolor/32x32/apps/openidea.png
  test -f squashfs-root/usr/share/icons/hicolor/128x128/apps/openidea.png
  test -f squashfs-root/usr/share/icons/hicolor/256x256@2/apps/openidea.png
}

package() {
  install -Dm755 "${_appimage}" "${pkgdir}/opt/${pkgname}/openidea.AppImage"
  install -Dm755 openidea "${pkgdir}/usr/bin/openidea"
  install -Dm644 "${_appid}.desktop" "${pkgdir}/usr/share/applications/${_appid}.desktop"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-packaging"

  local icon destination doc
  for icon in squashfs-root/usr/share/icons/hicolor/*/apps/openidea.*; do
    destination=${icon#squashfs-root/}
    destination=${destination/openidea./${_appid}.}
    # The upstream @2 directory contains a 256px PNG, not a 512px PNG.
    destination=${destination/256x256@2/256x256}
    install -Dm644 "${icon}" "${pkgdir}/${destination}"
  done
  for doc in LICENSE NOTICE THIRD_PARTY_LICENSES.md LICENSE-lombok LICENSE-en_US LICENSE-cspell-dicts LICENSE-angular; do
    install -Dm644 "openidea-${pkgver}-${doc}" "${pkgdir}/usr/share/licenses/${pkgname}/${doc}"
  done
}
