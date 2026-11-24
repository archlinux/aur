# Maintainer: lzsnyy <710080675@qq.com>
#
# Repack of the official ZCode Linux deb (https://zcode.z.ai).
#
# ZCode ships one build for every region: the same app.asar carries the
# built-in provider list for both Z.ai and BigModel / 智谱, and the UI lets the
# user pick either. This package keeps upstream's defaults (Z.ai first) and the
# system language. The domestic package (zcode-cn-bin) starts from the same
# official deb but defaults to BigModel and Chinese; the two can be installed
# side by side because each one owns its own /opt prefix, desktop file, icons
# and user data directory.
#
# The canonical "zcode.desktop" id is owned by the domestic package: the app
# looks for a system-level entry with that exact name and, when it is missing,
# writes ~/.local/share/applications/zcode.desktop itself, pointing at the raw
# binary with none of the wrapper environment. Keeping the name on the edition
# that needs ZCODE_* isolation prevents that. This package registers
# "zcode-intl.desktop" instead; installed alone, the app's auto-written entry
# is functionally identical to the packaged launcher (same binary, upstream
# default profile), so the only effect is an extra launcher icon.
#
# zcode:// is baked into the app and shared by both editions; whichever
# package registers last owns the handler (the domestic entry when both are
# installed).
#
# Upstream publishes x86_64 and aarch64 debs with identical naming, so every
# architecture is pinned separately below.

pkgname=zcode-intl-bin
pkgver=4.0.0_10870
pkgrel=1
pkgdesc='ZCode — agentic development environment for GLM (official Linux build, Z.ai defaults)'
arch=('x86_64' 'aarch64')
url='https://zcode.z.ai/'
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
makedepends=('libarchive' 'imagemagick' 'ttf-dejavu')
install="${pkgname}.install"
conflicts=('zcode' 'z-code-bin' 'zcode-bin' 'zcode-desktop-bin')
provides=('zcode')
options=('!strip')
source=("${pkgname}.sh")
source_x86_64=("ZCode-4.0.0-linux-x64.deb::https://cdn-zcode.z.ai/zcode/electron/releases/4.0.0/linux-x64/ZCode-4.0.0-linux-x64.deb")
source_aarch64=("ZCode-4.0.0-linux-arm64.deb::https://cdn-zcode.z.ai/zcode/electron/releases/4.0.0/linux-arm64/ZCode-4.0.0-linux-arm64.deb")
noextract=('ZCode-4.0.0-linux-x64.deb' 'ZCode-4.0.0-linux-arm64.deb')
sha256sums=('ab210858bfe149fe257d70c1fb3d9690891c0d091aa0c43faf35dd61ff1c4453')
sha256sums_x86_64=('402f0eea0e3dfa23e3176525ae08d0f4101ced64ddbbe77c88ade87c53ab256a')
sha256sums_aarch64=('961a872c505473b03649faf5f4eff8055b214dd017d5a79da532fabbca17de25')

# 国际版与国内版共用上游图标，右下角合成 INTL 角标以与国内版区分。
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
  local _extractdir _data _size _arch
  _extractdir="$(mktemp -d)"
  case "${CARCH}" in
    x86_64) _arch=x64 ;;
    aarch64) _arch=arm64 ;;
    *) echo "unsupported architecture: ${CARCH}" >&2; return 1 ;;
  esac

  bsdtar -C "${_extractdir}" -xf "${srcdir}/ZCode-4.0.0-linux-${_arch}.deb"
  _data="$(find "${_extractdir}" -maxdepth 1 -name 'data.tar.*' -print)"
  [[ -n "${_data}" ]] || { echo 'no data.tar.* in deb' >&2; return 1; }
  bsdtar -C "${_extractdir}" -xf "${_data}"

  install -dm755 \
    "${pkgdir}/opt" \
    "${pkgdir}/usr/bin" \
    "${pkgdir}/usr/share/applications" \
    "${pkgdir}/usr/share/icons/hicolor"

  # Lowercase prefix keeps the path, command and desktop file name aligned.
  # Electron bakes the X11 WM_CLASS as "zcode" and ignores --class there, so
  # StartupWMClass stays "zcode"; --class only sets the Wayland app_id.
  cp -a "${_extractdir}/opt/ZCode" "${pkgdir}/opt/zcode"

  # Upstream ships the AppArmor profile with the Debian path baked in; point
  # it at this package's prefix. The profile itself is installed by the
  # .install hook, which mirrors Debian's postinst.
  sed -i 's|/opt/ZCode|/opt/zcode|g' \
    "${pkgdir}/opt/zcode/resources/apparmor-profile"

  for _size in 16 24 32 48 64 128 256 512 1024; do
    _badge_icon "${_extractdir}/usr/share/icons/hicolor/${_size}x${_size}/apps/zcode.png" \
      "${pkgdir}/usr/share/icons/hicolor/${_size}x${_size}/apps/zcode.png" \
      "${_size}" INTL '#2C549E'
  done

  install -Dm644 "${_extractdir}/usr/share/applications/zcode.desktop" \
    "${pkgdir}/usr/share/applications/zcode-intl.desktop"
  sed -i \
    -e 's|^Exec=.*|Exec=/usr/bin/zcode %U|' \
    -e 's|^Icon=.*|Icon=zcode|' \
    -e 's|^StartupWMClass=.*|StartupWMClass=zcode|' \
    "${pkgdir}/usr/share/applications/zcode-intl.desktop"

  install -Dm755 "${srcdir}/${pkgname}.sh" "${pkgdir}/usr/bin/zcode"
  chmod 4755 "${pkgdir}/opt/zcode/chrome-sandbox"

  install -Dm644 "${pkgdir}/opt/zcode/LICENSE.electron.txt" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.electron.txt"
  install -Dm644 "${pkgdir}/opt/zcode/LICENSES.chromium.html" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSES.chromium.html"

  if [[ -f "${_extractdir}/usr/share/doc/zcode/changelog.gz" ]]; then
    install -Dm644 "${_extractdir}/usr/share/doc/zcode/changelog.gz" \
      "${pkgdir}/usr/share/doc/${pkgname}/changelog.gz"
  fi

  rm -rf "${_extractdir}"
}
