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
pkgver=26.1120.201429
pkgrel=1
_srcver=26.1120.201429
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
makedepends=('imagemagick' 'libarchive' 'ttf-dejavu')
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
sha256sums_x86_64=('a8648af72d192ba484b9f934363918a3013d43f1c12514bdd9c94e9fc6ae70fe')

build() {
  # Filter oversized environment strings before Chromium spawns a child: the
  # app itself reads them in-process, exactly as the app's own child-
  # environment helper does.
  "${CC:-cc}" ${CFLAGS} -fPIC ${LDFLAGS} -shared -o "${srcdir}/envguard.so" \
    "${srcdir}/envguard.c"
}

# 国际版与国内版共用同一张 logo；国际版右下角合成 INTL 角标以便区分。
_badge_icon() {
  local src="$1" dst="$2" size="$3" label="${4:-CN}" bg="${5:-#C8102E}"
  local bw pad ring pointsize tmp
  bw=$(( size * 30 / 100 )); [ "$bw" -lt 7 ] && bw=7
  pad=$(( size * 5 / 100 )); [ "$pad" -lt 1 ] && pad=1
  ring=$(( bw / 12 )); [ "$ring" -lt 1 ] && ring=1
  pointsize=$(( bw * 45 / 100 )); [ "${#label}" -ge 4 ] && pointsize=$(( bw * 27 / 100 ))
  [ "$pointsize" -lt 4 ] && pointsize=4
  tmp="$(mktemp --suffix=.png)"
  install -dm755 "$(dirname "${dst}")"
  magick -size "${bw}x${bw}" xc:none \
    -fill white -draw "circle $(( bw / 2 )),$(( bw / 2 )) $(( bw / 2 )),0" \
    -fill "${bg}" -draw "circle $(( bw / 2 )),$(( bw / 2 )) $(( bw / 2 )),${ring}" \
    -gravity center -font DejaVu-Sans-Bold -pointsize "${pointsize}" \
    -fill white -annotate +0+0 "${label}" "${tmp}" || return 1
  magick "${src}" -resize "${size}x${size}" \
    "${tmp}" -gravity southeast -geometry "+${pad}+${pad}" -composite "${dst}"
  rm -f "${tmp}"
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

  # Upstream ships a single 512x512 PNG (it used to be 1024x1024), and
  # hicolor-icon-theme's index.theme only lists directories up to 512x512, so
  # a launcher asking for any of the usual sizes finds nothing and falls back
  # to a missing icon. Derive the indexed sizes from the source image.
  _icon="${_extractdir}/usr/share/icons/hicolor/512x512/apps/xiaomi-mimo-desktop-ai.png"
  _badge_icon "${_icon}" \
    "${pkgdir}/usr/share/icons/hicolor/512x512/apps/${pkgname}.png" 512 INTL '#2C549E'
  for _size in 256 128 64 48 32 24 16; do
    _badge_icon "${_icon}" \
      "${pkgdir}/usr/share/icons/hicolor/${_size}x${_size}/apps/${pkgname}.png" \
      "${_size}" INTL '#2C549E'
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
