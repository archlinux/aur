# Maintainer: duanluan <duanluan@outlook.com>

pkgname=rebased-zh-bin
_pkgname=rebased
pkgver=1.1.5
pkgrel=2
pkgdesc='Standalone JetBrains-based Git client with bundled Chinese language pack'
arch=('x86_64')
url='https://github.com/DetachHead/rebased'
license=('Apache-2.0')
depends=('fontconfig' 'giflib' 'hicolor-icon-theme' 'libdbusmenu-glib' 'ttf-font')
optdepends=('xdg-utils: open URLs from IDE')
provides=('rebased' 'rebased-zh')
conflicts=('rebased' 'rebased-bin')
options=('!strip')
source=(
  "${_pkgname}-${pkgver}-${CARCH}.tar.gz::https://github.com/DetachHead/rebased/releases/download/${pkgver}/rebased.tar.gz"
  "localization-zh.jar::https://raw.githubusercontent.com/duanluan/aur-packages/main/packages/rebased-zh-bin/assets/${pkgver}/localization-zh.jar"
)
sha256sums=(
  '4133a31809c8e911d219742b7b6f3317f9df647768aa32cc62b51e062b62173a'
  '0bd128f0fc74ef29343edd972151353ea9673247a4194ae8905f0df15d0c0a0c'
)

package() {
  local app_dir="${srcdir}/idea-IC-261.25134.SNAPSHOT"
  local install_root="${pkgdir}/opt/${_pkgname}"

  install -dm755 "${install_root}"
  cp -a "${app_dir}/." "${install_root}/"
  install -Dm644 "${srcdir}/localization-zh.jar" "${install_root}/plugins/localization-zh/lib/localization-zh.jar"

  install -Dm755 /dev/stdin "${pkgdir}/usr/bin/rebased" <<'SCRIPT'
#!/bin/sh
set -eu

plugin_src="/opt/rebased/plugins/localization-zh/lib/localization-zh.jar"
plugin_dst="${XDG_DATA_HOME:-${HOME}/.local/share}/detachhead/IdeaIC1.1/localization-zh.jar"

if [ -r "${plugin_src}" ]; then
  mkdir -p "$(dirname "${plugin_dst}")"
  if [ ! -f "${plugin_dst}" ] || ! cmp -s "${plugin_src}" "${plugin_dst}"; then
    cp "${plugin_src}" "${plugin_dst}"
  fi
fi

exec /opt/rebased/bin/idea "$@"
SCRIPT

  install -Dm644 "${install_root}/bin/idea.svg" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/rebased.svg"
  install -Dm644 "${install_root}/bin/idea.png" "${pkgdir}/usr/share/pixmaps/rebased.png"
  install -Dm644 "${install_root}/LICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt"
  install -Dm644 "${install_root}/NOTICE.txt" "${pkgdir}/usr/share/licenses/${pkgname}/NOTICE.txt"

  install -Dm644 /dev/stdin "${pkgdir}/usr/share/applications/rebased.desktop" <<DESKTOP
[Desktop Entry]
Type=Application
Name=Rebased
Comment=Standalone Git client based on IntelliJ platform
Exec=rebased %f
Icon=rebased
Terminal=false
StartupNotify=true
StartupWMClass=jetbrains-rebased
Categories=Development;IDE;VersionControl;
Keywords=git;vcs;jetbrains;
X-Rebased-Version=${pkgver}
DESKTOP
}
