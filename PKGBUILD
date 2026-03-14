# Maintainer: Yegor Pomortsev <yegor@pomortsev.com>
# Contributor: krnlsoft <krnlsoft 4t hotmail d0t it>

_pkgbase=blksnap
_pkgname_nover=veeam${_pkgbase}
_pkgname=veeam${_pkgbase}-6
pkgname=${_pkgname}-dkms
pkgver=6.3.2.1307
pkgrel=1
pkgdesc="Veeam Agent for Linux kernel modules (v6, DKMS)"
arch=(x86_64)
url=https://www.veeam.com/products/downloads.html
license=(LicenseRef-GPL-2.0)
depends=(dkms)
conflicts=("${_pkgbase}" "veeam${_pkgbase}-dkms")
source=("https://repository.veeam.com/backup/linux/agent/rpm/el/10/x86_64/blksnap-${pkgver}-1.noarch.rpm"
        'dkms.conf'
        'kernel-6.15.patch')
sha256sums=('72574673319914083087725af1c99aca1e7d363c993ac0332d01192c2e0f27e8'
            '21a182149740160df2d3475fad4142a08d8fc850e0234d32922472f7e4aa66fc'
            'a2b87570a72e1f965414825ef4256f0721f57b1dd430f4410bb9dcc8029ac930')

prepare() {
  patch -d "${srcdir}/usr/src/${_pkgbase}-${pkgver}" -p1 -i "${srcdir}/kernel-6.15.patch"
}

package() {
  local target="${pkgdir}/usr/src/${_pkgname_nover}-${pkgver}"
  mkdir -p "${target}"

  # Copy sources (including Makefile)
  cp -r "${srcdir}/usr/src/${_pkgbase}-${pkgver}/." "${target}/"

  # Copy dkms.conf
  install -Dm644 dkms.conf "${target}/dkms.conf"

  # Set name and version
  sed -e "s/@_PKGBASE@/${_pkgname_nover}/" \
      -e "s/@PKGVER@/${pkgver}/" \
      -i "${target}/dkms.conf"
}
