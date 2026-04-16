# Maintainer: lijiangang <lijiangang@example.com>

pkgname=clipshare-bin
pkgver=1.4.3
pkgrel=5
pkgdesc='剪贴板同步工具，支持跨平台使用，此版本在原作者基础上增加对wayland兼容性，x11没测试，如果用不了可以用作者原版，后续更新关注原作者github地址'
arch=('x86_64')
url='https://github.com/aa2013/ClipShare'
license=('GPL-3.0-only')
depends=(
  'git'
  'curl'
  'unzip'
  'xz'
  'zip'
  'clang'
  'cmake'
  'ninja'
  'pkgconf'
  'gtk3'
  'libkeybinder3'
  'libayatana-appindicator'
  'libayatana-indicator'
  'ayatana-ido'
  'libdbusmenu-glib'
  'libdbusmenu-gtk3'
  'libxtst'
  'wayland'
  'wayland-protocols'
)
optdepends=(
  'gnome-shell-extension-appindicator: tray icon support on GNOME'
)
provides=('clipshare')
conflicts=('clipshare')
options=('!strip')

_archive="ClipShare-${pkgver}-linux-x86_64.tar.gz"
_release_tag='v1.4.3-2'
_download_url='https://github.com/JianGangLi/ClipShare'

source=("${_archive}::${_download_url}/releases/download/${_release_tag}/${_archive}")
sha256sums=('21723b398e0fc1a048c2e88890146f86fe041c62863ed05382bd3465f424adbf')

package() {
  local appdir="${srcdir}/ClipShare-${pkgver}-linux-${CARCH}"
  if [[ ! -d "${appdir}" ]]; then
    appdir="$(find "${srcdir}" -maxdepth 1 -type d -name "ClipShare-*-linux-${CARCH}" -print -quit)"
  fi
  if [[ -z "${appdir}" || ! -x "${appdir}/clipshare" ]]; then
    echo "error: extracted ClipShare binary directory not found" >&2
    return 1
  fi
  local version_file="${appdir}/data/flutter_assets/version.json"
  if [[ ! -f "${version_file}" ]] || ! grep -q "\"version\":\"${pkgver}\"" "${version_file}"; then
    echo "error: extracted ClipShare binary version does not match pkgver=${pkgver}" >&2
    return 1
  fi

  install -d "${pkgdir}/opt/clipshare"
  cp -a "${appdir}/." "${pkgdir}/opt/clipshare/"

  install -d "${pkgdir}/usr/bin"
  ln -s /opt/clipshare/clipshare "${pkgdir}/usr/bin/clipshare"

  install -Dm644 \
    "${appdir}/data/flutter_assets/assets/images/logo/logo.png" \
    "${pkgdir}/usr/share/icons/hicolor/256x256/apps/clipshare.png"

  install -d "${pkgdir}/usr/share/applications"
  cat > "${pkgdir}/usr/share/applications/clipshare.desktop" <<DESKTOP
[Desktop Entry]
Type=Application
Name=ClipShare
Comment=Cross-platform clipboard sync
Exec=clipshare
Icon=clipshare
Terminal=false
Categories=Utility;
StartupNotify=true
DESKTOP
}
