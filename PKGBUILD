# Maintainer: Fabian Angenoorth <fabian-ang at mailbox dot org>
# Contributor: Niels Martignène <niels.martignene@gmail.com>
# Contributor: PyroPeter <googlemail.com@abi1789>
# Contributor: darkapex <me@jailuthra.in>
# Contributor: tty0 <vt.tty0[d0t]gmail.com>

pkgname=teensyduino
pkgver=1.57
_arduinover=1.8.19
_pkgname_loader="teensy_loader_cli"
_pkgver_loader=2.2
pkgrel=1
pkgdesc="Arduino SDK with Teensyduino"
arch=('x86_64')
url="http://www.pjrc.com/teensy/teensyduino.html"
options=(!strip staticlibs)
license=('GPL' 'LGPL' 'custom')
depends=('gtk2' 'libusb-compat' 'libusb' 'java-runtime' 'libpng12' 'libsm'
         'desktop-file-utils' 'giflib')
makedepends=('git')
provides=('arduino' 'teensy-loader' 'teensy-loader-cli')
conflicts=('arduino' 'teensy-loader' 'teensy-loader-cli' 'teensy-loader-cli-git')
install="teensyduino.install"
source=('arduino.xml'
        'teensy-loader.desktop'
        "$_pkgname_loader-$_pkgver_loader.tar.gz::https://github.com/PaulStoffregen/$_pkgname_loader/archive/$_pkgver_loader.tar.gz"
        "https://www.pjrc.com/teensy/00-teensy.rules"
        'LICENSE'
        "http://downloads.arduino.cc/arduino-${_arduinover}-linux64.tar.xz"
        "TeensyduinoInstall_${pkgver//./}_x86_64::http://www.pjrc.com/teensy/td_${pkgver//./}/TeensyduinoInstall.linux64")

sha256sums=('473b82156505e9bd903e4d8484e8d183f2e3bf3c1f7e29940b815929ae597b68'
            '837a865ab3bf81163c95a8a5898f9d5f0de7740a4207949bc331409cbb40faba'
            '103c691f412d04906c4f46038c234d3e5f78322c1b78ded102df9f900724cd54'
            '17f56b63603271e2cdae291fed347b66dfbdfd089b2847cf0b4383c877ffacfb'
            '25980feb5927b8bea8b8e999f5002e110825b1bc3d546fa902c2db5c824d33f3'
            'eb68bddc1d1c0120be2fca1350a03ee34531cf37f51847b21210b6e70545bc9b'
            '0864870639593f4b1df5e9cf7cb6eb6e8e1d9446d0745e6f448d813288ace400')

build() {
  echo "Installing Teensyduino"

  chmod +x "TeensyduinoInstall_${pkgver//./}_${CARCH}"
  ./TeensyduinoInstall_${pkgver//./}_${CARCH} --dir="${srcdir}/arduino-${_arduinover}"

  echo "Building Teensy Loader command line"

  cd $_pkgname_loader-$_pkgver_loader
  make
}

package() {
  cd "arduino-${_arduinover}"

  mkdir -p "${pkgdir}/usr/bin"
  mkdir -p "${pkgdir}/usr/share/"{applications,icons/hicolor,mime/packages,licenses/teensyduino}
  mkdir -p "${pkgdir}/etc/udev/rules.d"

  # copy the whole SDK to /usr/share/arduino/
  cp -a . "${pkgdir}/usr/share/arduino"

  ln -s /usr/share/arduino/arduino "${pkgdir}/usr/bin/arduino"

  # remove bundled java to use system's java environment
  rm -rf "${pkgdir}/usr/share/arduino/java"

  # remove bundled arduino boards; they can be downloaded later in the board manager
  rm -rf "${pkgdir}/usr/share/arduino/hardware/arduino"
  rm -rf "${pkgdir}/usr/share/arduino/hardware/tools/avr"

  # desktop icon
  cp -a lib/icons/* "${pkgdir}/usr/share/icons/hicolor"
  rm -rf "${pkgdir}/usr/share/arduino/lib/icons"
  ln -s /usr/share/icons/hicolor "${pkgdir}/usr/share/arduino/lib/icons"

  # desktop and mimetype files
  sed "s,<BINARY_LOCATION>,arduino %U,g;s,<ICON_NAME>,arduino,g" lib/desktop.template > "${pkgdir}/usr/share/applications/arduino.desktop"
  install -m644 "${srcdir}/arduino.xml" "${pkgdir}/usr/share/mime/packages/"

  # install custom PJRC license
  install -m644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/teensyduino/"

  # install teensy udev rule
  install -m644 "${srcdir}/00-teensy.rules" "${pkgdir}/etc/udev/rules.d"

  # install teensy loader files
  ln -s /usr/share/arduino/hardware/tools/teensy "${pkgdir}/usr/bin/teensy-loader"
  install -m644 "${srcdir}/teensy-loader.desktop" "${pkgdir}/usr/share/applications/"

  # install command-line teensy loader
  install -m755 "${srcdir}/$_pkgname_loader-$_pkgver_loader/$_pkgname_loader" "${pkgdir}/usr/bin/$_pkgname_loader"
}
