# Maintainer: n0yd

pkgname=overbright-bin
pkgver=0.7.1
pkgrel=1
pkgdesc='Native reimplementation of Need for Speed: Underground 2 in Rust and wgpu (requires original PC game files)'
arch=('x86_64')
url='https://github.com/j0braun/overbright'
license=('GPL-3.0-or-later')
depends=(
  'alsa-lib'
  'glibc'
  'hicolor-icon-theme'
  'libgcc'
  'libx11'
  'libxcursor'
  'libxi'
  'libxkbcommon'
  'libxkbcommon-x11'
  'systemd-libs'
  'vulkan-driver'
  'vulkan-icd-loader'
  'wayland'
)
provides=("overbright=${pkgver}")
conflicts=('overbright')
options=('!strip' '!debug')
_archive="overbright-${pkgver}-linux-${CARCH}"
source=("${url}/releases/download/v${pkgver}/${_archive}.tar.gz")
sha256sums=('da691de3b4abc055b37aba93dc77423e2482e635de5b9fdae9fbd7e58fe53bc5')

package() {
  cd "${srcdir}/${_archive}"

  # Keep the launcher and the executables it starts in the same directory.
  install -Dm755 -t "${pkgdir}/usr/lib/overbright" \
    overbright game overbright-editor overbright-studio overbright-studio-cli
  install -d "${pkgdir}/usr/bin"
  local executable
  for executable in overbright overbright-editor overbright-studio overbright-studio-cli; do
    ln -s "../lib/overbright/${executable}" "${pkgdir}/usr/bin/${executable}"
  done
  ln -s ../lib/overbright/game "${pkgdir}/usr/bin/overbright-game"

  install -Dm644 overbright.desktop "${pkgdir}/usr/share/applications/overbright.desktop"
  install -Dm644 overbright.png "${pkgdir}/usr/share/icons/hicolor/256x256/apps/overbright.png"
  install -Dm644 README.txt "${pkgdir}/usr/share/doc/overbright/README.txt"
  install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}" \
    LICENSE THIRD-PARTY-LICENSES.txt THIRD-PARTY-NOTICES.md
}
