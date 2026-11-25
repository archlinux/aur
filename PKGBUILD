# Maintainer: 9M2PJU <9m2pju@hamradio.my>
# Contributor: morrownr (upstream developer)

pkgname=rtl8852cu-9m2pju-dkms
pkgver=2026.11.26
pkgrel=1
pkgdesc="Realtek RTL8832CU/RTL8852CU USB WiFi driver (DKMS, 9M2PJU tagged release with Linux 7.3+ & Clang/LLVM support)"
arch=('x86_64' 'aarch64')
url="https://github.com/9M2PJU/rtl8852cu-9M2PJU-dkms"
license=('GPL-2.0-only')
depends=('dkms')
provides=('rtl8852cu-dkms')
conflicts=('rtl8852cu-dkms' 'rtl8852cu-9m2pju-dkms-git' 'rtl8852cu-dkms-morrownr-git')
install="${pkgname}.install"
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz"
        "90-rtl8852cu-9m2pju.hook")
sha256sums=('d2309873689826a04ed0ae841e428b04d012832deaeab1dd32fc860305d0f34f'
            '245585c974fb72f79f7274bb480b5bd2c7bd92eba1acab995e1324faa0afd0a8')

package() {
  local srcdir_tag="${srcdir}/rtl8852cu-9M2PJU-dkms-${pkgver}"
  local moddir="${pkgdir}/usr/src/rtl8852cu-${pkgver}"

  # Copy driver source to DKMS dir
  install -d "${moddir}"
  cp -r "${srcdir_tag}"/* "${moddir}/"
  sed -i "s/^PACKAGE_VERSION=.*/PACKAGE_VERSION=\"${pkgver}\"/" "${moddir}/dkms.conf"
  find "${moddir}" -type d -exec chmod 755 {} +
  find "${moddir}" -type f -exec chmod 644 {} +
  chmod +x "${moddir}"/*.sh "${moddir}/dkms.conf"

  # Install pacman post-install hook
  install -Dm644 "${srcdir}/90-rtl8852cu-9m2pju.hook" \
    "${pkgdir}/usr/share/libalpm/hooks/90-rtl8852cu-9m2pju.hook"
}
