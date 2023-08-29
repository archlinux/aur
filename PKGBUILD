# Maintainer: João de Felipe <joaodefelipe@gmail.com>
_pkgbase=xt_wgobfs
pkgname=${_pkgbase}-dkms
pkgver=0.4.2
pkgrel=1
pkgdesc='iptables WireGuard obfuscation extension'
arch=(i686 x86_64)
url='https://github.com/infinet/xt_wgobfs'
license=('GPL')
depends=('dkms' 'iptables')
source=("https://github.com/infinet/xt_wgobfs/releases/download/v${pkgver}/xt_wgobfs-${pkgver}.tar.xz" 'dkms.conf' 'Makefile')
sha256sums=('09fa493d8305e1fa3224a940cab607b1860a9b5d9d395615105c7009e2bec767' 'SKIP' 'SKIP')

build() {
  cd "${srcdir}/${_pkgbase}-${pkgver}"
  ./autogen.sh
  ./configure
  make libxt-local
}

package() {
  # Install kernel module sources
  install -Dm644 dkms.conf Makefile -t "${pkgdir}/usr/src/${_pkgbase}-${pkgver}/"
  sed -e "s/@_PKGBASE@/${_pkgbase}/" \
      -e "s/@PKGVER@/${pkgver}/" \
      -i "${pkgdir}/usr/src/${_pkgbase}-${pkgver}/dkms.conf"
  cd "${srcdir}/${_pkgbase}-${pkgver}/src"
  install -Dm644 Kbuild chacha8.c chacha8.h wg.h xt_WGOBFS.h xt_WGOBFS_main.c -t "${pkgdir}/usr/src/${_pkgbase}-${pkgver}/"

  # Install extension
  cd "${srcdir}/${_pkgbase}-${pkgver}"
  mkdir -p "${pkgdir}/usr/lib/xtables"
  make libxt-install DESTDIR="${pkgdir}"
}
