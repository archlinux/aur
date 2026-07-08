# Maintainer: duanluan <duanluan@outlook.com>

pkgname=rebased-bin
_pkgname=rebased
pkgver=1.1.6
pkgrel=2
pkgdesc='Standalone JetBrains-based Git client (prebuilt binary)'
arch=('x86_64' 'aarch64')
url='https://github.com/DetachHead/rebased'
license=('Apache-2.0')
depends=('fontconfig' 'giflib' 'hicolor-icon-theme' 'libdbusmenu-glib' 'ttf-font')
optdepends=('xdg-utils: open URLs from IDE')
provides=('rebased')
conflicts=('rebased')
options=('!strip')
source_x86_64=("${_pkgname}-${pkgver}-x86_64.tar.gz::https://github.com/DetachHead/rebased/releases/download/${pkgver}/rebased.tar.gz")
source_aarch64=("${_pkgname}-${pkgver}-aarch64.tar.gz::https://github.com/DetachHead/rebased/releases/download/${pkgver}/rebased-aarch64.tar.gz")
sha256sums_x86_64=('58e3760076b2f74c452abd2548dfdf3064cf697128727021126c97026403c7a6')
sha256sums_aarch64=('8fd42cc4509ce24aa78162c54a4aafece39e9525d5f579d1be8f356733d30fad')

package() {
  local app_dir
  local install_root="${pkgdir}/opt/${_pkgname}"

  app_dir="$(find "${srcdir}" -maxdepth 1 -type d -name 'idea-IC-*' | sort | head -n1)"
  if [[ -z "${app_dir}" ]]; then
    printf 'failed to find extracted Rebased application directory\n' >&2
    return 1
  fi

  install -dm755 "${install_root}"
  cp -a "${app_dir}/." "${install_root}/"

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

  install -Dm644 "${app_dir}/bin/idea.svg" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/rebased.svg"
  install -Dm644 "${app_dir}/bin/idea.png" "${pkgdir}/usr/share/pixmaps/rebased.png"
  install -Dm644 "${app_dir}/LICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt"

  install -Dm644 /dev/stdin "${pkgdir}/usr/share/applications/rebased.desktop" <<DESKTOP
[Desktop Entry]
Type=Application
Version=1.0
Name=Rebased
Comment=Standalone Git client based on IntelliJ platform
Exec=rebased %f
Icon=rebased
Terminal=false
StartupNotify=true
StartupWMClass=jetbrains-rebased
Categories=Development;IDE;VersionControl;
Keywords=git;vcs;jetbrains;
DESKTOP
}
