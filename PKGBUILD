# Maintainer: Frederic Van Assche <frederic@fredericva.com>

pkgname=caenusbdrv
pkgver=1.5.1
pkgrel=1
pkgdesc='CAEN DT57xx-N67xx-DT55xx-V1718-N957 Linux USB Driver'
arch=('i686' 'x86_64')
url='http://www.caen.it/csite/CaenProd.jsp?idmod=417&parent=11'
license=('GPLv2+')
install='caenusbdrv.install'
source=("file://CAENUSBdrvB-${pkgver}.tgz"
	'caenusbdrv.install')
depends=('linux>=3.19')
makedepends=('linux-headers>=3.19')
sha256sums=('eb5365da6ce229c8db4827944394e975d8fd4f46c19d8b8ce3f9b2f8b4c2ed9d'
            '5fe77294921ae17e909460efea34fab5c4805ed63dcf57abd7441d39cba9638e')

_exmodver=$(uname -r | sed "s@\([0-9]*\.[0-9]*\)\.[0-9]*-[0-9]*\(.*\)@\1\2@")

build() {
  cd "${srcdir}/CAENUSBdrvB-${pkgver}"
  make KERNELPATH=/usr/lib/modules/$(uname -r)/build
  echo "KERNEL==\"v1718_[0-9]\", SYMLINK+=\"usb/%k\", MODE=\"0666\"" > 10-CAEN-USB.rules
}

package() {
  cd "${srcdir}/CAENUSBdrvB-${pkgver}"
  install -D -m644 CAENUSBdrvB.ko "${pkgdir}/usr/lib/modules/extramodules-${_exmodver}/CAENUSBdrvB.ko"
  install -D -m644 10-CAEN-USB.rules "${pkgdir}/usr/lib/udev/rules.d/10-CAEN-USB.rules"
}
