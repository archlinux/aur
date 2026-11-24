# Maintainer: lzsnyy <710080675@qq.com>
#
# Domestic edition of qoderwake. Upstream only ships install.sh, which
# downloads the Linux runtime tarball from the release channel and unpacks
# qoderwake-cn + the bundled qodercli-cn into ~/.qoderwake-cn. This package
# installs that same archive system-wide.
#
# The resources/ directory must stay next to the qoderwake-cn executable: the
# daemon reads it from the install directory and mirrors it into
# ~/.qoderwake-cn/runtime-resources on first start. It can coexist with the
# international package: different binary names, state dirs and ports.
#
# The daemon also creates ".runtime-install.lock" and runtime metadata next to
# that executable on every start, so the install directory has to be writable
# by the user running it. /usr/lib is not, hence the wrapper below stages a
# private copy of the executable and runs it from the user's data directory.
#
# The runtime archive carries no LICENSE/COPYING text, so the package declares
# LicenseRef-custom and cannot install a license file; terms are those of the
# QoderWake service (https://qoder.cn/).

pkgname=qoderwake-cn-bin
_upstreamver=1.2.23-cn
pkgver=1.2.23_cn
pkgrel=1
pkgdesc="QoderWake 国内版 local CLI and daemon (official prebuilt Linux runtime)"
arch=('x86_64' 'aarch64')
url='https://qoder.cn/'
license=('LicenseRef-custom')
depends=('glibc' 'python')
makedepends=('imagemagick' 'ttf-dejavu')
optdepends=('xdg-utils: open the QoderWake console in the default browser')
options=('!strip' '!debug')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")

source_x86_64=(
  "qoderwake-cn-${_upstreamver}-linux-amd64.tar.gz::https://ide.qoder.com.cn/qoderwake-cn/releases/${_upstreamver}/qoderwake-cn_${_upstreamver}_linux_amd64.tar.gz"
)
source_aarch64=(
  "qoderwake-cn-${_upstreamver}-linux-arm64.tar.gz::https://ide.qoder.com.cn/qoderwake-cn/releases/${_upstreamver}/qoderwake-cn_${_upstreamver}_linux_arm64.tar.gz"
)
sha256sums_x86_64=('b67a07577cb29e611bb66283a4d68d3076f4619be2ea88547b78dcd854dc640a')
sha256sums_aarch64=('b723952591f4d2da7e76feaf2a9398db8a2e8d2f5b6e000d8344f2604baa6c2e')

# 上游两版包内的位图 logo 相同；国内版右下角合成 CN 角标以便区分（console
# 页面本身已使用 qoderwake-icon-cn.svg）。
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

# 区域不是由登录账号决定，而是二进制内的构建期常量：上游把区域占位符替换成
# cn/global，再由它选择域名表（qoder.com.cn / qoder.com）、homeDir 和 binaryName。
# 这里在构建时断言国内版确实固定为 cn，上游若改动这段逻辑直接失败，避免两版
# 静默落到同一个区域。区域值在 Bun 打包的 JS 里，仅做只读校验，不改二进制。
check() {
  local _bin="${srcdir}/qoderwake-cn" _sel
  _sel="$(grep -aoE 'return`[a-z]+`\?\.trim\(\)\.toLowerCase\(\)===`cn`\?`cn`:`global`' "${_bin}" | head -1)"
  if [ "${_sel}" != 'return`cn`?.trim().toLowerCase()===`cn`?`cn`:`global`' ]; then
    echo "error: qoderwake-cn region selector is not pinned to cn: ${_sel:-<none>}" >&2
    return 1
  fi
}

package() {
  # The tarball has no top-level directory, so makepkg extracts it flat into
  # $srcdir.
  install -dm755 "${pkgdir}/usr/lib/qoderwake-cn/qodercli"
  install -m755 "${srcdir}/qoderwake-cn" "${pkgdir}/usr/lib/qoderwake-cn/qoderwake-cn"
  install -m755 "${srcdir}/qodercli/qodercli-cn-wake" \
    "${pkgdir}/usr/lib/qoderwake-cn/qodercli/qodercli-cn-wake"
  cp -a "${srcdir}/resources" "${pkgdir}/usr/lib/qoderwake-cn/"
  find "${pkgdir}/usr/lib/qoderwake-cn" -type d -name __pycache__ -prune -exec rm -rf {} +

  install -dm755 "${pkgdir}/usr/bin"
  ln -s ../lib/qoderwake-cn/qodercli/qodercli-cn-wake \
    "${pkgdir}/usr/bin/qodercli-cn-wake"

  # The daemon creates ".runtime-install.lock" and runtime metadata next to its
  # own executable on every start. /usr/lib is root-owned, so running the
  # packaged binary directly fails with EACCES: the daemon never comes up and
  # the desktop launcher silently does nothing. Stage a writable copy of the
  # executable in the user's data dir first; resources/ and qodercli/ are
  # linked back into the package and stay read-only.
  install -Dm755 /dev/stdin "${pkgdir}/usr/bin/qoderwake-cn" <<'WRAPPER'
#!/bin/sh
set -u
_src='/usr/lib/qoderwake-cn'
_ver='@RUNTIMEVER@'
_root="${XDG_DATA_HOME:-${HOME}/.local/share}/qoderwake-cn"
_runtime="${_root}/runtime"

if [ ! -f "${_runtime}/.version" ] \
  || [ "$(cat "${_runtime}/.version" 2>/dev/null)" != "${_ver}" ]; then
  mkdir -p "${_root}" || exit 1
  _tmp="${_root}/runtime.new.$$"
  rm -rf "${_tmp}"
  mkdir -p "${_tmp}" || exit 1
  install -m755 "${_src}/qoderwake-cn" "${_tmp}/qoderwake-cn" || exit 1
  ln -s "${_src}/resources" "${_tmp}/resources"
  ln -s "${_src}/qodercli" "${_tmp}/qodercli"
  printf '%s\n' "${_ver}" > "${_tmp}/.version" || exit 1
  rm -rf "${_runtime}"
  mv "${_tmp}" "${_runtime}" || exit 1
fi

exec "${_runtime}/qoderwake-cn" "$@"
WRAPPER
  sed -i "s|@RUNTIMEVER@|${_upstreamver}|" "${pkgdir}/usr/bin/qoderwake-cn"

  # Upstream ships no desktop integration; the product is a CLI plus a local
  # web console. Add a launcher that starts the daemon and opens that console,
  # using the QoderWake logo bundled in the runtime.
  _badge_icon "${srcdir}/resources/browser-connector/chrome-extension/qwork-logo-light.png" \
    "${pkgdir}/usr/share/icons/hicolor/512x512/apps/qoderwake-cn.png" 512
  _badge_icon "${srcdir}/resources/browser-connector/chrome-extension/icons/icon-128.png" \
    "${pkgdir}/usr/share/icons/hicolor/128x128/apps/qoderwake-cn.png" 128

  install -Dm755 /dev/stdin "${pkgdir}/usr/lib/qoderwake-cn/qoderwake-cn-console" <<'CONSOLE'
#!/bin/sh
# Desktop launcher: /usr/bin/qoderwake-cn stages the runtime in the user's data
# dir (the daemon needs a writable install directory). `start` waits for the
# daemon and is a no-op when it is already running; `portal` then always opens
# the console in the browser, whereas `start --open` only opens it on the
# first start.
/usr/bin/qoderwake-cn start
exec /usr/bin/qoderwake-cn portal
CONSOLE

  install -Dm644 /dev/stdin "${pkgdir}/usr/share/applications/qoderwake-cn.desktop" <<'DESKTOP'
[Desktop Entry]
Type=Application
Name=QoderWake 国内版
Comment=打开 QoderWake 国内版本地控制台
Exec=/usr/lib/qoderwake-cn/qoderwake-cn-console
Icon=qoderwake-cn
Terminal=false
Categories=Development;
DESKTOP
}
