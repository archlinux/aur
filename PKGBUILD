# Maintainer: Niels Martignène <niels.martignene@gmail.com>
# Contributor: PyroPeter <googlemail.com@abi1789>
# Contributor: darkapex <me@jailuthra.in>
# Contributor: tty0 <vt.tty0[d0t]gmail.com>

pkgname=teensyduino
pkgver=1.45
_pkgver=1.45
_arduino=1.8.8
pkgrel=1
pkgdesc="Arduino SDK with Teensyduino"
arch=('i686' 'x86_64')
url="http://www.pjrc.com/teensy/teensyduino.html"
options=(!strip staticlibs)
license=('GPL' 'LGPL' 'custom')
depends=('gtk2' 'libusb-compat' 'libusb' 'java-runtime' 'libpng12' 'libsm'
         'desktop-file-utils' 'giflib' 'avrdude')
makedepends=('git')
provides=('arduino')
conflicts=('arduino' 'teensy-loader-cli')
install="teensyduino.install"
source=('arduino.xml'
        'teensy-loader.desktop'
        "git+https://github.com/PaulStoffregen/teensy_loader_cli.git#commit=d239f76f01f922e115c2661a6a3855dfc660a69c"
        "http://www.pjrc.com/teensy/49-teensy.rules"
        'LICENSE')
source_i686+=("http://downloads.arduino.cc/arduino-${_arduino}-linux32.tar.xz"
              "http://www.pjrc.com/teensy/td_${_pkgver//./}/TeensyduinoInstall.linux32")
source_x86_64+=("http://downloads.arduino.cc/arduino-${_arduino}-linux64.tar.xz"
                "http://www.pjrc.com/teensy/td_${_pkgver//./}/TeensyduinoInstall.linux64")
sha256sums=('473b82156505e9bd903e4d8484e8d183f2e3bf3c1f7e29940b815929ae597b68'
            '270b55353eb438d3790c7245e5ae16ff8bac9f98cfe927d6c9f2146a34499323'
            'SKIP'
            '031de0b26991b5a3b19c497d9c0a17f86c40c55d925b9d07d19ab89f2286469d'
            '25980feb5927b8bea8b8e999f5002e110825b1bc3d546fa902c2db5c824d33f3')
sha256sums_i686=('84a0d2bbb1e60e1fc7566b87b016614f981fee90b5cbeaa92d9a4b2f731f1496'
                 'a7d0b185000b3a490d34abf0b27d1cfecb8e54f6c129a01268d36cf2d0cae4dc')
sha256sums_x86_64=('7b261ffe4dea65a82a670afdd37c0e18a9e474154f17fbd480e90ddfd77ba3ea'
                   'ab67d725e0338278b2bbe5879175783dde224d26378811daf1db376ebf080859')

if [ "$CARCH" == 'x86_64' ]; then
  _bits=64
elif [ "$CARCH" == 'i686' ]; then
  _bits=32
fi

build() {
  msg2 "Installing Teensyduino"

  chmod +x "TeensyduinoInstall.linux${_bits}"
  ./TeensyduinoInstall.linux${_bits} --dir="${srcdir}/arduino-${_arduino}"

  msg2 "Building Teensy Loader command line"

  cd teensy_loader_cli
  make
}

package() {
  cd "arduino-${_arduino}"

  mkdir -p "${pkgdir}/usr/bin"
  mkdir -p "${pkgdir}/usr/share/"{doc,applications,icons/hicolor,mime/packages,licenses/teensyduino}
  mkdir -p "${pkgdir}/usr/lib/udev/rules.d"

  # copy the whole SDK to /usr/share/arduino/
  cp -a . "${pkgdir}/usr/share/arduino"

  # use system's RXTX library
  ln -sf /usr/lib/librxtxSerial.so "${pkgdir}/usr/share/arduino/lib/librxtxSerial.so"
  ln -sf /usr/lib/librxtxSerial.so "${pkgdir}/usr/share/arduino/lib/librxtxSerial64.so"
  ln -sf /usr/share/java/rxtx/RXTXcomm.jar "${pkgdir}/usr/share/arduino/lib/RXTXcomm.jar"

  # we don't need these sources
  rm -rf "${pkgdir}/usr/share/arduino/src"

  # at least support the FHS a little bit
  ln -s /usr/share/arduino/arduino "${pkgdir}/usr/bin/arduino"
  ln -s /usr/share/arduino/reference "${pkgdir}/usr/share/doc/arduino"

  # fix avrdude
  rm -f "${pkgdir}/usr/share/arduino/hardware/tools/avr/bin/avrdude"{,_bin}
  ln -s /usr/bin/avrdude "${pkgdir}/usr/share/arduino/hardware/tools/avr/bin/avrdude"

  # desktop icon
  cp -a lib/icons/* "${pkgdir}/usr/share/icons/hicolor"
  rm -rf "${pkgdir}/usr/share/arduino/lib/icons"
  ln -s /usr/share/icons/hicolor "${pkgdir}/usr/share/arduino/lib/icons"

  # desktop and mimetype files
  sed "s,<BINARY_LOCATION>,arduino %U,g;s,<ICON_NAME>,arduino,g" lib/desktop.template > "${pkgdir}/usr/share/applications/arduino.desktop"
  install -m644 "${srcdir}/arduino.xml" "${pkgdir}/usr/share/mime/packages/"

  # install custom PJRC license
  install -m644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/teensyduino/"

  # install teensy loader files
  install -m644 "${srcdir}/49-teensy.rules" "${pkgdir}/usr/lib/udev/rules.d"
  ln -s /usr/share/arduino/hardware/tools/teensy "${pkgdir}/usr/bin/teensy-loader"
  install -m644 "${srcdir}/teensy-loader.desktop" "${pkgdir}/usr/share/applications/"

  # install command-line teensy loader
  install -m755 "${srcdir}/teensy_loader_cli/teensy_loader_cli" "${pkgdir}/usr/bin/teensy-loader-cli"
}
