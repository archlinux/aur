# Maintainer: Ryan Barillos < ryan dot barillos at proton dot me >

# Custom variables
_name="acer-wmi-battery"
_user="frederik-h"
_filetype="tar.gz" # Source code is also available in .zip file, so specify it

# Main info
pkgname="${_name}-dkms"
pkgver=0.1.0
pkgrel=3
pkgdesc="For Acer laptops -- kernel module to set Battery Charge Limit to 80%."
arch=('any')
url="https://github.com/${_user}/${_name}"
license=('GPL-2.0')
groups=('acer-wmi')
depends=("dkms")
provides=("${_name}-dkms")
conflicts=("${_name}-dkms-git")
install="${_name}.install"
source=(
  "${url}/archive/v${pkgver}/${_name}-${pkgver}.${_filetype}"
  "${_name}.conf"
  "dkms.conf"
)
sha256sums=(
  'eadee2d9daf257b34098d8b1f21b9be08270b89b6249725f701f1f790b6c76ba'
  '35988ccdeee6343d66b9ec99a47ee9fe9577932fc48158083df241ca3b5b3096'
  'd62ec611940ae5bf1b67ee47634811b901bf6f569eba516dd6e43cd6680d7a90'
  )

package() {
  # Copy dkms.conf
  install -Dm644 dkms.conf -t "${pkgdir}"/usr/src/"${_name}-${pkgver}"/

  # Set version
  sed -e "s/@PKGVER@/${pkgver}/" \
      -i "${pkgdir}"/usr/src/"${_name}-${pkgver}"/dkms.conf

  # Copy sources (including Makefile)
  cp -r "${_name}-${pkgver}"/* "${pkgdir}"/usr/src/"${_name}-${pkgver}"

  # Copy "acer-wmi-battery.conf" to "modules-load.d" directory
  install -Dm644 acer-wmi-battery.conf -t "${pkgdir}"/usr/lib/modules-load.d/
}