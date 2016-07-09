# Maintainer: Christopher Loen <christopherloen at gmail dot com>
# Co-Maintainer: NicoHood <aur {at} nicohood {dot} de>
# Contributor: Peter Reschenhofer <peter.reschenhofer@gmail.com>
# Contributor: Niels Martignène <niels.martignene@gmail.com>
# Contributor: PyroPeter <googlemail.com@abi1789>
# Contributor: darkapex <me@jailuthra.in>
# Contributor: tty0 <vt.tty0[d0t]gmail.com>

pkgname=arduino
pkgver=1.6.9
pkgrel=2
pkgdesc="Arduino prototyping platform SDK"
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
url="https://arduino.cc/en/Main/Software"
options=(!strip staticlibs)
license=('GPL' 'LGPL')
depends=('gtk2' 'desktop-file-utils' 'shared-mime-info' 'avrdude')
install="arduino.install"
source_i686=("https://downloads.arduino.cc/arduino-${pkgver}-linux32.tar.xz")
source_x86_64=("https://downloads.arduino.cc/arduino-${pkgver}-linux64.tar.xz")
source_armv6h=("https://downloads.arduino.cc/arduino-${pkgver}-linuxarm.tar.xz")
source_armv7h=("https://downloads.arduino.cc/arduino-${pkgver}-linuxarm.tar.xz")
sha256sums_i686=('b164905f281ad34ca4ca0d58b2b4c0d67d8125dbcd43ad73d536effd02ef8e56')
sha256sums_x86_64=('8da3920fe9e168bcf3fe31fef9e1f8454ba5366e7f2e297cf264485e59e8a1a0')
sha256sums_armv6h=('6a960d8a2e9559fa7496ee7341be81e7ec91e769beeb63a5de8d1f740996e53a')
sha256sums_armv7h=('6a960d8a2e9559fa7496ee7341be81e7ec91e769beeb63a5de8d1f740996e53a')


package() {
  cd "arduino-${pkgver}"

  install -dm755 "${pkgdir}/usr/bin"
  install -dm755 "${pkgdir}/usr/share/"{doc,icons/hicolor,applications,mime/packages}

  # Copy the whole SDK
  cp -a . "${pkgdir}/usr/share/arduino"

  # Create symlinks
  ln -s /usr/share/arduino/arduino "${pkgdir}/usr/bin/arduino"
  ln -s /usr/share/arduino/reference "${pkgdir}/usr/share/doc/arduino"

  # fix avrdude (see https://github.com/arduino/Arduino/issues/5094)
  rm -f "${pkgdir}/usr/share/arduino/hardware/tools/avr/bin/avrdude"{,_bin}
  ln -s /usr/bin/avrdude "${pkgdir}/usr/share/arduino/hardware/tools/avr/bin/avrdude"

  # Install desktop icons (keep a symlink for the arduino binary)
  cp -a lib/icons/* "${pkgdir}/usr/share/icons/hicolor"
  rm -rf "${pkgdir}/usr/share/arduino/lib/icons"
  ln -s /usr/share/icons/hicolor "${pkgdir}/usr/share/arduino/lib/icons"

  # Create desktop file using existing template
  sed "s,<BINARY_LOCATION>,arduino %U,g;s,<ICON_NAME>,arduino,g" "lib/desktop.template" \
  > "${pkgdir}/usr/share/applications/arduino.desktop"

  # Install Arduino mime type
  ln -s /usr/share/arduino/lib/arduino-arduinoide.xml "${pkgdir}/usr/share/mime/packages/arduino.xml"
}
