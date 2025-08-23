# Maintainer: steelt <steeltitanium1 at gmail dot com>

_pkgbase=msi-ec
pkgname=msi-ec-dkms-git
pkgver=r508.9721905
pkgrel=1
pkgdesc="Driver for MSI laptop EC (DKMS)"
arch=('x86_64')
license=('GPL2')
url="https://github.com/BeardOverflow/msi-ec"
depends=('dkms')
makedepends=('git')
conflicts=("${_pkgbase}")
source=("git+https://github.com/BeardOverflow/msi-ec.git")
sha256sums=('SKIP')

pkgver() {
    cd ${_pkgbase}
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  mkdir -p "${pkgdir}/etc/modules-load.d/"
  cd "${_pkgbase}"

  install -Dm644 -t "${pkgdir}/usr/src/${_pkgbase}-${pkgver}" \
    Makefile \
    msi-ec.c \
    ec_memory_configuration.h \
    dkms.conf

  sed -e "s/@VERSION@/${pkgver}/" \
      -i "${pkgdir}"/usr/src/${_pkgbase}-${pkgver}/dkms.conf     

  echo "msi-ec" > "${pkgdir}/etc/modules-load.d/msi-ec.conf"
}
