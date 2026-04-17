# Maintainer: Fernando Canatta <fernandocanatta5@gmail.com>
# Contributor: Rafael Dominiquini <rafaeldominiquini at gmail dot com>
# Contributor: zxp19821005 <zxp19821005 at 163 dot com>

pkgname=flow-browser-bin
pkgver=0.12.0
pkgrel=1
pkgdesc='Modern tabbed web browser with Chrome extension support'
arch=('x86_64')
url='https://github.com/MultiboxLabs/flow-browser'
license=('GPL-3.0-or-later')
conflicts=('flow-browser')
provides=("flow-browser=${pkgver}")
depends=(
  'alsa-lib'
  'at-spi2-core'
  'cairo'
  'cups'
  'dbus'
  'expat'
  'gcc-libs'
  'glib2'
  'glibc'
  'gtk3'
  'libdrm'
  'libnotify'
  'libx11'
  'libxcb'
  'libxcomposite'
  'libxdamage'
  'libxext'
  'libxfixes'
  'libxkbcommon'
  'libxrandr'
  'libxss'
  'libxtst'
  'mesa'
  'nspr'
  'nss'
  'pango'
  'util-linux-libs'
  'xdg-utils'
)
options=('!strip')
source=(
  "${pkgname%-bin}-${pkgver}.deb::https://github.com/MultiboxLabs/flow-browser/releases/download/v${pkgver}/${pkgname%-bin}_${pkgver}_amd64.deb"
)
sha256sums=('4f93ac6b166b07b90804b5fa233264bc6b7d40f0b207b2862e19e544616ba119')

package() {
  cd "${srcdir}"

  bsdtar -xf data.tar.* -C "${pkgdir}"

  install -dm755 "${pkgdir}/usr/bin"
  cat > "${pkgdir}/usr/bin/${pkgname%-bin}" <<'LAUNCHER'
#!/bin/bash
set -euo pipefail

_appdir='/opt/Flow'
export ELECTRON_OZONE_PLATFORM_HINT="${ELECTRON_OZONE_PLATFORM_HINT:-auto}"

for _exe in \
  "${_appdir}/flow-browser" \
  "${_appdir}/Flow" \
  "${_appdir}/flow" \
  "${_appdir}/run.sh"
do
  if [[ -x "${_exe}" ]]; then
    exec "${_exe}" "$@"
  fi
done

printf 'flow-browser-bin: no runnable upstream executable found in %s\n' "${_appdir}" >&2
exit 1
LAUNCHER
  chmod 755 "${pkgdir}/usr/bin/${pkgname%-bin}"

  rm -f \
    "${pkgdir}/usr/share/applications/Flow.desktop" \
    "${pkgdir}/usr/share/applications/flow-browser.desktop" \
    "${pkgdir}/usr/share/applications/com.flow_browser.flow.desktop"

  install -dm755 "${pkgdir}/usr/share/applications"
  cat > "${pkgdir}/usr/share/applications/flow-browser.desktop" <<'DESKTOP'
[Desktop Entry]
Name=Flow Browser
Comment=Cleaner browsing, sharper focus
GenericName=Web Browser
Exec=flow-browser %U
Icon=flow-browser
Type=Application
StartupNotify=true
StartupWMClass=Flow
Categories=Network;WebBrowser;
MimeType=text/html;text/xml;application/xhtml+xml;application/pdf;x-scheme-handler/http;x-scheme-handler/https;
DESKTOP

  local _icon=
  for _candidate in \
    "${pkgdir}/usr/share/icons/hicolor/512x512/apps/Flow.png" \
    "${pkgdir}/usr/share/icons/hicolor/512x512/apps/flow-browser.png" \
    "${pkgdir}/usr/share/icons/hicolor/512x512/apps/com.flow_browser.flow.png" \
    "${pkgdir}/usr/share/pixmaps/Flow.png" \
    "${pkgdir}/usr/share/pixmaps/flow-browser.png" \
    "${pkgdir}/usr/share/pixmaps/com.flow_browser.flow.png"
  do
    if [[ -f "${_candidate}" ]]; then
      _icon="${_candidate}"
      break
    fi
  done

  if [[ -n "${_icon}" ]]; then
    install -Dm644 "${_icon}" "${pkgdir}/usr/share/pixmaps/flow-browser.png"
  fi
}
