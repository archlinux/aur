# Maintainer: Niels Martignène <niels.martignene@gmail.com>
# Contributor: PyroPeter <googlemail.com@abi1789>
# Contributor: darkapex <me@jailuthra.in>
# Contributor: tty0 <vt.tty0[d0t]gmail.com>

pkgname=arduino
epoch=1
pkgver=1.6.8
_pkgver=1.6.8
pkgrel=1
pkgdesc="Arduino prototyping platform SDK"
arch=('i686' 'x86_64')
url="http://arduino.cc/en/Main/Software"
options=(!strip staticlibs)
license=('GPL' 'LGPL')
depends=('gtk2' 'libusb-compat' 'java-runtime' 'desktop-file-utils' 'giflib' 'avrdude')
makedepends=('icoutils')
install="arduino.install"
source=('arduino.desktop'
        'arduino.xml')
source_i686+=("http://downloads.arduino.cc/arduino-${_pkgver}-linux32.tar.xz")
source_x86_64+=("http://downloads.arduino.cc/arduino-${_pkgver}-linux64.tar.xz")
sha256sums=('ee29f80cc63cf3a21e844372721686372c2ca4b36e35430350d72e0b788a0ae2'
            '473b82156505e9bd903e4d8484e8d183f2e3bf3c1f7e29940b815929ae597b68')
sha256sums_i686=('a8ba68eec71f763b6968d99b721c60acef27ffb2d2f2a1b7f358855f4664151e')
sha256sums_x86_64=('d268e8e65d84d83172c788737ec01043735213c8e8c326b7d502d4209748b59e')

build() {
  cd "arduino-${_pkgver}"

  icotool -x -o .. lib/arduino_icon.ico
}

package() {
  cd "arduino-${_pkgver}"

  mkdir -p "${pkgdir}/usr/bin"
  mkdir -p "${pkgdir}/usr/share/"{doc,applications,mime/packages}

  # copy the whole SDK to /usr/share/arduino/
  cp -a . "${pkgdir}/usr/share/arduino"

  # at least support the FHS a little bit
  ln -s /usr/share/arduino/arduino "${pkgdir}/usr/bin/arduino"
  ln -s /usr/share/arduino/reference "${pkgdir}/usr/share/doc/arduino"

  # fix avrdude
  rm -f "${pkgdir}/usr/share/arduino/hardware/tools/avr/bin/avrdude"{,_bin}
  ln -s /usr/bin/avrdude "${pkgdir}/usr/share/arduino/hardware/tools/avr/bin/avrdude"

  # desktop icon
  for size in 16 32 48 256; do
    install -Dm644 ../arduino_icon_*_${size}x${size}x32.png \
      "${pkgdir}/usr/share/icons/hicolor/${size}x${size}/apps/arduino.png"
  done

  # desktop and mimetype files
  install -m644 "${srcdir}/arduino.desktop" "${pkgdir}/usr/share/applications/"
  install -m644 "${srcdir}/arduino.xml" "${pkgdir}/usr/share/mime/packages/"
}
