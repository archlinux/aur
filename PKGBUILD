# Maintainer: Ryan Barillos < ryan dot barillos at proton dot me >

# Custom variables
_name="acer-wmi-battery"
_user="frederik-h"
_ver=0.1.0  # Based on current version of released package

# Main info
pkgname="${_name}-dkms-git"
pkgver="r11.4e605fb"
pkgrel=1
pkgdesc="For Acer laptops -- kernel module to set Battery Charge Limit to 80%."
arch=('any')
url="https://github.com/${_user}/${_name}"
license=('GPL-2.0')
groups=('acer-wmi')
depends=("dkms")
makedepends=("git")
provides=("${_name}-dkms")
conflicts=("${_name}-dkms")
install="${_name}.install"
source=(
  "${_name}::git+https://github.com/${_user}/${_name}.git"
  "${_name}.conf"
  "dkms.conf"
  )
sha256sums=(
  "SKIP"
  "35988ccdeee6343d66b9ec99a47ee9fe9577932fc48158083df241ca3b5b3096"
  "d62ec611940ae5bf1b67ee47634811b901bf6f569eba516dd6e43cd6680d7a90"
  )

pkgver() {
  cd "${_name}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

package() {
  # Copy dkms.conf
  install -Dm644 dkms.conf -t "${pkgdir}"/usr/src/"${_name}-${_ver}/"

  # Set version
  sed -e "s/@PKGVER@/${_ver}/" \
      -i "${pkgdir}"/usr/src/"${_name}-${_ver}"/dkms.conf

  # Copy sources (including Makefile)
  cp -r "${srcdir}/${_name}"/*  "${pkgdir}"/usr/src/"${_name}-${_ver}"

  # Copy "acer-wmi-battery.conf" to "modules-load.d" directory
  install -Dm644 acer-wmi-battery.conf -t "${pkgdir}"/usr/lib/modules-load.d/
}
