# Maintainer: Nicholas Wang <me at nicho1as dot wang>

_pkgbase=hid-winwing2
pkgname=${_pkgbase}-dkms-git
pkgver=r33.ed72f10
pkgrel=3
pkgdesc="Linux kernel driver for Winwing WINCTRL Orion2 Throttles"
url="https://github.com/igorinov/linux-winwing"
arch=('any')
license=('GPL2')
depends=('dkms')
source=(
  "${_pkgbase}::git+https://github.com/igorinov/linux-winwing.git"
  "dkms.conf"
  "Makefile"
)

sha256sums=('SKIP'
            '986f4b410d97660d623d0a4f2001c533d1163c133537d5af4a689b4c6bc47185'
            'a0d5de62ea5dd31a1377b4538fa5775982cc209a113737b95f5ca425ad5f2b85')

pkgver() {
  cd "${srcdir}/${_pkgbase}"
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

package() {
  cd "${srcdir}/"
  local install_dir="${pkgdir}"/usr/src/${_pkgbase}-${pkgver}
  install -Dm644 dkms.conf "${install_dir}/dkms.conf"
  # Set name and version
  sed -e "s/@_PKGBASE@/${_pkgbase}/" \
      -e "s/@PKGVER@/${pkgver}/" \
      -i "${install_dir}"/dkms.conf

  install -Dm644 Makefile "${install_dir}/Makefile"
  install -Dm644 "${srcdir}/${_pkgbase}/hid-winwing2.c" "${install_dir}/hid-winwing2.c"
  echo 'MODULE_LICENSE("GPL");' >> "${install_dir}/hid-winwing2.c"
  echo 'MODULE_DESCRIPTION("Driver for Winwing WINCTRL Orion2 Throttles.");' >> "${install_dir}/hid-winwing2.c"
}
