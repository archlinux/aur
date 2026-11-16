# Maintainer: luigife80 <internet.mail at gmx dot at>
# SPDX-License-Identifier: 0BSD

pkgname=xknx-editor-bin
pkgver=0.14.1
pkgrel=1
pkgdesc='KNX project editor and device commissioning tool, prebuilt AppImage'
arch=('x86_64')
url='https://github.com/XKNX/xknx-editor'
license=('GPL-2.0-only')
depends=(
  'fuse2'
  'gcc-libs'
  'glibc'
  'hicolor-icon-theme'
  'libglvnd'
  'libx11'
  'libxcb'
  'libxcursor'
  'libxi'
  'libxinerama'
  'libxrandr'
  'libxrender'
  'which'
  'zenity'
  'zlib'
)
provides=("xknx-editor=${pkgver}")
conflicts=('xknx-editor')
options=('!strip' '!debug')
source=(
  "XKNX-Editor-${pkgver}-${CARCH}.AppImage::${url}/releases/download/"\
"xknx-editor-v${pkgver}/XKNX-Editor-${CARCH}.AppImage"
  "xknx-editor-LICENSE-${pkgver}::https://raw.githubusercontent.com/"\
"XKNX/xknx-editor/xknx-editor-v${pkgver}/LICENSE"
)
noextract=(
  "XKNX-Editor-${pkgver}-${CARCH}.AppImage"
  "xknx-editor-LICENSE-${pkgver}"
)
sha256sums=(
  '5d731947f00bbae5c577d451c95329deae53370347655204af97fa556e36ddc8'
  '8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643'
)

prepare() {
  cd "${srcdir}"
  chmod +x "XKNX-Editor-${pkgver}-${CARCH}.AppImage"
  "./XKNX-Editor-${pkgver}-${CARCH}.AppImage" --appimage-extract xknx-editor.desktop
  "./XKNX-Editor-${pkgver}-${CARCH}.AppImage" --appimage-extract xknx-editor.png
  sed -i \
    -e 's/^Exec=XKNX-Editor$/Exec=xknx-editor/' \
    -e 's/^Categories=.*/Categories=Utility;/' \
    squashfs-root/xknx-editor.desktop
}

package() {
  cd "${srcdir}"
  install -Dm755 "XKNX-Editor-${pkgver}-${CARCH}.AppImage" \
    "${pkgdir}/opt/xknx-editor/xknx-editor.AppImage"
  install -dm755 "${pkgdir}/usr/bin"
  ln -s /opt/xknx-editor/xknx-editor.AppImage "${pkgdir}/usr/bin/xknx-editor"
  install -Dm644 squashfs-root/xknx-editor.desktop "${pkgdir}/usr/share/applications/xknx-editor.desktop"
  install -Dm644 squashfs-root/xknx-editor.png \
    "${pkgdir}/usr/share/icons/hicolor/512x512/apps/xknx-editor.png"
  install -Dm644 "xknx-editor-LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
