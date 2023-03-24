# Maintainer: João de Felipe <joaodefelipe@gmail.com>
_pkgbase=xt_wgobfs
pkgname=${_pkgbase}-dkms
pkgver=0.4.1
pkgrel=1
pkgdesc='iptables WireGuard obfuscation extension'
arch=('x86_64')
url='https://github.com/infinet/xt_wgobfs'
license=('GPL')
depends=('dkms' 'iptables')
source=("https://github.com/infinet/xt_wgobfs/releases/download/v${pkgver}/xt_wgobfs-${pkgver}.tar.xz" 'dkms.conf' 'Makefile' '0001-Fix-builds-on-iptables-version-1.8.9-or-newer.patch')
sha256sums=('5ea0e36ac96816e558132fdaa49746af53ab0f71c690baac6ca29e5561efe584' 'SKIP' 'SKIP' 'SKIP')

prepare() {
  # Awaiting merge at https://github.com/infinet/xt_wgobfs/pull/15
  cd "${srcdir}/${_pkgbase}-${pkgver}"
  patch -p1 -i ../0001-Fix-builds-on-iptables-version-1.8.9-or-newer.patch
}

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
