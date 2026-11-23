# Maintainer: DawnMagnet <DawnMagnet@users.noreply.github.com>
# Upstream publishes an Arch package whose filename embeds upstream's own
# pkgrel (hearthstone-linux-gui-<ver>-<rel>-x86_64.pkg.tar.zst). That rel is
# not pkgrel here. scripts/update_package.py selects the asset from the
# release and rewrites source and sha256sums from SHA256SUMS.txt.
pkgname=hearthstone-linux-gui-bin
pkgver=0.4.1
pkgrel=1
pkgdesc='Native GTK4 Linux GUI manager for installing, logging into, and launching Hearthstone'
arch=('x86_64')
url='https://github.com/DawnMagnet/hearthstone-linux-gui'
license=('MIT')
# Direct sonames of the upstream binary, plus xdg-utils from its nfpm manifest.
# gdk-pixbuf2, gcc-libs and xz are NEEDED and are not listed in upstream .PKGINFO.
depends=('glibc' 'gcc-libs' 'gtk4' 'libadwaita' 'glib2' 'gdk-pixbuf2' 'pango' 'xz' 'xdg-utils' 'hicolor-icon-theme')
provides=('hearthstone-linux-gui')
conflicts=('hearthstone-linux-gui' 'hearthstone-linux-gui-appimage')
options=('!strip')
source=("https://github.com/DawnMagnet/hearthstone-linux-gui/releases/download/v0.4.1/hearthstone-linux-gui-0.4.1-1-x86_64.pkg.tar.zst")
sha256sums=('be31ec0b988a062481d47d33064005852ef6322516d3dcf523417539f8003543')

package() {
  shopt -s nullglob
  local archives=("${srcdir}"/hearthstone-linux-gui-*-x86_64.pkg.tar.zst)
  shopt -u nullglob
  if (( ${#archives[@]} != 1 )); then
    printf 'expected exactly one upstream package archive\n' >&2
    return 1
  fi
  # The archive's paths (usr/bin/hearthstone-linux-gui, the desktop file, icons
  # and metainfo) are the ones the AppImage variant also installs.
  bsdtar -xf "${archives[0]}" -C "${pkgdir}"
  rm -f "${pkgdir}/.PKGINFO" "${pkgdir}/.MTREE" "${pkgdir}/.BUILDINFO" "${pkgdir}/.INSTALL"
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
