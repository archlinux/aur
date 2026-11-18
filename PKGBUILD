# Maintainer: lzsnyy <710080675@qq.com>
#
# Repack of the official overseas Linux build (Xiaomi MiMo AI). Xiaomi ships
# two separate Linux debs: the domestic client under mimocode/mimodesktop and
# the overseas one under mimocode/mimodesktopai. They differ in product name,
# install prefix, URI scheme and icon, so each gets its own package and the two
# can be installed side by side.
#
# The download page exposes only Windows and macOS; the CDN object used here is
# the one the app's resources/app-update.yml points at, and the versioned and
# versionless "latest" files are byte-identical, so pinning the version keeps
# builds reproducible. Upstream only ships x86_64 for Linux.

pkgname=mimo-desktop-intl-bin
pkgver=26.1116.161705
pkgrel=1
_srcver=26.1116.161705
_appdir='Xiaomi MiMo AI'
pkgdesc='Xiaomi MiMo AI desktop client with built-in AI assistant (official overseas Linux build)'
arch=('x86_64')
url='https://mimo-ai.xiaomimimo.com/desktop/'
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
  'mesa'
  'nss'
  'systemd-libs'
  'util-linux-libs'
  'xdg-utils'
)
optdepends=('libappindicator-gtk3: tray icon support')
makedepends=('imagemagick' 'libarchive')
install="${pkgname}.install"
conflicts=('mimo-desktop-ai')
provides=("mimo-desktop-ai=${pkgver}")
options=('!strip')
source=("${pkgname}.sh" 'envguard.c')
source_x86_64=("XiaomiMiMo-AI-${_srcver}-x64.deb::https://mimocode-cdn.xiaomimimo.com/mimocode/mimodesktopai/XiaomiMiMo-AI-${_srcver}-x64.deb")
noextract=("XiaomiMiMo-AI-${_srcver}-x64.deb")
sha256sums=(
  'e4bb67a49f84ba2fac6f8afda3a37a072c440b1c85f53526c24099a5f87949a2'  # launcher
  'f5bd330f1ba5e2f17c2a1a0cbaeff95e9b279b92a0b0b55013b1e4290b5294d4'  # envguard.c
)
sha256sums_x86_64=('86410949baf80865a92298899e8ec317ee89c9f79cd0e7dbddc9484b1106c9c5')

build() {
  # Filter oversized environment strings before Chromium spawns a child: the
  # app itself reads them in-process, exactly as the app's own child-
  # environment helper does.
  "${CC:-cc}" ${CFLAGS} -fPIC ${LDFLAGS} -shared -o "${srcdir}/envguard.so" \
    "${srcdir}/envguard.c"
}

package() {
  local _extractdir _icon _size
  _extractdir="$(mktemp -d)"

  bsdtar -C "${_extractdir}" -xf "${srcdir}/XiaomiMiMo-AI-${_srcver}-x64.deb"
  bsdtar -C "${_extractdir}" -xf "${_extractdir}/data.tar.xz"

  install -dm755 \
    "${pkgdir}/opt" \
    "${pkgdir}/usr/bin" \
    "${pkgdir}/usr/lib/${pkgname}" \
    "${pkgdir}/usr/share/applications" \
    "${pkgdir}/usr/share/icons/hicolor"

  cp -a "${_extractdir}/opt/${_appdir}" "${pkgdir}/opt/"

  # Upstream ships a single 1024x1024 PNG, but hicolor-icon-theme's index.theme
  # only lists directories up to 512x512, so a launcher asking for any of the
  # usual sizes finds nothing and falls back to a missing icon. Derive the
  # indexed sizes from the source image and keep the original as well.
  _icon="${_extractdir}/usr/share/icons/hicolor/1024x1024/apps/xiaomi-mimo-desktop-ai.png"
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
  install -Dm644 "${_extractdir}/usr/share/applications/xiaomi-mimo-ai.desktop" \
    "${pkgdir}/usr/share/applications/xiaomi-mimo-ai.desktop"
  sed -i \
    -e 's|^Exec=.*|Exec=/usr/bin/mimo-desktop-intl-bin %U|' \
    -e "s|^Icon=.*|Icon=${pkgname}|" \
    "${pkgdir}/usr/share/applications/xiaomi-mimo-ai.desktop"

  install -Dm755 "${srcdir}/envguard.so" "${pkgdir}/usr/lib/${pkgname}/envguard.so"
  install -Dm755 "${srcdir}/${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"
  chmod 0755 "${pkgdir}/opt/${_appdir}/chrome-sandbox"

  install -Dm644 "${_extractdir}/opt/${_appdir}/LICENSE.electron.txt" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.electron.txt"
  install -Dm644 "${_extractdir}/opt/${_appdir}/LICENSES.chromium.html" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSES.chromium.html"

  if [[ -f "${_extractdir}/usr/share/doc/xiaomi-mimo-desktop-ai/changelog.gz" ]]; then
    install -Dm644 "${_extractdir}/usr/share/doc/xiaomi-mimo-desktop-ai/changelog.gz" \
      "${pkgdir}/usr/share/doc/${pkgname}/changelog.gz"
  fi

  rm -rf "${_extractdir}"
}
