# Maintainer: Ait contributors <https://github.com/ait-app/ait>

pkgname=ait-bin
pkgver=0.1.9
pkgrel=1
pkgdesc='Local-first multi-agent manager with an Electron desktop and Rust daemon'
arch=('x86_64')
url='https://github.com/ait-app/ait'
license=('Apache-2.0')
depends=(
  'alsa-lib' 'at-spi2-core' 'bash' 'cairo' 'coreutils' 'dbus' 'expat'
  'libgcc' 'libstdc++' 'git' 'glib2' 'glibc' 'grep' 'gtk3' 'hicolor-icon-theme'
  'libcups' 'libnotify' 'libxcb' 'libxcomposite' 'libxdamage' 'libxext'
  'libxfixes' 'libxkbcommon' 'libxrandr' 'libx11' 'mesa' 'nspr' 'nss'
  'pango' 'systemd-libs' 'util-linux' 'xdg-utils'
)
optdepends=(
  'libsecret: desktop credential storage'
  'org.freedesktop.secrets: Secret Service provider for credential storage'
)
provides=("ait=${pkgver}")
conflicts=('ait')
options=('!strip' '!debug')
_appimage="Ait-${pkgver}-linux-x86_64.AppImage"
source=(
  "${_appimage}::${url}/releases/download/v${pkgver}/Ait-linux-x86_64.AppImage"
  'ait.desktop'
)
noextract=("${_appimage}")
sha256sums=(
  'e94b2a3d525b560a6634874348a70948773a29ae3f6d6462bbfca4832469289c'
  'c046b482bf9d9ba6ce161a6b242fa506798e908b5b5dfbf5e27776558e803cc0'
)

prepare() {
  chmod +x "${_appimage}"
  "./${_appimage}" --appimage-extract > /dev/null
  # The AppImage extractor can create private directories under the user's umask.
  chmod -R a+rX squashfs-root
}

package() {
  local app="${srcdir}/squashfs-root"
  local icon size

  install -dm755 "${pkgdir}/usr/lib/ait" "${pkgdir}/usr/bin"
  cp -a --no-preserve=ownership "${app}/." "${pkgdir}/usr/lib/ait/"
  # Use Arch's system libraries and desktop integration, keeping Electron's runtime.
  rm -r "${pkgdir}/usr/lib/ait/"{AppRun,Ait.desktop,Ait.png,.DirIcon,usr}
  # Provide Chromium's sandbox fallback when user namespaces are unavailable.
  chmod 4755 "${pkgdir}/usr/lib/ait/chrome-sandbox"
  ln -s /usr/lib/ait/Ait "${pkgdir}/usr/bin/ait"

  install -Dm644 "${srcdir}/ait.desktop" \
    "${pkgdir}/usr/share/applications/ait.desktop"
  for icon in "${app}/usr/share/icons/hicolor/"*/apps/Ait.png; do
    size="${icon%/apps/*}"
    size="${size##*/}"
    install -Dm644 "${icon}" \
      "${pkgdir}/usr/share/icons/hicolor/${size}/apps/ait.png"
  done
  install -dm755 "${pkgdir}/usr/share/licenses/${pkgname}"
  ln -s /usr/lib/ait/LICENSE.electron.txt \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.electron.txt"
  ln -s /usr/lib/ait/LICENSES.chromium.html \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSES.chromium.html"
}
