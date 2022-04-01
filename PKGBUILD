# Maintainer: skrewball <skrewball at joickle dot com>

pkgname=asus-ec-sensors-dkms-git
_pkgbase=asus-ec-sensors
pkgver=0.1.r49.523690c
pkgrel=1
pkgdesc='HWMON sensors driver for the ASUS Embedded Controller'
arch=('x86_64')
url='https://github.com/joickle/asus-ec-sensors'
license=('GPL2')
depends=('dkms')
makedepends=('git')
provides=("${_pkgbase}")
source=("${_pkgbase}::git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  cd "${_pkgbase}"
  printf "0.1.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build () {
  cd "${_pkgbase}"
  make
}

package() {
  cd "${_pkgbase}"
  local _kerver=$(awk -F. '{print $1$2}' <<< $(uname -r))
  
  if [[ "${_kerver}" -eq "517" ]] ; then
    # Prevent older driver 'asus-wmi-ec-sensors' from loading at boot
    echo "blacklist asus_wmi_ec_sensors" >> asus-ec-sensors.conf
    install -Dm644 asus-ec-sensors.conf "${pkgdir}/etc/modprobe.d/blacklist-asus-wmi-ec.conf"
  elif [[ "${_kerver}" -lt "517" ]] ; then
    # Driver needs to be manually loaded at boot for kernel 5.16 and lower
    echo "asus-ec-sensors" >> asus-ec-sensors.conf
    install -Dm644 asus-ec-sensors.conf "${pkgdir}/etc/modules-load.d/asus-ec-sensors.conf"
  else
    # Driver mainlined in 5.18+
    echo "This driver has been mainlined in Kernel 5.18+"
    echo "You should remove this package now."
  fi

  sed -e "s/@CFLGS@//" \
      -e "s/@_PKGBASE@/${_pkgbase}/" \
      -e "s/@PKGVER@/${pkgver}/" \
      -i dkms.conf

  install -Dm644 dkms.conf "${pkgdir}/usr/src/${_pkgbase}-${pkgver}/dkms.conf"
  install -Dm644 Makefile "${pkgdir}/usr/src/${_pkgbase}-${pkgver}/Makefile"
  install -Dm644 asus-ec-sensors.c "${pkgdir}/usr/src/${_pkgbase}-${pkgver}/asus-ec-sensors.c"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
