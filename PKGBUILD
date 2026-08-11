# Maintainer: IvanTopGaming <zjarc0@mail.ru>
# Auto-generated from packaging/aur/PKGBUILD.template by
# scripts/gen-aur-pkgbuild.sh — edit the template, not AUR directly.

pkgname=itgray-bin
pkgver=0.1.1beta1
_tagver=0.1.1-beta.1
pkgrel=1
pkgdesc="ITG Ray - VLESS/sing-box VPN client with a privileged TUN helper (prebuilt)"
arch=('x86_64')
url="https://github.com/IvanTopGaming/ITG_Ray"
license=('GPL3')
depends=('gtk3' 'nss' 'alsa-lib' 'libnotify' 'libxss')
optdepends=('polkit: privileged actions from the GUI'
            'libappindicator-gtk3: system tray icon')
provides=('itgray')
conflicts=('itgray')
install=itgray-bin.install
# Prebuilt Go/Electron binaries: stripping breaks them and there is no debug
# info to split out.
options=('!strip' '!debug' '!lto')
source=("https://github.com/IvanTopGaming/ITG_Ray/releases/download/v${_tagver}/ITGRay-${_tagver}-linux-x64.tar.gz")
sha256sums=('801fd6e23904ab15fc4956d8868f73d121668def4b6ab68c62841a710afae7f6')

package() {
  local src="${srcdir}/ITGRay-${_tagver}-linux-x64"
  local app="${pkgdir}/usr/lib/itgray"

  install -dm755 "${app}"
  cp -a "${src}/app/." "${app}/"

  # systemd execs the helper directly, and the helper resolves sing-box/xray
  # as siblings of its own executable. Hardlink them next to it: same inodes,
  # no duplicated bytes, and os.Executable() still reports the exec path.
  ln "${app}/resources/helper/itgray-helper" "${app}/itgray-helper"
  ln "${app}/resources/cores/sing-box"       "${app}/sing-box"
  ln "${app}/resources/cores/xray"           "${app}/xray"

  # Electron's setuid sandbox helper.
  chmod 4755 "${app}/chrome-sandbox"

  install -dm755 "${pkgdir}/usr/bin"
  cat > "${pkgdir}/usr/bin/itgray" <<'EOS'
#!/bin/sh
exec /usr/lib/itgray/itgray-electron "$@"
EOS
  chmod 755 "${pkgdir}/usr/bin/itgray"

  install -Dm644 "${src}/itgray-helper.service" \
    "${pkgdir}/usr/lib/systemd/system/itgray-helper.service"
  install -Dm644 "${src}/itgray.desktop" \
    "${pkgdir}/usr/share/applications/itgray.desktop"
  install -Dm644 "${src}/icon.png" \
    "${pkgdir}/usr/share/icons/hicolor/512x512/apps/itgray.png"
}
