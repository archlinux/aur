# Maintainer: 9M2PJU <9m2pju@hamradio.my>
# Contributor: morrownr (upstream developer)

pkgname=rtl8852cu-9m2pju-dkms-git
pkgver=20261126
pkgrel=1
pkgdesc="Realtek RTL8832CU/RTL8852CU USB WiFi driver (DKMS, 9M2PJU fork with Linux 7.3+ & Clang/LLVM support)"
arch=('x86_64' 'aarch64')
url="https://github.com/9M2PJU/rtl8852cu-9M2PJU-dkms"
license=('GPL-2.0-only')
depends=('dkms')
makedepends=('git')
provides=('rtl8852cu-dkms' 'rtl8852cu-dkms-morrownr-git')
conflicts=('rtl8852cu-dkms' 'rtl8852cu-dkms-morrownr-git')
replaces=('rtl8852cu-dkms-morrownr-git')
install="${pkgname}.install"
source=("${pkgname}::git+${url}.git"
        "90-rtl8852cu-9m2pju.hook")
sha256sums=('SKIP' 'SKIP')

pkgver() {
  date +%Y%m%d
}

package() {
  local moddir="${pkgdir}/usr/src/rtl8852cu-${pkgver}"

  # Copy driver source to DKMS dir
  install -d "${moddir}"
  cp -r "${srcdir}/${pkgname}"/* "${moddir}/"
  sed -i "s/^PACKAGE_VERSION=.*/PACKAGE_VERSION=\"${pkgver}\"/" "${moddir}/dkms.conf"
  find "${moddir}" -type d -exec chmod 755 {} +
  find "${moddir}" -type f -exec chmod 644 {} +
  chmod +x "${moddir}"/*.sh "${moddir}/dkms.conf"

  # Install pacman post-install hook
  install -Dm644 "${srcdir}/90-rtl8852cu-9m2pju.hook" \
    "${pkgdir}/usr/share/libalpm/hooks/90-rtl8852cu-9m2pju.hook"
}
