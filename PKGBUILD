# Maintainer: ferstar <zhangjianfei3@gmail.com>

_repo=ideapad-laptop-tb
_module_name=ideapad-laptop-tb
pkgname=${_module_name}-dkms
pkgver=r41.c3e6d73
pkgrel=1
pkgdesc="The IdeaPad ACPI Extras kernel modules for ThinkBook 2024 NoteBooks (DKMS)"
url="https://github.com/ferstar/${_repo}"
arch=('any')
license=('GPL2')
depends=('dkms')
makedepends=('git')
provides=("${_module_name}=${pkgver}")
conflicts=("${_module_name}")
source=("git+https://github.com/ferstar/${_repo}")
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
  install -Dm644 "${srcdir}"/"${_repo}"/dkms/blacklist-ideapad-laptop-tb-dkms.conf \
  "${pkgdir}"/etc/modprobe.d/blacklist-ideapad-laptop-tb-dkms.conf
  
}
