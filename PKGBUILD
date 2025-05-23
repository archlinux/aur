# Maintainer: krnlsoft <krnlsoft 4t hotmail d0t it>

_pkgbase=blksnap
_pkgname=veeam${_pkgbase}
pkgname=${_pkgname}-dkms
pkgver=6.3.1.1016
pkgrel=2
pkgdesc="Veeam Agent for Linux kernel modules (DKMS)"
arch=('x86_64')
url="https://repository.veeam.com/backup/linux/agent"
license=('GPL')
depends=('dkms')
conflicts=("${_pkgbase}")
source=("${url}/rpm/el/9/x86_64/blksnap-${pkgver}-1.noarch.rpm"
        'dkms.conf'
        'kernel-6.14.patch')
sha256sums=('9763e46d56fd5058714cf5a56881c5774e61823e1579dff2b6d80743fbc27194'
  '21a182149740160df2d3475fad4142a08d8fc850e0234d32922472f7e4aa66fc'
  '0ac5759016d528ade7f5f78f6f76c0f4858d1f1c24a571f52eb9dfce0bfd97f1')

prepare() {
  patch -d "${srcdir}/usr/src/${_pkgbase}-${pkgver}" -p1 -i "${srcdir}/kernel-6.14.patch"
}

package() {
  local target="${pkgdir}/usr/src/${_pkgname}-${pkgver}"
  mkdir -p "${target}"

  # Copy sources (including Makefile)
  cp -r "${srcdir}/usr/src/${_pkgbase}-${pkgver}/." "${target}/"

  # Copy dkms.conf
  install -Dm644 dkms.conf "${target}/dkms.conf"

  # Set name and version
  sed -e "s/@_PKGBASE@/${_pkgname}/" \
      -e "s/@PKGVER@/${pkgver}/" \
      -i "${target}/dkms.conf"
}
