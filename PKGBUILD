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
pkgver=1.2.11
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
sha256sums_x86_64=('76e1fb306e5427e6457a633430638ea88a58350552b03b4175cc12ae48704518')
sha256sums_aarch64=('f85d40543faa49b8f7152f84357e44730508c211fb42522af0f0edf66e6f4a96')

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
}
