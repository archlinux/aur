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
_upstreamver=1.2.14
pkgver=1.2.14
pkgrel=1
pkgdesc="QoderWake local CLI and daemon (official prebuilt Linux runtime)"
arch=('x86_64' 'aarch64')
url='https://qoder.com/'
license=('LicenseRef-custom')
depends=('glibc' 'python')
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
sha256sums_x86_64=('c81f4d29fb35713f5c784ce80fb7cb3ab043e8eb8823f24ba6eea01dfb2aa3bd')
sha256sums_aarch64=('6a03679cb269da3cd8400c386de4d5403cef8a2b8ee1df2e0d0a7bf66d9f50e8')

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
  install -Dm644 "${srcdir}/resources/browser-connector/chrome-extension/qwork-logo-light.png" \
    "${pkgdir}/usr/share/icons/hicolor/512x512/apps/qoderwake.png"
  install -Dm644 "${srcdir}/resources/browser-connector/chrome-extension/icons/icon-128.png" \
    "${pkgdir}/usr/share/icons/hicolor/128x128/apps/qoderwake.png"

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
