# Maintainer: skrewball <aur at joickle dot com> gitlab.com/skrewball/aur

pkgname=asus-ec-sensors-dkms-git
_pkgbase=asus-ec-sensors
pkgver=0.1.0.r27.g6ca7636
pkgrel=1
pkgdesc='HWMON sensors driver for the ASUS Embedded Controller'
arch=('x86_64')
url='https://github.com/zeule/asus-ec-sensors'
license=('GPL2')
depends=('dkms')
makedepends=('git')
provides=("${_pkgbase}")
source=("${_pkgbase}::git+${url}.git"
	'asus-ec-sensors.conf'
	'dkms.conf')
sha256sums=('SKIP'
            'd6c89c889c1d207826e1b7d1c2934375d3b379a5032b108cf5b4e479c4c90d18'
            '8fd68f7fbdf51e93c68ef02bca512261ea3cbcca6219261017a72f6854ebee94')

pkgver() {
  cd "${_pkgbase}"
  git describe --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build () {
  cd "${_pkgbase}"
  make
}

package() {
  local _kver=$(awk -F. '{print $1$2}' <<< $(uname -r))
  if [[ "${_kver}" -eq "517" ]] ; then
    # Prevent older driver 'asus-wmi-ec-sensors' from loading at boot
    echo "blacklist asus_wmi_ec_sensors" >> asus-ec-sensors.conf
    install -Dm644 asus-ec-sensors.conf "${pkgdir}/etc/modprobe.d/blacklist-asus-wmi-ec.conf"
  elif [[ "${_kver}" -lt "517" ]] ; then
    # Driver needs to be manually loaded at boot for kernel 5.16 and lower
    echo "asus-ec-sensors" >> asus-ec-sensors.conf
    install -Dm644 asus-ec-sensors.conf "${pkgdir}/etc/modules-load.d/asus-ec-sensors.conf"
  else
    # Driver mainlined in 5.18+
    echo "This driver has been mainlined in Kernel 5.18+"
    echo "You should remove this package now."
  fi

  sed -e "s/@_PKGBASE@/${_pkgbase}/" \
      -e "s/@PKGVER@/${pkgver}/" \
      -i dkms.conf
  install -Dm644 dkms.conf "${pkgdir}/usr/src/${_pkgbase}-${pkgver}/dkms.conf"
  
  cd "${_pkgbase}"
  install -Dm644 Kbuild "${pkgdir}/usr/src/${_pkgbase}-${pkgver}/Kbuild"
  install -Dm644 Makefile "${pkgdir}/usr/src/${_pkgbase}-${pkgver}/Makefile"
  install -Dm644 asus-ec-sensors.c "${pkgdir}/usr/src/${_pkgbase}-${pkgver}/asus-ec-sensors.c"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
