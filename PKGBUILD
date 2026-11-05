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
# The runtime archive carries no LICENSE/COPYING text, so the package declares
# LicenseRef-custom and cannot install a license file; terms are those of the
# QoderWake service (https://qoder.cn/).

pkgname=qoderwake-cn-bin
_upstreamver=1.2.12-cn
pkgver=1.2.12_cn
pkgrel=1
pkgdesc="QoderWake 国内版 local CLI and daemon (official prebuilt Linux runtime)"
arch=('x86_64' 'aarch64')
url='https://qoder.cn/'
license=('LicenseRef-custom')
depends=('glibc' 'python')
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
sha256sums_x86_64=('ab4f23fe6a5d863d31fbd72b983b136507c9ee59f8d6f9ddb355c83daf32105d')
sha256sums_aarch64=('b48f62cc25cca6675123f4ce78a0d6ab440ade52ed038167498b39e7b9b998c8')

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
  ln -s ../lib/qoderwake-cn/qoderwake-cn "${pkgdir}/usr/bin/qoderwake-cn"
  ln -s ../lib/qoderwake-cn/qodercli/qodercli-cn-wake \
    "${pkgdir}/usr/bin/qodercli-cn-wake"

  # Upstream ships no desktop integration; the product is a CLI plus a local
  # web console. Add a launcher that starts the daemon and opens that console,
  # using the QoderWake logo bundled in the runtime.
  install -Dm644 "${srcdir}/resources/browser-connector/chrome-extension/qwork-logo-light.png" \
    "${pkgdir}/usr/share/icons/hicolor/512x512/apps/qoderwake-cn.png"
  install -Dm644 "${srcdir}/resources/browser-connector/chrome-extension/icons/icon-128.png" \
    "${pkgdir}/usr/share/icons/hicolor/128x128/apps/qoderwake-cn.png"

  install -Dm755 /dev/stdin "${pkgdir}/usr/lib/qoderwake-cn/qoderwake-cn-console" <<'CONSOLE'
#!/bin/sh
# Desktop launcher: start the daemon and open the local console. `start --open`
# waits for the daemon instead of racing it with a separate `portal` call.
exec /usr/bin/qoderwake-cn start --open
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
