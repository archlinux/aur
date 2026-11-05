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
# The runtime archive carries no LICENSE/COPYING text, so the package declares
# LicenseRef-custom and cannot install a license file; terms are those of the
# QoderWake service (https://qoder.com/).

pkgname=qoderwake-bin
pkgver=1.2.12
pkgrel=1
pkgdesc="QoderWake local CLI and daemon (official prebuilt Linux runtime)"
arch=('x86_64' 'aarch64')
url='https://qoder.com/'
license=('LicenseRef-custom')
depends=('glibc' 'python')
optdepends=('xdg-utils: open the QoderWake console in the default browser')
options=('!strip' '!debug')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")

source_x86_64=(
  "qoderwake-${pkgver}-linux-amd64.tar.gz::https://download.qoder.com/qoderwake/releases/${pkgver}/qoderwake_${pkgver}_linux_amd64.tar.gz"
)
source_aarch64=(
  "qoderwake-${pkgver}-linux-arm64.tar.gz::https://download.qoder.com/qoderwake/releases/${pkgver}/qoderwake_${pkgver}_linux_arm64.tar.gz"
)
sha256sums_x86_64=('5394e3ecc3b1437c7c26eeb81febaf2d383747bee52bcd663ae942e4fb780a3b')
sha256sums_aarch64=('f38c7d216a41578e51c8d56680a047cd3fca40f7cdc779c7722fb0ee6f2cf030')

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
  ln -s ../lib/qoderwake/qoderwake "${pkgdir}/usr/bin/qoderwake"
  ln -s ../lib/qoderwake/qodercli/qodercli-wake "${pkgdir}/usr/bin/qodercli-wake"

  # Upstream ships no desktop integration; the product is a CLI plus a local
  # web console. Add a launcher that starts the daemon and opens that console,
  # using the QoderWake logo bundled in the runtime.
  install -Dm644 "${srcdir}/resources/browser-connector/chrome-extension/qwork-logo-light.png" \
    "${pkgdir}/usr/share/icons/hicolor/512x512/apps/qoderwake.png"
  install -Dm644 "${srcdir}/resources/browser-connector/chrome-extension/icons/icon-128.png" \
    "${pkgdir}/usr/share/icons/hicolor/128x128/apps/qoderwake.png"

  install -Dm755 /dev/stdin "${pkgdir}/usr/lib/qoderwake/qoderwake-console" <<'CONSOLE'
#!/bin/sh
# Desktop launcher: start the daemon and open the local console. `start --open`
# waits for the daemon instead of racing it with a separate `portal` call.
exec /usr/bin/qoderwake start --open
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
