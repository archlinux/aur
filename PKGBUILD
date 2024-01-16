# Maintainer: João de Felipe <joaodefelipe@gmail.com>
_pkgbase=xt_wgobfs
pkgname=${_pkgbase}-dkms
pkgver=0.5.0
pkgrel=1
pkgdesc='iptables WireGuard obfuscation extension'
arch=(i686 x86_64)
url='https://github.com/infinet/xt_wgobfs'
license=('GPL')
depends=('dkms' 'iptables')
source=("https://github.com/infinet/xt_wgobfs/releases/download/v${pkgver}/xt_wgobfs-${pkgver}.tar.xz" 'dkms.conf' 'Makefile')
sha256sums=('3d1c6304b92b1977aeeafa875323b85bdbe69272c481aa5c07c39051fef92655' 'SKIP' 'SKIP')

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
  install -Dm644 Kbuild chacha.c chacha.h wg.h xt_WGOBFS.h xt_WGOBFS_main.c -t "${pkgdir}/usr/src/${_pkgbase}-${pkgver}/"

  # Install extension
  cd "${srcdir}/${_pkgbase}-${pkgver}"
  mkdir -p "${pkgdir}/usr/lib/xtables"
  make libxt-install DESTDIR="${pkgdir}"
}
