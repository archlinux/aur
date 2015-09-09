# Maintainer: Niels Martignène <niels.martignene@gmail.com>
# Contributor: PyroPeter <googlemail.com@abi1789>
# Contributor: darkapex <me@jailuthra.in>
# Contributor: tty0 <vt.tty0[d0t]gmail.com>

pkgname=arduino
epoch=1
_arduino=1.6.5-r5
pkgver=1.6.5.r5
pkgrel=1
pkgdesc="Arduino prototyping platform SDK"
arch=('i686' 'x86_64')
url="http://arduino.cc/en/Main/Software"
options=(!strip staticlibs)
license=('GPL' 'LGPL')
depends=('gtk2' 'libusb-compat' 'java-runtime' 'desktop-file-utils' 'libtinfo' 'giflib')
makedepends=('icoutils')
install="arduino.install"
source=('arduino.desktop'
        'arduino.xml')
source_i686+=("http://downloads.arduino.cc/arduino-${_arduino}-linux32.tar.xz")
source_x86_64+=("http://downloads.arduino.cc/arduino-${_arduino}-linux64.tar.xz")
sha256sums=('ee29f80cc63cf3a21e844372721686372c2ca4b36e35430350d72e0b788a0ae2'
            '473b82156505e9bd903e4d8484e8d183f2e3bf3c1f7e29940b815929ae597b68')
sha256sums_i686=('deeb345c2e01d38f37f2860c764030c1aabfbda06ef7b348e798bfdc378e25ba')
sha256sums_x86_64=('38eb40574d0335dee09f8a34c9870985aca65cb8e9b7625e71c47aea6e1957f4')

build() {
  cd "arduino-${_arduino}"

  icotool -x -o .. lib/arduino_icon.ico
}

package() {
  cd "arduino-${_arduino}"

  mkdir -p "${pkgdir}/usr/bin"
  mkdir -p "${pkgdir}/usr/share/"{doc,applications,mime/packages}

  # copy the whole SDK to /usr/share/arduino/
  cp -a . "${pkgdir}/usr/share/arduino"

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
