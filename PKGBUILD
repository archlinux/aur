# Maintainer: Frederic Van Assche <frederic@fredericva.com>

pkgname=caenusbdrv
pkgver=1.4
pkgrel=2
pkgdesc='CAEN DT57xx-N67xx-DT55xx-V1718-N957 Linux USB Driver'
arch=('i686' 'x86_64')
url='http://www.caen.it/csite/CaenProd.jsp?idmod=417&parent=11'
license=('GPLv2+')
install='caenusbdrv.install'
source=("file://CAENUSBdrvB-${pkgver}.tgz"
        'caenusbdrv.install'
        'linux-3.19.patch')
depends=('linux>=3.19')
makedepends=('linux-headers>=3.19')
sha256sums=('f3ce3f0ae15e8d69bb32a111b728a3aa4ee9a31db14522627a04350fa5e20f64'
            '5fe77294921ae17e909460efea34fab5c4805ed63dcf57abd7441d39cba9638e'
            '25440c6621c361219b4e27dbce0dbb2b9be4a35ad1597f9470f9a99ad593a871')

_exmodver=$(uname -r | sed "s@\([0-9]*\.[0-9]*\)\.[0-9]*-[0-9]*\(.*\)@\1\2@")

build() {
  cd "${srcdir}/CAENUSBdrvB-${pkgver}"
  patch -p0 -i "${srcdir}/linux-3.19.patch"
  make KERNELPATH=/usr/lib/modules/$(uname -r)/build
  echo "KERNEL==\"v1718_[0-9]\", SYMLINK+=\"usb/%k\", MODE=\"0666\"" > 10-CAEN-USB.rules
}

package() {
  cd "${srcdir}/CAENUSBdrvB-${pkgver}"
  install -D -m644 CAENUSBdrvB.ko "${pkgdir}/usr/lib/modules/extramodules-${_exmodver}/CAENUSBdrvB.ko"
  install -D -m644 10-CAEN-USB.rules "${pkgdir}/usr/lib/udev/rules.d/10-CAEN-USB.rules"
}
