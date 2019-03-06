pkgname=ubertooth
pkgver=2018.12.R1
_pkgver=2018-12-R1
pkgrel=1
pkgdesc="Open source wireless development platform suitable for Bluetooth experimentation"
url="https://github.com/greatscottgadgets/ubertooth/"
arch=('x86_64' 'i686')
license=('GPL')
depends=('bluez-libs' 'libbtbb>=2018.12.R1' 'libusbx' 'libpcap' 'python2-pyside2' 'python2-numpy' 'python2-pyusb' 'qt5-declarative')
makedepends=('cmake')
source=("https://github.com/greatscottgadgets/ubertooth/releases/download/${_pkgver}/ubertooth-${_pkgver}.tar.xz")
sha256sums=('0042daa79db0f4148a0255cdf05aa57006e23ac36edf7024e9e99ccc4892867b')

build() {
  cd "${srcdir}/${pkgname}-${_pkgver}/host/"
  mkdir -p build
  cd build
  cmake -DENABLE_PYTHON=FALSE -DCMAKE_INSTALL_PREFIX=${pkgdir}/usr -DUDEV_RULES_PATH=${pkgdir}/etc/udev/rules.d -DINSTALL_UDEV_RULES=TRUE -DUDEV_RULES_GROUP=uucp ..
  make
  cd ../python/specan_ui
  python2 setup.py build
}

package() {
  # Runtime
  cd "${srcdir}/${pkgname}-${_pkgver}/host/build/"
  make install

  # GUI
  cd ../python/specan_ui
  python2 setup.py install --root="${pkgdir}/" --optimize=1 --skip-build

  # Firmware
  install -dm755 "${pkgdir}/usr/share/ubertooth"
  cd "${srcdir}/ubertooth-${_pkgver}"
  cp -r "ubertooth-one-firmware-bin" "${pkgdir}/usr/share/ubertooth/ubertooth-one-firmware-bin"
  cp -r "firmware" "${pkgdir}/usr/share/ubertooth/firmware"
}
