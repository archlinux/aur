# Maintainer: lzsnyy <710080675@qq.com>
#
# Repack of the official Linux build published on the MiMo CDN. The download
# page currently exposes only Windows and macOS, and the CDN object used here
# is the one the app's resources/app-update.yml points at; the versioned file
# and the versionless "latest" file are byte-identical (same ETag), so pinning
# the version keeps builds reproducible. Upstream only ships x86_64 for Linux.

pkgname=mimo-desktop-bin
# Full version from the deb control archive ("26.1105.50703-202"): the Debian
# revision is part of the upstream release, so keep it (Arch spells "-" as "_").
pkgver=26.1105.50703_202
pkgrel=1
# CDN file names omit the Debian revision.
_srcver=26.1105.50703
_appdir='Xiaomi MiMo'
pkgdesc='Xiaomi MiMo desktop client with built-in AI assistant (official Linux build)'
arch=('x86_64')
url='https://mimo.xiaomimimo.com/desktop/'
license=('LicenseRef-Proprietary')
depends=(
  'alsa-lib'
  'at-spi2-core'
  'gtk3'
  'hicolor-icon-theme'
  'libnotify'
  'libsecret'
  'libxss'
  'libxtst'
  'nss'
  'systemd-libs'
  'util-linux-libs'
  'xdg-utils'
)
optdepends=('libappindicator-gtk3: tray icon support')
makedepends=('imagemagick' 'libarchive')
install="${pkgname}.install"
conflicts=('mimo-desktop')
provides=("mimo-desktop=${pkgver}")
options=('!strip')
source_x86_64=("XiaomiMiMo-${_srcver}-x64.deb::https://mimocode-cdn.xiaomimimo.com/mimocode/mimodesktop/XiaomiMiMo-${_srcver}-x64.deb")
noextract=("XiaomiMiMo-${_srcver}-x64.deb")
sha256sums_x86_64=('6b864de176673691d1eab4542c5ddc098f5b07f33530e30c05780affe3b60f96')

package() {
  local _extractdir _icon _size
  _extractdir="$(mktemp -d)"

  bsdtar -C "${_extractdir}" -xf "${srcdir}/XiaomiMiMo-${_srcver}-x64.deb"
  bsdtar -C "${_extractdir}" -xf "${_extractdir}/data.tar.xz"

  install -dm755 \
    "${pkgdir}/opt" \
    "${pkgdir}/usr/bin" \
    "${pkgdir}/usr/share/applications" \
    "${pkgdir}/usr/share/icons/hicolor"

  cp -a "${_extractdir}/opt/${_appdir}" "${pkgdir}/opt/"

  # Upstream ships a single 1024x1024 PNG, but hicolor-icon-theme's index.theme
  # only lists directories up to 512x512, so a launcher asking for any of the
  # usual sizes finds nothing and falls back to a missing icon. Derive the
  # indexed sizes from the source image and keep the original as well.
  _icon="${_extractdir}/usr/share/icons/hicolor/1024x1024/apps/xiaomi-mimo-desktop.png"
  install -Dm644 "${_icon}" \
    "${pkgdir}/usr/share/icons/hicolor/1024x1024/apps/${pkgname}.png"
  for _size in 512 256 128 64 48 32 24 16; do
    magick "${_icon}" -strip -resize "${_size}x${_size}" \
      "${_extractdir}/icon-${_size}.png"
    install -Dm644 "${_extractdir}/icon-${_size}.png" \
      "${pkgdir}/usr/share/icons/hicolor/${_size}x${_size}/apps/${pkgname}.png"
  done

  # Keep upstream's desktop file name: it is what the app declares as
  # "desktopName" in app.asar and what Wayland uses as the app id.
  install -Dm644 "${_extractdir}/usr/share/applications/xiaomi-mimo.desktop" \
    "${pkgdir}/usr/share/applications/xiaomi-mimo.desktop"
  sed -i \
    -e 's|^Exec=.*|Exec=/usr/bin/mimo-desktop-bin %U|' \
    -e "s|^Icon=.*|Icon=${pkgname}|" \
    "${pkgdir}/usr/share/applications/xiaomi-mimo.desktop"

  ln -s "/opt/${_appdir}/xiaomi-mimo-desktop" "${pkgdir}/usr/bin/${pkgname}"
  chmod 0755 "${pkgdir}/opt/${_appdir}/chrome-sandbox"

  install -Dm644 "${_extractdir}/opt/${_appdir}/LICENSE.electron.txt" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.electron.txt"
  install -Dm644 "${_extractdir}/opt/${_appdir}/LICENSES.chromium.html" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSES.chromium.html"

  if [[ -f "${_extractdir}/usr/share/doc/xiaomi-mimo-desktop/changelog.gz" ]]; then
    install -Dm644 "${_extractdir}/usr/share/doc/xiaomi-mimo-desktop/changelog.gz" \
      "${pkgdir}/usr/share/doc/${pkgname}/changelog.gz"
  fi

  rm -rf "${_extractdir}"
}
