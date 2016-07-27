# Maintainer: Christopher Loen <christopherloen at gmail dot com>
# Co-Maintainer: NicoHood <aur {at} nicohood {dot} de>
# Contributor: Peter Reschenhofer <peter.reschenhofer@gmail.com>
# Contributor: Niels Martignène <niels.martignene@gmail.com>
# Contributor: PyroPeter <googlemail.com@abi1789>
# Contributor: darkapex <me@jailuthra.in>
# Contributor: tty0 <vt.tty0[d0t]gmail.com>

pkgname=arduino-bin
pkgver=1.6.10
pkgrel=2
pkgdesc="Arduino prototyping platform SDK"
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
url="https://arduino.cc/en/Main/Software"
options=(!strip staticlibs)
license=('GPL' 'LGPL')
depends=('gtk2' 'desktop-file-utils' 'shared-mime-info' 'java-runtime=8')
provides=('arduino')
conflicts=('arduino' 'arduino-git')
install="arduino.install"
source_i686=("https://downloads.arduino.cc/arduino-${pkgver}-linux32.tar.xz")
source_x86_64=("https://downloads.arduino.cc/arduino-${pkgver}-linux64.tar.xz")
source_armv6h=("https://downloads.arduino.cc/arduino-${pkgver}-linuxarm.tar.xz")
source_armv7h=("https://downloads.arduino.cc/arduino-${pkgver}-linuxarm.tar.xz")
sha512sums_i686=('d90bf5b61e7b903cb6b806c548cbd1f2aa7f7d56aae4f5fed88dc2fe80ed5aed208e2ff143b5b7c47988cb3a301840e1d455b49271bc39d49ac49d566f2d56a1')
sha512sums_x86_64=('56cc8e66886c1ad61287c4b6d3d80385205969903304d1954c72a8011252b65f698a6d1d694fea64b8942d0847e96ad7c01534b876b947454b06b3219c1c1345')
sha512sums_armv6h=('30f81048e16866b9244e12cafb8e34f844b1461bb79d96c40f49f3b49d60fee7dd5770d4e5ef581c9beecd5157bd737fa6d082b9717cf422655ec20df750f755')
sha512sums_armv7h=('30f81048e16866b9244e12cafb8e34f844b1461bb79d96c40f49f3b49d60fee7dd5770d4e5ef581c9beecd5157bd737fa6d082b9717cf422655ec20df750f755')


package() {
  cd "arduino-${pkgver}"

  install -dm755 "${pkgdir}/usr/bin"
  install -dm755 "${pkgdir}/usr/share/"{doc,icons/hicolor,applications,mime/packages}

  # Copy the whole SDK
  cp -a . "${pkgdir}/usr/share/arduino"

  # Create symlinks
  ln -s /usr/share/arduino/arduino "${pkgdir}/usr/bin/arduino"
  ln -s /usr/share/arduino/reference "${pkgdir}/usr/share/doc/arduino"

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
