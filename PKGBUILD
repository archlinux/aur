# Maintainer: Michael Scalet <michele.scalet at jlbbooks dot it>
# Upstream: https://github.com/Zanasin/tscsync
#
# 0001 adapts upstream scripts/unit template to Arch /usr paths (tscsync-setup)
# and sources install-policy.inc.sh from DATADIR.

pkgname=tscsync
pkgver=2.2.3
pkgrel=2
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
  'f77c2ae4e065ea1a15f3969e75f1a30fdf85accf59d4c03779c2302edd7cd85d'  # official GitHub v2.2.3 tag archive
  'eb97a977731fe1e652be401a4f906f238bcf677b488b96c53ca7a374fb1cae0f'
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
