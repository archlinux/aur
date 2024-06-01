# Maintainer: Terry Wong <terry.wong2@yahoo.com>

_repo=ideapad-laptop-tb2024g6plus
_module_name=ideapad-laptop-tb2024g6plus
pkgname=${_module_name}-dkms
pkgver=6.9.r0.ge7ca655
pkgrel=1
pkgdesc="The IdeaPad ACPI Extras kernel modules for ThinkBook 2024 G6+ (DKMS)"
url="https://github.com/ty2/${_repo}"
arch=('any')
license=('GPL2')
depends=('dkms')
makedepends=('git')
provides=("${_module_name}=${pkgver}")
conflicts=("${_module_name}")
source=("git+https://github.com/ty2/${_repo}#tag=6.9")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}"/"$_repo" || exit
  ( set -o pipefail
    git describe --long --abbrev=7 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
  )
}

package() {
  _dkms_dest="${pkgdir}"/usr/src/${_module_name}-${pkgver}
  
  # create dkms dest dir
  mkdir -p "${_dkms_dest}"
  
  # copy sources (including Makefile)
  cp -r "${srcdir}"/"${_repo}"/* "${_dkms_dest}"

  # copy dkms.conf
  install -Dm644 "${srcdir}"/"${_repo}"/dkms/dkms.conf "${_dkms_dest}"/dkms.conf

  # update dkms package version
  sed -i "s/PACKAGE_VERSION=.*/PACKAGE_VERSION=\"${pkgver}\"/g" "${_dkms_dest}"/dkms.conf

  # copy module blacklist
  install -Dm644 "${srcdir}"/"${_repo}"/dkms/blacklist-ideapad-laptop-tp2024g6plus-dkms.conf \
  "${pkgdir}"/etc/modprobe.d/blacklist-ideapad-laptop-tp2024g6plus-dkms.conf
  
}
