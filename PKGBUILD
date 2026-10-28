# Maintainer: koswu <koswu at outlook dot com>
# Packaging reference: uuplugin-bin, maintained by akkarriin.

pkgname=uuplugin-dns-patched-bin
pkgver=14.2.2
pkgrel=1
pkgdesc='UU Steam Deck Linux plugin patched to preserve Tailscale DNS'
arch=('x86_64')
url='https://github.com/Koswu/uuplugin-dns-patched'
license=('LicenseRef-UU' '0BSD')
depends=('iproute2' 'iptables' 'kmod' 'systemd')
makedepends=('python')
optdepends=('tailscale: Tailnet connectivity and split DNS')
provides=("uuplugin-bin=${pkgver}" 'uuplugin')
conflicts=('uuplugin-bin' 'uuplugin')
backup=('etc/uuplugin/uu.conf')
# The output digest is part of the patch profile: do not mutate the binary.
options=('!strip' '!debug')
source=(
  "uuplugin-${pkgver}.tar.gz::https://uurouter.gdl.netease.com/uuplugin/steam-deck-plugin-${CARCH}/v${pkgver}/uu.tar.gz"
  'patch_uuplugin_tailnet.py'
  'test_uuplugin_patch.py'
  'uuplugin.service'
  'LICENSE'
)
sha256sums=('6881c8bd388630edfdbceef1f723bf43cf75b0ce5122ee891e99d2fb86c96652'
            '0573a865b7ff2e799d5882119af9369b6b566770d40a1b36581569a168b51902'
            'd39477cdae3ccfc35cc12af1f9968ceef6e43cdf49a83b1659ba7c0d4f8037cb'
            'c2831cbf26bb3629adbed3cb10efcc7a64f54b337496aa126e68195947f110e7'
            'd1cc264c9506464f18e849cb22e58842aaba5250a1815ee77456d6d661c0f979')

prepare() {
  # Original and output SHA256 must both match the verified profile.
  # Separate output; repeat prepare() safely without touching the original.
  rm -f "${srcdir}/uuplugin-patched"
  python "${srcdir}/patch_uuplugin_tailnet.py" \
    "${srcdir}/uuplugin" "${srcdir}/uuplugin-patched"
}

check() {
  cd "${srcdir}"
  python -m unittest -v test_uuplugin_patch
}

package() {
  install -Dm755 "${srcdir}/uuplugin-patched" "${pkgdir}/usr/bin/uuplugin"
  # UU resolves its guardian as a sibling executable.
  install -Dm755 "${srcdir}/xuplugin-guardian" "${pkgdir}/usr/bin/xuplugin-guardian"
  install -Dm644 "${srcdir}/uu.conf" "${pkgdir}/etc/uuplugin/uu.conf"
  install -Dm644 "${srcdir}/uuplugin.service" \
    "${pkgdir}/usr/lib/systemd/system/uuplugin.service"
  # This license covers our patch and packaging only, not NetEase's binaries.
  install -Dm644 "${srcdir}/LICENSE" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.patch"
}
