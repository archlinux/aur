# Maintainer: tarball <bootctl@gmail.com>

pkgname='wiretrustee-bin'
_pkgname="${pkgname%-bin}"
pkgver=0.0.8
pkgrel=2
pkgdesc='Connect your devices into a single secure private WireGuard®-based mesh network'
url='https://wiretrustee.com'
arch=(x86_64 aarch64 armv6h)
license=('BSD')

provides=("${_pkgname}")
conflicts=("${_pkgname}")
depends=()
makedepends=()
optdepends=()

source=(
  'config_readme'
  'environment'
  'wiretrustee@.service'
  'wiretrustee-signal.service'
)
sha256sums=(
  'e6e2bb1687510b9381202d95beb27b1bfbe30033f4f038e4bdde61e7a3f65f22'
  'c72c3f27ee2f2fbb232108781e38f41d7f04272d11a42f59938541ac591bd393'
  '672235231a73743878d77e94827c5aba326464dae63457f94cd51708ac84ba58'
  '79cae90dff3bb3177762b9d3a9c69e69ef79ced3dc3a85529ff5050bf17bcd85'
)

_base_url="https://github.com/${_pkgname}/${_pkgname}/releases/download/v${pkgver}-hotfix-1/${_pkgname}_${pkgver}-hotfix-1_linux"

source_x86_64=("${pkgname}-${pkgver}.tar.gz::${_base_url}_amd64.tar.gz")
sha256sums_x86_64=('8f5a764108d6730ce357b17eff14ddd9a3357fb36f071dd110ff59cc330616ce')

source_aarch64=("${pkgname}-${pkgver}.tar.gz::${_base_url}_arm64.tar.gz")
sha256sums_aarch64=('d70e5180a82f56f22580231e973c16d4a408ddf4aa161f0c556295966dc7ab2b')

source_armv6h=("${pkgname}-${pkgver}.tar.gz::${_base_url}_armv6.tar.gz")
sha256sums_armv6h=('5f7784a3bb1f51344aa221fb619989a4f7e0ecd072e1e9973438895e8f9dfb95')

package() {
  # binary
  install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

  # config directory
  install -Ddm755 -o root -g root "${pkgdir}/etc/${_pkgname}"
  install -Dm644 "config_readme" "${pkgdir}/etc/${_pkgname}/README"

  # environment file
  install -Dm644 environment "${pkgdir}/etc/default/${_pkgname}"

  # systemd units
  for kind in @ -signal; do
    install -Dm644 "${_pkgname}${kind}.service" \
      "${pkgdir}/usr/lib/systemd/system/${_pkgname}${kind}.service"
  done

  # license
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
