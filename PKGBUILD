# Maintainer: lzsnyy <710080675@qq.com>
#
# Domestic BigModel edition, built from the same official ZCode Linux deb as
# zcode-zai-cn-bin (Z.ai CN) and zcode-intl-bin (Z.ai global). Upstream ships
# all three login sources in one binary and lets it choose at runtime; this
# package pins the OAuth provider list to BigModel / 智谱 only.
# UI language follows the system locale.
#
# Installs under /opt/zcode-cn with its own desktop file, icon, command and
# user data directory, so both editions can run at the same time.
#
# This package owns the canonical "zcode.desktop" id on purpose: the app looks
# for a system-level entry with that name and, when it is missing, writes its
# own ~/.local/share/applications/zcode.desktop that launches the raw binary
# with none of this package's ZCODE_* environment, which would give the
# domestic edition a second profile outside the isolated data root. The
# international package registers "zcode-intl.desktop" instead.
#
# zcode:// is baked into the app and shared by both editions; whichever
# package registers last owns the handler (this one when both are installed).
#
# conflicts also covers z-code-bin, whose /usr/share/applications/zcode.desktop
# and /usr/bin/zcode would otherwise clash with the packaged entry.

pkgname=zcode-cn-bin
pkgver=4.0.0_10870
pkgrel=5
pkgdesc='ZCode — agentic development environment for GLM (official Linux build, BigModel login only)'
arch=('x86_64' 'aarch64')
url='https://zcode.z.ai/cn'
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
makedepends=('asar' 'libarchive' 'nodejs' 'imagemagick' 'ttf-dejavu')
install="${pkgname}.install"
conflicts=('zcode-cn' 'z-code-bin' 'zcode-bin' 'zcode-desktop-bin')
provides=('zcode-cn')
options=('!strip')
source=("${pkgname}.sh" 'patch.cjs')
source_x86_64=("ZCode-4.0.0-linux-x64.deb::https://cdn-zcode.z.ai/zcode/electron/releases/4.0.0/linux-x64/ZCode-4.0.0-linux-x64.deb")
source_aarch64=("ZCode-4.0.0-linux-arm64.deb::https://cdn-zcode.z.ai/zcode/electron/releases/4.0.0/linux-arm64/ZCode-4.0.0-linux-arm64.deb")
noextract=('ZCode-4.0.0-linux-x64.deb' 'ZCode-4.0.0-linux-arm64.deb')
sha256sums=('87499d60c8de436735c7f8ce192909ff1bb4b891275ef485f37fc1b4b1df37e2'
            'fce42a4e7a25700b43c8c4407ce3a205458dbe5f9c52f6de38c07b0c65579b43')
sha256sums_x86_64=('402f0eea0e3dfa23e3176525ae08d0f4101ced64ddbbe77c88ade87c53ab256a')
sha256sums_aarch64=('961a872c505473b03649faf5f4eff8055b214dd017d5a79da532fabbca17de25')

# 上游同一份包里只有一张 zcode.png；BigModel 国内版图标右下角合成 CN 角标，
# 与 Z.ai 中国版的 ZCN、国际版的 INTL 区分。
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
    install -dm755 "$(dirname "${dst}")"
    magick "${src}" -resize "${size}x${size}" \
        "${tmp}" -gravity southeast -geometry "+${pad}+${pad}" -composite "${dst}"
    rm -f "${tmp}"
}

package() {
  local _extractdir _data _size _arch _app
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

  _app="${pkgdir}/opt/zcode-cn"
  cp -a "${_extractdir}/opt/ZCode" "${_app}"

  # Pin the OAuth login source to BigModel (China). The three upstream login
  # sources (BigModel, Z.ai CN, Z.ai global) live in the host bundle, so the
  # asar is rebuilt with only the BigModel factory left in the provider list.
  asar extract "${_app}/resources/app.asar" "${srcdir}/asar-${pkgname}"
  node "${srcdir}/patch.cjs" "${_app}" bigmodel "${srcdir}/asar-${pkgname}"
  rm -rf "${_app}/resources/app.asar.unpacked"
  asar pack "${srcdir}/asar-${pkgname}" "${_app}/resources/app.asar" --unpack '*.node'
  rm -rf "${srcdir}/asar-${pkgname}"

  # Rewrite the upstream AppArmor profile (Debian paths and profile name) for
  # this package's prefix; the .install hook loads it.
  sed -i \
    -e 's|/opt/ZCode|/opt/zcode-cn|g' \
    -e 's|profile "zcode"|profile "zcode-cn"|' \
    -e 's|<local/zcode>|<local/zcode-cn>|' \
    "${_app}/resources/apparmor-profile"

  for _size in 16 24 32 48 64 128 256 512 1024; do
    _badge_icon "${_extractdir}/usr/share/icons/hicolor/${_size}x${_size}/apps/zcode.png" \
      "${pkgdir}/usr/share/icons/hicolor/${_size}x${_size}/apps/zcode-cn.png" \
      "${_size}"
  done

  install -Dm644 "${_extractdir}/usr/share/applications/zcode.desktop" \
    "${pkgdir}/usr/share/applications/zcode.desktop"
  sed -i \
    -e 's|^Name=.*|Name=ZCode（BigModel 国内版）|' \
    -e 's|^Exec=.*|Exec=/usr/bin/zcode-cn %U|' \
    -e 's|^Icon=.*|Icon=zcode-cn|' \
    -e 's|^StartupWMClass=.*|StartupWMClass=zcode|' \
    "${pkgdir}/usr/share/applications/zcode.desktop"

  install -Dm755 "${srcdir}/${pkgname}.sh" "${pkgdir}/usr/bin/zcode-cn"
  chmod 4755 "${_app}/chrome-sandbox"

  install -Dm644 "${_app}/LICENSE.electron.txt" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.electron.txt"
  install -Dm644 "${_app}/LICENSES.chromium.html" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSES.chromium.html"

  if [[ -f "${_extractdir}/usr/share/doc/zcode/changelog.gz" ]]; then
    install -Dm644 "${_extractdir}/usr/share/doc/zcode/changelog.gz" \
      "${pkgdir}/usr/share/doc/${pkgname}/changelog.gz"
  fi

  rm -rf "${_extractdir}"
}
