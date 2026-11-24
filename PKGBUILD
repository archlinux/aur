# Maintainer: czyt <czytcn@gmail.com>

pkgname=zigzag-bin
pkgver=0.1.11
pkgrel=1
pkgdesc="Embroidery editor: turn SVG artwork into machine embroidery files (PES, DST, JEF, VP3 and more), adjust the stitches visually, and drive a Brother Skitch over Bluetooth"
arch=('x86_64')
url="https://github.com/simpsoka/zigzag"
license=('Apache-2.0')
# Only glibc and libgcc are linked directly. The window, OpenGL, D-Bus and
# file-dialog layers are loaded at run time, so those libraries never show up
# in `ldd` yet the editor will not start with them missing.
depends=('glibc' 'libgcc' 'dbus' 'libglvnd' 'libx11' 'libxcursor' 'libxi'
         'libxkbcommon' 'libxkbcommon-x11' 'libxrender' 'wayland')
optdepends=(
  'mesa: OpenGL rendering when no GPU driver is installed (software fallback)'
  'curl: Help > Check for Updates'
  'xdg-utils: opening the download page in a browser'
  'xdg-desktop-portal: native file dialogs, together with a portal backend for your desktop'
  'zenity: fallback file and message dialogs'
  'bluez: sending a design to a Brother Skitch over Bluetooth'
)
provides=('zigzag')
conflicts=('zigzag' 'zigzag-git')
# Upstream's release binaries keep their symbols, which makes a Rust panic
# readable, and splitting those symbols into a debug package would double the
# 40 MB the three binaries already take.
options=('!strip' '!debug')

# Upstream names the download after the machine type it was built for, which
# is what makepkg calls CARCH. Linux builds exist for x86_64 only so far, so
# arch is x86_64 alone.
_tarname="ZigZag-${pkgver}-${CARCH}-linux.tar.gz"
source_x86_64=("${_tarname}::https://github.com/simpsoka/zigzag/releases/download/v${pkgver}/${_tarname}")
sha256sums=('d1f149d732148e59075e27e1ba292bb28226d5814233d44fc6363df753481982')
sha256sums_x86_64=('68ae87a030f9d78c3851d0c1555162a6a3d300926a33ddaed3215cc8b8fee909')
# Upstream ships no Linux icon or .desktop file, so the launcher below uses the
# application icon upstream keeps for its Mac and Windows builds; the tag in
# the URL follows pkgver, so an icon can never lag behind the binaries.
source=("zigzag.svg::https://raw.githubusercontent.com/simpsoka/zigzag/v${pkgver}/packaging/macos/AppIcon.svg")

package() {
  # The archive unpacks into a single directory named after itself.
  local _dir="${srcdir}/${_tarname%.tar.gz}"

  install -Dm755 "${_dir}/zigzag" "${pkgdir}/usr/bin/zigzag"
  install -Dm755 "${_dir}/zigzag-studio" "${pkgdir}/usr/bin/zigzag-studio"
  # The MCP bridge has to sit next to the editor: --headless runs it against
  # the zigzag-studio beside its own path.
  install -Dm755 "${_dir}/zigzag-mcp" "${pkgdir}/usr/bin/zigzag-mcp"

  install -Dm644 "${_dir}/LICENSE" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 "${_dir}/NOTICE" \
    "${pkgdir}/usr/share/licenses/${pkgname}/NOTICE"
  install -Dm644 "${_dir}/THIRD-PARTY-NOTICES.md" \
    "${pkgdir}/usr/share/licenses/${pkgname}/THIRD-PARTY-NOTICES.md"
  install -Dm644 "${_dir}/README.txt" \
    "${pkgdir}/usr/share/doc/${pkgname}/README.txt"

  install -Dm644 "${srcdir}/zigzag.svg" \
    "${pkgdir}/usr/share/icons/hicolor/scalable/apps/zigzag.svg"

  install -Dm644 /dev/stdin \
    "${pkgdir}/usr/share/applications/zigzag-studio.desktop" <<'EOF'
[Desktop Entry]
Type=Application
Name=ZigZag
GenericName=Embroidery Editor
Comment=Turn SVG artwork into machine embroidery files
Exec=zigzag-studio %F
Icon=zigzag
Terminal=false
Categories=Graphics;2DGraphics;VectorGraphics;
Keywords=embroidery;svg;pes;dst;jef;vp3;stitch;
StartupNotify=true
EOF
}
