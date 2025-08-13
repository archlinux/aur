# Maintainer: João de Felipe <joaodefelipe@gmail.com>
_pkgbase=xt_wgobfs
pkgname=${_pkgbase}-dkms
pkgver=0.6.2
pkgrel=1
pkgdesc='iptables WireGuard obfuscation extension'
arch=(i686 x86_64)
url='https://github.com/infinet/xt_wgobfs'
license=('GPL')
depends=('dkms' 'iptables')
source=("https://github.com/infinet/xt_wgobfs/releases/download/v${pkgver}/xt_wgobfs-${pkgver}.tar.xz")
sha256sums=('ba4c410c9dc304360d944249d5314ef4987515de381b1274873f8597928cb67f')

build() {
  cd "${_pkgbase}-${pkgver}"
  ./autogen.sh
  ./configure
  make -C src libxt-local
}

package() {
  cd "${_pkgbase}-${pkgver}"

  # Install kernel module sources
  mkdir -p "${pkgdir}/usr/src"
  tar -C "${pkgdir}/usr/src" -xvf "${srcdir}/xt_wgobfs-${pkgver}.tar.xz"

  # Install extension
  mkdir -p "${pkgdir}/usr/lib/xtables"
  make -C src libxt-install DESTDIR="${pkgdir}"
}
