# Maintainer: czyt <czytcn@gmail.com>

pkgname=teahouse-bin
pkgver=0.60.2
pkgrel=1
pkgdesc='LAN-only instant messaging and file transfer tool (茶话间)'
arch=('x86_64' 'aarch64')
url='https://github.com/skyjt/teahouse'
license=('GPL-3.0-only')
depends=('alsa-lib' 'at-spi2-core' 'cairo' 'dbus' 'expat' 'gcc-libs'
         'glib2' 'glibc' 'gtk3' 'libcups' 'libdrm' 'libnotify' 'libx11'
         'libxcb' 'libxcomposite' 'libxdamage' 'libxext' 'libxfixes'
         'libxkbcommon' 'libxrandr' 'libxss' 'libxtst' 'mesa' 'nspr'
         'nss' 'pango' 'util-linux-libs' 'xdg-utils')
optdepends=('libappindicator-gtk3: system tray integration')
provides=("teahouse=${pkgver}")
conflicts=('teahouse')
options=('!strip' '!debug')

_deb_x86_64="Teahouse-${pkgver}-linux-amd64.deb"
_deb_aarch64="Teahouse-${pkgver}-linux-arm64.deb"
source_x86_64=("${url}/releases/download/v${pkgver}/${_deb_x86_64}")
source_aarch64=("${url}/releases/download/v${pkgver}/${_deb_aarch64}")
noextract=("${_deb_x86_64}" "${_deb_aarch64}")
sha256sums_x86_64=('7ca19eabf53225f3e15dd518a0d005686243de7b001dc136b96b110175047241')
sha256sums_aarch64=('612f31d46bd9f08a9e4a0332a9fc716fa2a44ce8fae590228d4a42052cbe8602')

package() {
  local deb_var="_deb_${CARCH}"
  local deb="${srcdir}/${!deb_var}"
  local data_archive
  data_archive=$(bsdtar -tf "$deb" | sed -n '/^data\.tar\($\|\.\)/p')
  [[ -n "$data_archive" && "$data_archive" != *$'\n'* ]] || return 1
  bsdtar -xOf "$deb" "$data_archive" |
    bsdtar --no-same-owner -xf - -C "$pkgdir"

  # electron-builder also bundled node-gyp's build-time Python interpreter.
  rm -rf "${pkgdir}/opt/Teahouse/resources/app.asar.unpacked/node_modules/better-sqlite3/build/node_gyp_bins"

  # Upstream still calls its executable pantry; expose the current product name.
  install -dm755 "${pkgdir}/usr/bin"
  ln -s /opt/Teahouse/pantry "${pkgdir}/usr/bin/teahouse"
  mv "${pkgdir}/usr/share/applications/"{pantry,teahouse}.desktop
  sed -i -e 's|^Exec=.*|Exec=teahouse %U|' -e 's/^Icon=pantry$/Icon=teahouse/' \
    "${pkgdir}/usr/share/applications/teahouse.desktop"
  local icon
  for icon in "${pkgdir}"/usr/share/icons/hicolor/*/apps/pantry.png; do
    mv "$icon" "${icon%pantry.png}teahouse.png"
  done
  mv "${pkgdir}/usr/share/doc/pantry" "${pkgdir}/usr/share/doc/${pkgname}"

  # Match the upstream postinst sandbox setup without Debian maintainer scripts.
  chmod 4755 "${pkgdir}/opt/Teahouse/chrome-sandbox"
  install -Dm644 "${pkgdir}/opt/Teahouse/LICENSE.electron.txt" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.electron.txt"
  ln -s /opt/Teahouse/LICENSES.chromium.html \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSES.chromium.html"
}
