# Maintainer: krnlsoft <krnlsoft 4t hotmail d0t it>

_pkgbase=blksnap
_pkgname=veeam${_pkgbase}
pkgname=${_pkgname}-dkms
pkgver=6.3.2.1207
pkgrel=1
pkgdesc="Veeam Agent for Linux kernel modules (DKMS)"
arch=('x86_64')
url="https://repository.veeam.com/backup/linux/agent"
license=('GPL')
depends=('dkms')
conflicts=("${_pkgbase}")
source=("${url}/rpm/el/9/x86_64/blksnap-${pkgver}-1.noarch.rpm"
        'dkms.conf'
        'kernel-6.15.patch')
sha256sums=('bb97964683d1e9e3a5ea311e763feca748ce7aec8c405a4ee9082d9915c5b596'
  '21a182149740160df2d3475fad4142a08d8fc850e0234d32922472f7e4aa66fc'
  'a2b87570a72e1f965414825ef4256f0721f57b1dd430f4410bb9dcc8029ac930')

prepare() {
  patch -d "${srcdir}/usr/src/${_pkgbase}-${pkgver}" -p1 -i "${srcdir}/kernel-6.15.patch"
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
