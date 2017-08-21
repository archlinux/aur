# Maintainer: Michael Brock <velo dot mcb at gmail dot com>
#
# adapted from package "e1000e-dkms"
pkgname=e1000e-dkms
_modname=e1000e
pkgver=3.3.5.10
pkgrel=2
pkgdesc="Intel e1000e Ethernet adapter driver (latest version from Intel) (DKMS version)"
license=('GPL')
arch=('i686' 'x86_64')
depends=('dkms')
optdepends=('linux-headers: build the module against Arch kernel [requires at least one set of kernel headers]'
            'linux-ck-headers: build the module against Linux-ck kernel [requires at least one set of kernel headers]'
            'linux-lts-headers: build the module against LTS Arch kernel [requires at least one set of kernel headers]')
install=e1000e-dkms.install
url='http://sourceforge.net/projects/e1000/'
source=("http://downloads.sourceforge.net/project/e1000/${_modname}%20stable/${pkgver}/${_modname}-${pkgver}.tar.gz"
        'dkms.conf.in'
        'build-fix.patch')
sha256sums=('d18ec1ff96f570a732bcec0204478e29427e07ad6354c6d0aedf3fb79314bcad'
            '635b6c312c18db94e852248e0f5a1238e179ef1c0ebba2cdd0983afdb56efaf4'
            'd30c5d46d9f9b5e9c7ddcb3bd21303f585e04545571156fe3130d9f72922d0e0')

prepare() {
  cd ${srcdir}/${_modname}-${pkgver}
  patch -p1 <"$srcdir"/build-fix.patch
}

package() {
  cd ${srcdir}/${_modname}-${pkgver}
  install -dm755 "${pkgdir}/usr/src/${_modname}-${pkgver}/"
  for i in "${srcdir}/${_modname}-${pkgver}/src/"{Makefile,*.c,*.h}; do
    install -D -m644 "${i}" "${pkgdir}/usr/src/${_modname}-${pkgver}/"
  done
  sed "s/#MODULE_VERSION#/${pkgver}/" "${srcdir}/dkms.conf.in" > "${pkgdir}/usr/src/${_modname}-${pkgver}/dkms.conf"
}
