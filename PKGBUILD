# Maintainer: Terry Wong <terry.wong2@yahoo.com>

_repo=goodix-gt7868q-linux-driver
_module_name=goodix-gt7868q
pkgname=${_module_name}-dkms
pkgver=0.1.1.r0.g17720c7
pkgrel=2
pkgdesc="The Goodix GT7868Q kernel modules (DKMS)"
url="https://github.com/ty2/${_repo}"
arch=('any')
license=('GPL2')
depends=('dkms')
makedepends=('git')
provides=("${_module_name}=${pkgver}")
conflicts=("${_module_name}")
source=("git+https://github.com/ty2/${_repo}#tag=0.1.1")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}"/"$_repo" || exit
  ( set -o pipefail
    git describe --long --abbrev=7 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
  )
}

package() {
  # Copy sources
  _dkms_dest="${pkgdir}"/usr/src/${_module_name}-${pkgver}
  mkdir -p "${_dkms_dest}"
  cp -r "${srcdir}"/"${_repo}"/* "${_dkms_dest}/"

  # Copy dkms.conf
  install -Dm644 "${srcdir}"/"${_repo}"/dkms/dkms.conf "${_dkms_dest}"/dkms.conf
  sed -i "s/PACKAGE_VERSION=.*/PACKAGE_VERSION=\"${pkgver}\"/g" "${_dkms_dest}"/dkms.conf

  # Install libinput quirks
  install -Dm644 "${srcdir}"/"${_repo}"/local-overrides.quirks "${pkgdir}"/usr/share/libinput/60-custom-thinkbookg6p2024imh.quirks
}