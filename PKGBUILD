# Maintainer: Michael Scalet <michele.scalet at jlbbooks dot it>
# Upstream: https://github.com/Zanasin/tscsync
#
# 0001 adapts upstream scripts/unit template to Arch /usr paths (tscsync-setup).

pkgname=tscsync
pkgver=2.2.2
pkgrel=1
pkgdesc='Pre-boot TSC sync for AMD (UEFI) so Linux keeps the TSC clocksource'
arch=('x86_64')
url='https://github.com/Zanasin/tscsync'
license=('MIT')
depends=('bash' 'util-linux' 'systemd')
makedepends=('curl' 'binutils' 'gcc' 'make')
# sbsigntools: optional — with Secure Boot off, upstream install.sh no longer
# hard-fails on a leftover DKMS key without sbsign (v2.2.2 / Zanasin/tscsync#7).
optdepends=(
  'sbsigntools: sign the EFI binary during tscsync-setup (needed if Secure Boot is on)'
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
  'b37e81e3a99eb9038e41522fa868022b5b6759c9ba84639cc5b874bbb0fb542e'
  'c220ba2b09414a4b6099ced814e11c0b1f524abe7eaeb6824476974430e80f65'
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
