# Maintainer: czyt <czytcn@gmail.com>

pkgname=open-markdown-lane-bin
pkgver=0.24.6
pkgrel=1
pkgdesc="Local-first Markdown editor with live rendering and lossless source editing"
arch=('x86_64')
url="https://github.com/AniChikage/open-markdown-lane"
license=('MIT')
depends=(
  'alsa-lib' 'at-spi2-core' 'cairo' 'dbus' 'expat' 'glib2' 'glibc'
  'gtk3' 'libcups' 'libgcc' 'libnotify' 'libsecret' 'libx11' 'libxcb'
  'libxcomposite' 'libxdamage' 'libxext' 'libxfixes' 'libxkbcommon'
  'libxrandr' 'libxss' 'libxtst' 'mesa' 'nspr' 'nss' 'pango'
  'systemd-libs' 'xdg-utils'
)
optdepends=('libayatana-appindicator: system tray icon support')
provides=('open-markdown-lane')
conflicts=('open-markdown-lane' 'open-typora')
options=('!strip' '!debug')

_deb="Open-Markdown-Lane-${pkgver}-linux-x64.deb"
source_x86_64=(
  "${_deb}::${url}/releases/download/v${pkgver}/${_deb}"
  "LICENSE::${url}/raw/v${pkgver}/LICENSE"
)
sha256sums_x86_64=('a4883ccff0aa58e4aa03a6f69d891d1e941fb6892d844d630cc1ac4b9ce51a9a'
                   '5d79448c87c049aae26920a462955ca3c67118b70f596fb907b987d7d892316e')
noextract=("${_deb}")

package() {
  local data_archive
  data_archive=$(bsdtar -tf "${srcdir}/${_deb}" | awk '/^data\.tar(\.|$)/ { print; exit }')
  [[ -n "$data_archive" ]] || return 1
  bsdtar -xOf "${srcdir}/${_deb}" "$data_archive" |
    bsdtar --no-same-owner -xf - -C "${pkgdir}" || return 1

  # The Debian package creates this link from its postinst script.
  install -d "${pkgdir}/usr/bin"
  ln -s /opt/Open-Markdown-Lane/open-markdown-lane "${pkgdir}/usr/bin/open-markdown-lane"

  install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 "${pkgdir}/opt/Open-Markdown-Lane/LICENSE.electron.txt" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.electron.txt"
  install -Dm644 "${pkgdir}/opt/Open-Markdown-Lane/LICENSES.chromium.html" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSES.chromium.html"

  # Debian packaging metadata is not used on Arch Linux.
  rm -rf "${pkgdir}/usr/share/doc"

  # Keep the Chromium sandbox working on systems without usable user namespaces.
  chmod 4755 "${pkgdir}/opt/Open-Markdown-Lane/chrome-sandbox"
}
