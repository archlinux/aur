# Maintainer: lzsnyy <710080675@qq.com>
#
# Upstream only ships install.sh, which downloads the Linux runtime tarball
# from the release channel and unpacks qoderwake + the bundled qodercli into
# ~/.qoderwake. This package installs that same archive system-wide.
#
# The resources/ directory must stay next to the qoderwake executable: the
# daemon reads it from the install directory and mirrors it into
# ~/.qoderwake/runtime-resources on first start.
#
# The daemon also creates ".runtime-install.lock" and runtime metadata next to
# that executable on every start, so the install directory has to be writable
# by the user running it. /usr/lib is not, hence the wrapper below stages a
# private copy of the executable and runs it from the user's data directory.
#
# The runtime archive carries no LICENSE/COPYING text, so the package declares
# LicenseRef-custom and cannot install a license file; terms are those of the
# QoderWake service (https://qoder.com/).

pkgname=qoderwake-bin
_upstreamver=1.2.23
pkgver=1.2.23
pkgrel=1
pkgdesc="QoderWake local CLI and daemon (official prebuilt Linux runtime)"
arch=('x86_64' 'aarch64')
url='https://qoder.com/'
license=('LicenseRef-custom')
depends=('glibc' 'python')
makedepends=('imagemagick' 'ttf-dejavu')
optdepends=('xdg-utils: open the QoderWake console in the default browser')
options=('!strip' '!debug')
provides=("${pkgname%-bin}=${_upstreamver}")
conflicts=("${pkgname%-bin}")

source_x86_64=(
  "qoderwake-${_upstreamver}-linux-amd64.tar.gz::https://download.qoder.com/qoderwake/releases/${_upstreamver}/qoderwake_${_upstreamver}_linux_amd64.tar.gz"
)
source_aarch64=(
  "qoderwake-${_upstreamver}-linux-arm64.tar.gz::https://download.qoder.com/qoderwake/releases/${_upstreamver}/qoderwake_${_upstreamver}_linux_arm64.tar.gz"
)
sha256sums_x86_64=('bba7a60ac40cc21ded3588fa6c6e13ef9d83ed92085206706e940e81b4dbf6a9')
sha256sums_aarch64=('bd2091b88a3da69110900734b569a531016da764d35d642df8d67abeab14244f')

# 国际版与国内版共用上游 logo，右下角合成 INTL 角标以与国内版区分。
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

# 区域不是由登录账号决定，而是二进制内的构建期常量：上游把区域占位符替换成
# global/cn，再由它选择域名表（qoder.com / qoder.com.cn）、homeDir 和 binaryName。
# 这里在构建时断言国际版确实固定为 global，上游若改动这段逻辑直接失败，避免两版
# 静默落到同一个区域。区域值在 Bun 打包的 JS 里，仅做只读校验，不改二进制。
check() {
  local _bin="${srcdir}/qoderwake" _sel
  _sel="$(grep -aoE 'return`[a-z]+`\?\.trim\(\)\.toLowerCase\(\)===`cn`\?`cn`:`global`' "${_bin}" | head -1)"
  if [ "${_sel}" != 'return`global`?.trim().toLowerCase()===`cn`?`cn`:`global`' ]; then
    echo "error: qoderwake region selector is not pinned to global: ${_sel:-<none>}" >&2
    return 1
  fi
}

package() {
  # The tarball has no top-level directory, so makepkg extracts it flat into
  # $srcdir.
  install -dm755 "${pkgdir}/usr/lib/qoderwake/qodercli"
  install -m755 "${srcdir}/qoderwake" "${pkgdir}/usr/lib/qoderwake/qoderwake"
  install -m755 "${srcdir}/qodercli/qodercli-wake" \
    "${pkgdir}/usr/lib/qoderwake/qodercli/qodercli-wake"
  cp -a "${srcdir}/resources" "${pkgdir}/usr/lib/qoderwake/"
  find "${pkgdir}/usr/lib/qoderwake" -type d -name __pycache__ -prune -exec rm -rf {} +

  install -dm755 "${pkgdir}/usr/bin"
  ln -s ../lib/qoderwake/qodercli/qodercli-wake "${pkgdir}/usr/bin/qodercli-wake"

  # The daemon creates ".runtime-install.lock" and runtime metadata next to its
  # own executable on every start. /usr/lib is root-owned, so running the
  # packaged binary directly fails with EACCES: the daemon never comes up and
  # the desktop launcher silently does nothing. Stage a writable copy of the
  # executable in the user's data dir first; resources/ and qodercli/ are
  # linked back into the package and stay read-only.
  install -Dm755 /dev/stdin "${pkgdir}/usr/bin/qoderwake" <<'WRAPPER'
#!/bin/sh
set -u
_src='/usr/lib/qoderwake'
_ver='@RUNTIMEVER@'
_root="${XDG_DATA_HOME:-${HOME}/.local/share}/qoderwake"
_runtime="${_root}/runtime"

if [ ! -f "${_runtime}/.version" ] \
  || [ "$(cat "${_runtime}/.version" 2>/dev/null)" != "${_ver}" ]; then
  mkdir -p "${_root}" || exit 1
  _tmp="${_root}/runtime.new.$$"
  rm -rf "${_tmp}"
  mkdir -p "${_tmp}" || exit 1
  install -m755 "${_src}/qoderwake" "${_tmp}/qoderwake" || exit 1
  ln -s "${_src}/resources" "${_tmp}/resources"
  ln -s "${_src}/qodercli" "${_tmp}/qodercli"
  printf '%s\n' "${_ver}" > "${_tmp}/.version" || exit 1
  rm -rf "${_runtime}"
  mv "${_tmp}" "${_runtime}" || exit 1
fi

exec "${_runtime}/qoderwake" "$@"
WRAPPER
  sed -i "s|@RUNTIMEVER@|${_upstreamver}|" "${pkgdir}/usr/bin/qoderwake"

  # Upstream ships no desktop integration; the product is a CLI plus a local
  # web console. Add a launcher that starts the daemon and opens that console,
  # using the QoderWake logo bundled in the runtime.
  _badge_icon "${srcdir}/resources/browser-connector/chrome-extension/qwork-logo-light.png" \
    "${pkgdir}/usr/share/icons/hicolor/512x512/apps/qoderwake.png" 512 INTL '#2C549E'
  _badge_icon "${srcdir}/resources/browser-connector/chrome-extension/icons/icon-128.png" \
    "${pkgdir}/usr/share/icons/hicolor/128x128/apps/qoderwake.png" 128 INTL '#2C549E'

  install -Dm755 /dev/stdin "${pkgdir}/usr/lib/qoderwake/qoderwake-console" <<'CONSOLE'
#!/bin/sh
# Desktop launcher: /usr/bin/qoderwake stages the runtime in the user's data
# dir (the daemon needs a writable install directory). `start` waits for the
# daemon and is a no-op when it is already running; `portal` then always opens
# the console in the browser, whereas `start --open` only opens it on the
# first start.
/usr/bin/qoderwake start
exec /usr/bin/qoderwake portal
CONSOLE

  install -Dm644 /dev/stdin "${pkgdir}/usr/share/applications/qoderwake.desktop" <<'DESKTOP'
[Desktop Entry]
Type=Application
Name=QoderWake
Comment=Open the local QoderWake console
Exec=/usr/lib/qoderwake/qoderwake-console
Icon=qoderwake
Terminal=false
Categories=Development;
DESKTOP
}
