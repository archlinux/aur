# Maintainer: Niels Martignène <niels.martignene@gmail.com>
# Contributor: PyroPeter <googlemail.com@abi1789>
# Contributor: darkapex <me@jailuthra.in>
# Contributor: tty0 <vt.tty0[d0t]gmail.com>

pkgname=arduino
epoch=1
pkgver=1.6.5
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
source_i686+=("http://downloads.arduino.cc/arduino-${pkgver}-linux32.tar.xz")
source_x86_64+=("http://downloads.arduino.cc/arduino-${pkgver}-linux64.tar.xz")
sha256sums=('ee29f80cc63cf3a21e844372721686372c2ca4b36e35430350d72e0b788a0ae2'
            '473b82156505e9bd903e4d8484e8d183f2e3bf3c1f7e29940b815929ae597b68')
sha256sums_i686=('98a0edc24cada4aaaa71884b045857cc500602e8c55d7186430b771783e6a687')
sha256sums_x86_64=('33d5ebbc31e524fd618c42c3f8f65c0d5a558ede8d44c76885ef9a0273414f25')

build() {
  cd "arduino-${pkgver}"

  icotool -x -o .. lib/arduino_icon.ico
}

package() {
  cd "arduino-${pkgver}"

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
