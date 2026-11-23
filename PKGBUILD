# Maintainer: DawnMagnet <DawnMagnet@users.noreply.github.com>
# The AppImage asset has no pkgrel (hearthstone-linux-gui-<ver>-x86_64.AppImage).
# scripts/update_package.py takes the real asset name from the release and
# sha256sums from SHA256SUMS.txt. A pkgrel in a future filename is recorded
# as written; it is not assumed to be 1, and it is not this package's pkgrel.
pkgname=hearthstone-linux-gui-appimage
pkgver=0.4.1
pkgrel=1
pkgdesc='Native GTK4 Linux GUI manager for installing, logging into, and launching Hearthstone (AppImage)'
arch=('x86_64')
url='https://github.com/DawnMagnet/hearthstone-linux-gui'
license=('MIT')
# GTK is inside the image. The runtime looks up fusermount from fuse2.
# glibc stays on the host. xdg-utils matches the native package.
depends=('glibc' 'fuse2' 'hicolor-icon-theme' 'xdg-utils')
provides=('hearthstone-linux-gui')
conflicts=('hearthstone-linux-gui' 'hearthstone-linux-gui-bin')
options=('!strip')
source=("https://github.com/DawnMagnet/hearthstone-linux-gui/releases/download/v0.4.1/hearthstone-linux-gui-0.4.1-x86_64.AppImage")
sha256sums=('0db2b769530095ba7811888e03b10eb7581553ad31cc97ec3d495279e4cce43d')

prepare() {
  shopt -s nullglob
  local images=("${srcdir}"/hearthstone-linux-gui-*-x86_64.AppImage)
  shopt -u nullglob
  if (( ${#images[@]} != 1 )); then
    printf 'expected exactly one AppImage\n' >&2
    return 1
  fi
  chmod +x "${images[0]}"
  ( cd "${srcdir}" && "${images[0]}" --appimage-extract )
}

package() {
  shopt -s nullglob
  local images=("${srcdir}"/hearthstone-linux-gui-*-x86_64.AppImage)
  shopt -u nullglob
  if (( ${#images[@]} != 1 )); then
    printf 'expected exactly one AppImage\n' >&2
    return 1
  fi
  local root="${srcdir}/squashfs-root"
  install -Dm755 "${images[0]}" "${pkgdir}/opt/${pkgname}/${pkgname}.AppImage"
  install -dm755 "${pkgdir}/usr/bin"
  ln -s "/opt/${pkgname}/${pkgname}.AppImage" "${pkgdir}/usr/bin/hearthstone-linux-gui"
  # Same desktop, icon and metainfo paths as hearthstone-linux-gui-bin.
  install -Dm644 "${root}/usr/share/applications/io.github.hearthstone_linux_gui.desktop" \
    "${pkgdir}/usr/share/applications/io.github.hearthstone_linux_gui.desktop"
  install -Dm644 "${root}/usr/share/metainfo/io.github.hearthstone_linux_gui.metainfo.xml" \
    "${pkgdir}/usr/share/metainfo/io.github.hearthstone_linux_gui.metainfo.xml"
  install -Dm644 "${root}/usr/share/icons/hicolor/128x128/apps/io.github.hearthstone_linux_gui.png" \
    "${pkgdir}/usr/share/icons/hicolor/128x128/apps/io.github.hearthstone_linux_gui.png"
  install -Dm644 "${root}/usr/share/icons/hicolor/256x256/apps/io.github.hearthstone_linux_gui.png" \
    "${pkgdir}/usr/share/icons/hicolor/256x256/apps/io.github.hearthstone_linux_gui.png"
  install -Dm644 "${root}/usr/share/icons/hicolor/scalable/apps/io.github.hearthstone_linux_gui.svg" \
    "${pkgdir}/usr/share/icons/hicolor/scalable/apps/io.github.hearthstone_linux_gui.svg"
  install -Dm644 /dev/stdin "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE" <<'EOF'
MIT License

Copyright (c) 2025 DawnMagnet (https://github.com/DawnMagnet)

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
EOF
}
