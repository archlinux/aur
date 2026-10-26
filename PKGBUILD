# Maintainer: Eugene Flanagin <eflanagin@pm.me>
#
# asus-ec-sensors-plus: the Linux asus-ec-sensors hwmon driver plus extra
# ASUS boards (first: TUF GAMING X870-PRO WIFI7 W NEO), as a DKMS package.
# It only reads sensor registers; the one write it can do is the EC bank
# register 0xFF (save, select bank 0, restore), see README "bank_switch".
#
# Building before a GitHub release exists (or from your own changes):
#   tools/build-local-pkg.sh      (packs the git checkout, then runs makepkg)

pkgname=asus-ec-sensors-plus-dkms
_repo=asus-ec-sensors-plus
_dkmsname=asus-ec-sensors-plus
pkgver=0.1.2
pkgrel=1
pkgdesc="ASUS motherboard EC sensors (VRM, CPU, motherboard, CPU_OPT fan) for boards not yet in the kernel, e.g. TUF GAMING X870-PRO WIFI7 W NEO; DKMS build of asus-ec-sensors (reads only; optional bank-select save/restore)"
arch=('any')
url="https://github.com/eugenesflanagin-spec/${_repo}"
license=('GPL-2.0-only')
depends=('dkms')
optdepends=('lm_sensors: the "sensors" command to read the values'
            'linux-headers: build the module for the stock Arch kernel')
conflicts=('asus-ec-sensors-dkms-git' 'asus-ec-sensors-x870tuf-dkms')
source=("${_repo}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('aaa25d44757176c463cb9ca13c18dc3e157f8dca0aa5c6646ea77de4dc97ac5f')

prepare() {
  cd "${_repo}-${pkgver}/module"
  # the three version numbers must agree, or DKMS keeps an old build
  # (the "same-version rebuild trap")
  [ "$(cat VERSION)" = "${pkgver}" ] || { echo "module/VERSION is not ${pkgver}"; return 1; }
  grep -qx "PACKAGE_VERSION=\"${pkgver}\"" dkms.conf || { echo "dkms.conf version is not ${pkgver}"; return 1; }
}

package() {
  cd "${_repo}-${pkgver}"
  local dest="${pkgdir}/usr/src/${_dkmsname}-${pkgver}"
  install -Dm644 -t "${dest}" module/asus-ec-sensors.c module/Kbuild module/Makefile module/VERSION module/dkms.conf
  install -Dm644 -t "${pkgdir}/usr/share/doc/${pkgname}" README.md CHANGELOG.md CREDITS.md
  install -Dm755 tools/ec-sample.sh "${pkgdir}/usr/share/doc/${pkgname}/ec-sample.sh"
  # example only - NOT installed into /etc/modprobe.d (see README "bank_switch")
  install -Dm644 examples/asus-ec-sensors-plus.conf "${pkgdir}/usr/share/doc/${pkgname}/examples/asus-ec-sensors-plus.conf"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
