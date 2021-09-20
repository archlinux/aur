# Maintainer: Fabian Angenoorth <fabian-ang at mailbox dot org>
# Contributor: Niels Martignène <niels.martignene@gmail.com>
# Contributor: PyroPeter <googlemail.com@abi1789>
# Contributor: darkapex <me@jailuthra.in>
# Contributor: tty0 <vt.tty0[d0t]gmail.com>

pkgname=teensyduino
pkgver=1.55
_arduinover=1.8.16
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
        "git+https://github.com/PaulStoffregen/teensy_loader_cli.git#commit=9dbbfa3b367b6c37e91e8a42dae3c6edfceccc4d"
        "https://www.pjrc.com/teensy/00-teensy.rules"
        'LICENSE'
        "http://downloads.arduino.cc/arduino-${_arduinover}-linux64.tar.xz"
        "TeensyduinoInstall_${pkgver//./}_x86_64::http://www.pjrc.com/teensy/td_${pkgver//./}/TeensyduinoInstall.linux64")

sha256sums=('473b82156505e9bd903e4d8484e8d183f2e3bf3c1f7e29940b815929ae597b68'
            '837a865ab3bf81163c95a8a5898f9d5f0de7740a4207949bc331409cbb40faba'
            'SKIP'
            '17f56b63603271e2cdae291fed347b66dfbdfd089b2847cf0b4383c877ffacfb'
            '25980feb5927b8bea8b8e999f5002e110825b1bc3d546fa902c2db5c824d33f3'
            '54af92925db18ea3d660410ab750822f0059471a3245f610dffeb40727a7f69a'
            '0f2a426c29b844a6209c5251c281f23e1b7a7451b8f18bd633847310374913a5')

build() {
  echo "Installing Teensyduino"

  chmod +x "TeensyduinoInstall_${pkgver//./}_${CARCH}"
  ./TeensyduinoInstall_${pkgver//./}_${CARCH} --dir="${srcdir}/arduino-${_arduinover}"

  echo "Building Teensy Loader command line"

  cd teensy_loader_cli
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
  install -m755 "${srcdir}/teensy_loader_cli/teensy_loader_cli" "${pkgdir}/usr/bin/teensy-loader-cli"
}
