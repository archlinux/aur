# Maintainer: Adityarup Laha <me at adityaruplaha dot me>

_pkgname=acer-wmi-linuwu
pkgname=acer-wmi-linuwu-dkms-git
pkgver=7.3.0.1.r68.92e9d21
pkgrel=1
pkgdesc='Acer WMI laptop extras driver with NitroSense and PredatorSense settings (DKMS)'
arch=('x86_64')
url='https://github.com/adityaruplaha/acer-wmi-linuwu'
license=('GPL-2.0-or-later')
depends=('dkms')
makedepends=('git')
provides=("${pkgname%-git}=${pkgver}"
          "${_pkgname}=${pkgver}"
          'ACER-WMI-MODULE')
# The Linuwu-Sense packages build linuwu_sense, which binds the same acer-wmi
# platform device, and linuwu-sense-an515-55-dkms also blacklists acer_wmi.
conflicts=("${pkgname%-git}"
           "${_pkgname}"
           'linuwu-sense-dkms'
           'linuwu-sense-an515-55-dkms')
install="${pkgname}.install"
source=("${_pkgname}::git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  cd "${_pkgname}"
  # The release is the version in dkms.conf, as the repository has no tags
  printf '%s.r%s.%s' \
    "$(sed -n 's/^PACKAGE_VERSION="\(.*\)"$/\1/p' dkms.conf)" \
    "$(git rev-list --count HEAD)" \
    "$(git rev-parse --short=7 HEAD)"
}

package() {
  cd "${_pkgname}"
  local _dest="${pkgdir}/usr/src/${_pkgname}-${pkgver}"

  install -Dm644 -t "${_dest}" dkms.conf
  install -Dm644 -t "${_dest}/src" src/Kbuild src/acer-wmi.c

  # DKMS requires PACKAGE_VERSION to match the source directory's version
  sed -i "s/^PACKAGE_VERSION=.*/PACKAGE_VERSION=\"${pkgver}\"/" "${_dest}/dkms.conf"
  grep -qx "PACKAGE_VERSION=\"${pkgver}\"" "${_dest}/dkms.conf"

  install -Dm644 -t "${pkgdir}/usr/share/doc/${pkgname}" \
    README.md Documentation/ABI/testing/sysfs-platform-acer-wmi
}
