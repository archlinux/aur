# Maintainer: Niels Martignène <niels.martignene@gmail.com>
# Contributor: PyroPeter <googlemail.com@abi1789>
# Contributor: darkapex <me@jailuthra.in>
# Contributor: tty0 <vt.tty0[d0t]gmail.com>

pkgname=arduino10
epoch=1
pkgver=1.0.6
pkgrel=2
pkgdesc="Arduino prototyping platform SDK (old version)"
arch=('i686' 'x86_64')
url="http://arduino.cc/en/Main/Software"
options=(!strip staticlibs)
license=('GPL' 'LGPL')
depends=('gtk2' 'libusb-compat' 'java-runtime' 'java-rxtx' 'desktop-file-utils')
makedepends=('icoutils')
conflicts=('arduino' 'arduino-toolchain')
install="arduino.install"
source=('arduino-fix-arguments.patch'
        'arduino.desktop'
        'arduino.xml')
source_i686+=("http://downloads.arduino.cc/arduino-${pkgver}-linux32.tgz")
source_x86_64+=("http://downloads.arduino.cc/arduino-${pkgver}-linux64.tgz")
sha256sums=('631921fce485d14c79bcdc31d5d6f3a95d729d49975390b6b785fe49d238ff65'
            'd817829bb2830cb690ed63f14d8a990bb513bef4a4ebc6227a82abdfc8bcd35d'
            '473b82156505e9bd903e4d8484e8d183f2e3bf3c1f7e29940b815929ae597b68')
sha256sums_i686+=('f059a572231abafb92099a3a404c0a41502c3413668610676c40029384edc658')
sha256sums_x86_64+=('1ff175c487de335981d3aad64cf212b56cb2c778a6bdd6655045335ffc65e147')

prepare() {
  cd "arduino-${pkgver}"

  patch -Np1 <"${srcdir}/arduino-fix-arguments.patch"

  icotool -x -o .. lib/arduino_icon.ico
}

package() {
  cd "arduino-${pkgver}"

  mkdir -p "${pkgdir}/usr/bin"
  mkdir -p "${pkgdir}/usr/share/"{doc,applications,mime/packages}

  # copy the whole SDK to /usr/share/arduino/
  cp -a . "${pkgdir}/usr/share/arduino"

  # use system's RXTX library
  ln -sf /usr/lib/librxtxSerial.so "${pkgdir}/usr/share/arduino/lib/librxtxSerial.so"
  ln -sf /usr/lib/librxtxSerial.so "${pkgdir}/usr/share/arduino/lib/librxtxSerial64.so"
  ln -sf /usr/share/java/rxtx/RXTXcomm.jar "${pkgdir}/usr/share/arduino/lib/RXTXcomm.jar"

  # at least support the FHS a little bit
  ln -s /usr/share/arduino/arduino "${pkgdir}/usr/bin/arduino"
  ln -s /usr/share/arduino/reference "${pkgdir}/usr/share/doc/arduino"

  # desktop icon
  for size in 16 32 48 256; do
    install -Dm644 ../arduino_icon_*_${size}x${size}x32.png \
      "${pkgdir}/usr/share/icons/hicolor/${size}x${size}/apps/arduino.png"
  done

  # desktop and mimetype files
  install -m644 "${srcdir}/arduino.desktop" "${pkgdir}/usr/share/applications/"
  install -m644 "${srcdir}/arduino.xml" "${pkgdir}/usr/share/mime/packages/"
}
