# Maintainer: s-k <aur at kzhrv most-common gtld>

_pkgname=bb-desktop
pkgname=${_pkgname}-bin
pkgver=0.49.0
pkgrel=1
pkgdesc='Agentic IDE for orchestrating coding agents (official AppImage)'
arch=('x86_64')
url='https://github.com/get-bb/bb'
license=('MIT')
depends=(
  'alsa-lib'
  'at-spi2-core'
  'bash'
  'cairo'
  'dbus'
  'expat'
  'gdk-pixbuf2'
  'git'
  'glib2'
  'glibc'
  'gtk3'
  'libcups'
  'libgcc'
  'libnotify'
  'libstdc++'
  'libx11'
  'libxcb'
  'libxcomposite'
  'libxdamage'
  'libxext'
  'libxfixes'
  'libxkbcommon'
  'libxrandr'
  'mesa'
  'nspr'
  'nss'
  'pango'
  'systemd-libs'
  'xdg-utils'
)
optdepends=(
  'libappindicator: system tray integration'
  'xdg-desktop-portal: desktop integration on Wayland'
)
provides=("${_pkgname}=${pkgver}")
conflicts=("${_pkgname}")
options=('!debug' '!strip')

# makepkg archives with LANG=C; bundled provider recordings have Unicode names.
export LC_CTYPE=C.UTF-8

_appimage="bb-${pkgver}-x86_64.AppImage"
source=(
  "${_appimage}::${url}/releases/download/desktop-v${pkgver}/${_appimage}"
  "${_pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/get-bb/bb/desktop-v${pkgver}/LICENSE"
)
noextract=("${_appimage}")
sha256sums=('8349ab773715624fec5082739c817d2a15809504699d34b47d3d9dfbe60fc770'
            'd10816aa30183af920bdd789a81b16847bcf3e287e1b3419dd7d85f6e3e8e7b0')

prepare() {
  chmod +x "${srcdir}/${_appimage}"
  rm -rf "${srcdir}/squashfs-root"
  "${srcdir}/${_appimage}" --appimage-extract >/dev/null

  if [[ ! -x "${srcdir}/squashfs-root/bb" ||
        ! -f "${srcdir}/squashfs-root/chrome-sandbox" ]]; then
    error 'The AppImage is missing its executable or Chromium sandbox.'
    return 1
  fi
}

package() {
  install -d "${pkgdir}/opt/${_pkgname}"
  cp -a --no-preserve=ownership "${srcdir}/squashfs-root/." \
    "${pkgdir}/opt/${_pkgname}/"
  chmod -R u=rwX,go=rX "${pkgdir}/opt/${_pkgname}"
  chmod 4755 "${pkgdir}/opt/${_pkgname}/chrome-sandbox"

  # Do not use AppRun: it prepends its bb binary to PATH and may add --no-sandbox.
  # Keep /usr/bin/bb available for Babashka or a separately installed bb CLI.
  install -Dm755 /dev/stdin "${pkgdir}/usr/bin/${_pkgname}" <<'EOF'
#!/bin/sh
exec /opt/bb-desktop/bb "$@"
EOF

  # The AppImage only supplies a 1024px icon; pixmaps avoids hicolor size limits.
  install -Dm644 "${srcdir}/squashfs-root/bb.png" \
    "${pkgdir}/usr/share/pixmaps/${_pkgname}.png"

  install -Dm644 "${srcdir}/squashfs-root/bb.desktop" \
    "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
  sed -i \
    -e "s|^Exec=.*|Exec=${_pkgname} %U|" \
    -e "s|^Icon=.*|Icon=${_pkgname}|" \
    -e '/^X-AppImage-Version=/d' \
    "${pkgdir}/usr/share/applications/${_pkgname}.desktop"

  install -Dm644 "${srcdir}/${_pkgname}-${pkgver}-LICENSE" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 "${srcdir}/squashfs-root/LICENSE.electron.txt" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.electron.txt"
  install -Dm644 "${srcdir}/squashfs-root/LICENSES.chromium.html" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSES.chromium.html"
}
