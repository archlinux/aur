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
_upstreamver=1.2.11-cn
pkgver=1.2.11_cn
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
sha256sums_x86_64=('aef63230ee27bd958aa220ddaaff4f9c3bd0723d71dde8c859d118968cfba6cc')
sha256sums_aarch64=('0a6f9d1edc91f25535451547161517e23e2ee8599840be0f48cb575bda18317d')

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
}
