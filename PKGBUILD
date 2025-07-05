# Maintainer: 9M2PJU <9m2pju@hamradio.my>
# Contributor: morrownr (upstream developer)

pkgname=rtl8852cu-dkms-morrownr-git
pkgver=20250701
pkgrel=1
pkgdesc="Realtek RTL8852CU WiFi driver (DKMS, morrownr's fork, git version)"
arch=('x86_64')
url="https://github.com/9M2PJU/rtl8852cu-20240510-aur"
license=('MIT')
depends=('dkms')
makedepends=('git')
provides=('rtl8852cu-dkms')
conflicts=('rtl8852cu-dkms')
source=("${pkgname}::git+${url}.git"
        "rtl8852cu-dkms-morrownr-git.install"
        "90-rtl8852cu-morrownr.hook")
md5sums=('SKIP' 'SKIP' 'SKIP')

pkgver() {
  date +%Y%m%d
}

package() {
  local moddir="${pkgdir}/usr/src/rtl8852cu-${pkgver}"

  # Copy driver source to DKMS dir
  install -d "${moddir}"
  cp -r "${srcdir}/${pkgname}"/* "${moddir}/"
  find "${moddir}" -type d -exec chmod 755 {} +
  find "${moddir}" -type f -exec chmod 644 {} +
  chmod +x "${moddir}"/*.sh "${moddir}/dkms.conf"

  # Install pacman post-install hook
  install -Dm644 "${srcdir}/90-rtl8852cu-morrownr.hook" \
    "${pkgdir}/usr/share/libalpm/hooks/90-rtl8852cu-morrownr.hook"
}
