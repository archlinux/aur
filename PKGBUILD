# Maintainer: Samuel Dolt <samuel@dolt.ch>
pkgname=waspmote-pro-ide
pkgver=05
pkgrel=1
pkgdesc="Waspmote Pro IDE from Libelium"
arch=("x86_64")
url="http://www.libelium.com/development/waspmote/sdk_applications/"
license=("unknow")
depends=("gtk2" "java-runtime=8" "avrdude")
options=(!strip)

source=("http://downloads.libelium.com/$pkgname-v$pkgver-linux64.zip")


sha1sums=("52646238eb9e8ddabbd50214065a1736a7c3b8a2")

package() {
  cd "$pkgname-v$pkgver-linux64"

  # Creating directories
  install -dm755 "${pkgdir}/usr/share/${pkgname}"
  install -dm755 "${pkgdir}/usr/share/icons/hicolor"
  install -dm755 "${pkgdir}/usr/share/applications"

  # Copy all files to /usr/share/${pkgname}
  cp -r . "${pkgdir}/usr/share/${pkgname}/"
  rm "${pkgdir}/usr/share/${pkgname}/hardware/tools/avr/bin/avrdude"

  # Fix file permissions
  chmod 755 "${pkgdir}/usr/share/${pkgname}"
  chmod -R 755 "${pkgdir}/usr/share/${pkgname}"

  # Remove wrong file:
  #  - waspmote-pro-ide E: Insecure RPATH '/home/jenkins/jenkins/jobs/toolchain-avr-linux64/workspace/objdir/lib' in file ('usr/share/waspmote-pro-ide/hardware/tools/avr/lib/libusb-0.1.so.4.4.4')
  #  - waspmote-pro-ide E: Insecure RPATH '/home/jenkins/jenkins/jobs/toolchain-avr-linux64/workspace/objdir/lib' in file ('usr/share/waspmote-pro-ide/hardware/tools/avr/lib/libusb-0.1.so.4')
  rm "${pkgdir}/usr/share/waspmote-pro-ide/hardware/tools/avr/lib/libusb-0.1.so.4.4.4"
  rm "${pkgdir}/usr/share/waspmote-pro-ide/hardware/tools/avr/lib/libusb-0.1.so.4"

  # Provided avrdude need libreadline.so.6 but archlinux only provide libreadline.so.7
  # So we use Archlinux version of avrdude to work around
  ln -s /usr/bin/avrdude "${pkgdir}/usr/share/${pkgname}/hardware/tools/avr/bin/avrdude"

  # Install desktop icons (keep a symlink for the waspmote binary)
  cp -r lib/icons/* "${pkgdir}/usr/share/icons/hicolor"
  chmod -R 755 "${pkgdir}/usr/share/icons/hicolor"

  rm -rf "${pkgdir}/usr/share/arduino/lib/icons"
  ln -s /usr/share/icons/hicolor "${pkgdir}/usr/share/${pkgname}/lib/icons"

  # Create *.desktop file using the existing template file
  sed "s,<BINARY_LOCATION>,/usr/share/${pkgname}/waspmote %U,g;s,<ICON_NAME>,wasp_ico,g" "lib/desktop.template" \
  > "${pkgdir}/usr/share/applications/${pkgname}.desktop"
}
