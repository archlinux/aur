# Maintainer: Alireza Ghassemi <alireza.g@narmin.com>
pkgname=skirk-desktop-bin
_pkgname=skirk-desktop
pkgver=0.1.55
pkgrel=1
pkgdesc="Skirk desktop GUI: a Tauri 2 client that tunnels TCP streams through a Google Drive mailbox to a remote exit (prebuilt binary)"
arch=('x86_64')
url="https://github.com/ShahabSL/Skirk"
# MIT covers Skirk itself; GPL-3.0-or-later covers the bundled sing-box binary
# that Skirk renames to `skirk-tunnel` for VPN/TUN mode.
license=('MIT' 'GPL-3.0-or-later')
depends=('webkit2gtk-4.1' 'gtk3')
optdepends=(
  'libayatana-appindicator: system tray icon support'
  'sudo: needed to grant CAP_NET_ADMIN for VPN (TUN) mode'
)
provides=("${_pkgname}")
conflicts=("${_pkgname}")
options=('!strip')
source=(
  "${pkgname}-${pkgver}.zip::https://github.com/ShahabSL/Skirk/releases/download/v${pkgver}/Skirk_linux_x64_portable.zip"
  "${pkgname}-${pkgver}-32.png::https://raw.githubusercontent.com/ShahabSL/Skirk/v${pkgver}/clients/desktop/src-tauri/icons/32x32.png"
  "${pkgname}-${pkgver}-128.png::https://raw.githubusercontent.com/ShahabSL/Skirk/v${pkgver}/clients/desktop/src-tauri/icons/128x128.png"
  "${pkgname}-${pkgver}-256.png::https://raw.githubusercontent.com/ShahabSL/Skirk/v${pkgver}/clients/desktop/src-tauri/icons/128x128@2x.png"
  "${_pkgname}.desktop"
)
noextract=(
  "${pkgname}-${pkgver}-32.png"
  "${pkgname}-${pkgver}-128.png"
  "${pkgname}-${pkgver}-256.png"
)
sha256sums=(
  'a160b9205ced02c00e65608d74a65c88d81fc2dee24778a508382fb597e577ff'
  '25a2694de492c670357a9604794218db1440d026b972020bce29b149f9a36944'
  '2528ec51ac23b8dc18f18462e85292e869ee1ad3c5ced9de19bfdaf15230e6df'
  '4eb3e1147135c20fe3ef3be4b75f41a3d5dc1b2834d7f52708bc109559e8b2b2'
  'SKIP'
)

package() {
  cd "${srcdir}/Skirk"

  # Disable portable-data mode so Tauri uses XDG dirs instead of writing
  # next to the installed binary under /usr/lib.
  rm -f skirk-portable START_HERE.txt
  rm -rf portable-data

  # Main GUI binary + bundled sidecars. The upstream zip ships sidecars in two
  # locations (the Tauri runtime at clients/desktop/src-tauri/src/lib.rs:1009
  # checks both); mirror that layout.
  install -Dm755 Skirk "${pkgdir}/usr/lib/${_pkgname}/${_pkgname}"
  install -Dm755 sidecars/linux/skirk          "${pkgdir}/usr/lib/${_pkgname}/sidecars/linux/skirk"
  install -Dm755 sidecars/linux/skirk-tunnel   "${pkgdir}/usr/lib/${_pkgname}/sidecars/linux/skirk-tunnel"
  install -Dm755 resources/sidecars/linux/skirk        "${pkgdir}/usr/lib/${_pkgname}/resources/sidecars/linux/skirk"
  install -Dm755 resources/sidecars/linux/skirk-tunnel "${pkgdir}/usr/lib/${_pkgname}/resources/sidecars/linux/skirk-tunnel"

  # PATH entry. /proc/self/exe resolves through symlinks, so Tauri's
  # current_exe() still returns the /usr/lib path and finds the sidecars.
  install -d "${pkgdir}/usr/bin"
  ln -s "/usr/lib/${_pkgname}/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

  # Desktop integration.
  install -Dm644 "${srcdir}/${_pkgname}.desktop"           "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-32.png"   "${pkgdir}/usr/share/icons/hicolor/32x32/apps/${_pkgname}.png"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-128.png"  "${pkgdir}/usr/share/icons/hicolor/128x128/apps/${_pkgname}.png"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-256.png"  "${pkgdir}/usr/share/icons/hicolor/256x256/apps/${_pkgname}.png"

  # Licensing: MIT for Skirk + GPLv3 for the bundled sing-box.
  install -Dm644 LICENSE                          "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 third_party/sing-box-LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/sing-box-LICENSE.txt"

  # Docs.
  install -Dm644 DISCLAIMER.md         "${pkgdir}/usr/share/doc/${pkgname}/DISCLAIMER.md"
  install -Dm644 SECURITY.md           "${pkgdir}/usr/share/doc/${pkgname}/SECURITY.md"
  install -Dm644 third_party/NOTICE.md "${pkgdir}/usr/share/doc/${pkgname}/NOTICE.md"
}
