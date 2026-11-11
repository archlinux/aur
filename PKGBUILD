# Maintainer: Michael Scalet <michele.scalet at jlbbooks dot it>
# Upstream: https://github.com/Zanasin/tscsync
#
# 0001 adapts upstream scripts/unit template to Arch /usr paths (tscsync-setup)
# and sources install-policy.inc.sh from DATADIR.

pkgname=tscsync
pkgver=2.2.4
pkgrel=1
pkgdesc='Pre-boot TSC sync for AMD (UEFI) so Linux keeps the TSC clocksource'
arch=('x86_64')
url='https://github.com/Zanasin/tscsync'
license=('MIT')
depends=('bash' 'util-linux' 'systemd')
makedepends=('curl' 'binutils' 'gcc' 'make')
# sbsigntools: optional — SB off installs unsigned without sbsign (since 2.2.2);
# SB on needs an enrolled key fingerprint in mokutil --db / --list-enrolled (#9).
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
  '503dec0d5db0524b1a0edd87e2589443e1c9191cccd012f4fae5a31385884b27'  # official GitHub v2.2.4 tag archive
  '9e0d786982a803d3b46e54e005453b0dba6670d4c7f97ed00cc4f5761fe5c6d9'
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
  install -Dm644 scripts/install-policy.inc.sh \
    "${pkgdir}/usr/lib/tscsync/install-policy.inc.sh"

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
