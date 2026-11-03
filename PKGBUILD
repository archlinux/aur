# Maintainer: Michael Scalet <michele.scalet at jlbbooks dot it>
# Upstream: https://github.com/Zanasin/tscsync
#
# 0001 adapts upstream scripts/unit template to Arch /usr paths (tscsync-setup).

pkgname=tscsync
pkgver=2.2.1
pkgrel=1
pkgdesc='Pre-boot TSC sync for AMD (UEFI) so Linux keeps the TSC clocksource'
arch=('x86_64')
url='https://github.com/Zanasin/tscsync'
license=('MIT')
depends=('bash' 'util-linux' 'systemd')
makedepends=('curl' 'binutils' 'gcc' 'make')
optdepends=(
  'sbsigntools: sign the EFI binary during tscsync-setup'
  'sbctl: enroll/sign with your Secure Boot keys'
  'mokutil: detect Secure Boot / MOK state during setup'
)
conflicts=('tscsync-git')
install=tscsync.install
# !strip: keep EFI payloads; !lto: vendored gnu-efi breaks under makepkg LTO
options=('!strip' '!lto')
source=(
  "${pkgname}-${pkgver}.tar.gz::https://github.com/Zanasin/tscsync/archive/refs/tags/v${pkgver}.tar.gz"
  '0001-arch-usr-paths.patch'
)
sha256sums=(
  'bbacf9b64aae7b1525e9bc34b70cb647871a6d0c7c8a52e2cf1d4c6516386336'
  '8f4bd82416ae7c7b906c899eba84d68e2d99079ceba852abf6638ffcba869d45'
)

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  patch -p1 < "${srcdir}/0001-arch-usr-paths.patch"
}

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make -j"$(nproc)"
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  install -Dm644 build/tscsync.efi \
    "${pkgdir}/usr/lib/tscsync/tscsync.efi"
  install -Dm644 build/tscsync-driver.efi \
    "${pkgdir}/usr/lib/tscsync/tscsync-driver.efi"
  install -Dm644 boot/custom.cfg.in \
    "${pkgdir}/usr/lib/tscsync/custom.cfg.in"
  install -Dm644 boot/tscsync-report.service.in \
    "${pkgdir}/usr/lib/tscsync/tscsync-report.service.in"

  install -Dm755 boot/tscsync-report \
    "${pkgdir}/usr/lib/tscsync/tscsync-report"
  install -Dm755 scripts/tscsync-status \
    "${pkgdir}/usr/bin/tscsync-status"
  install -Dm755 scripts/install.sh \
    "${pkgdir}/usr/bin/tscsync-setup"
  install -Dm755 scripts/set-mode.sh \
    "${pkgdir}/usr/bin/tscsync-set-mode"
  install -Dm755 scripts/uninstall.sh \
    "${pkgdir}/usr/bin/tscsync-uninstall"
}
