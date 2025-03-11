# Maintainer: lod <aur@cyber-anlage.de>
# Contributer: Ysblokje <ysblokje at gmail dot com>
# Contributer: Jeff Youdontneedtoknow <jeffpublicjr at gmail dot com>
# Contributer: Arnaud

pkgname=edgetx-companion
pkgver=2.11.0
pkgrel=1
pkgdesc="EEPROM Editor and Simulator for EdgeTX RC radio transmitter firmwares"
arch=('x86_64')
url='https://edgetx.org/'
license=('GPL-2.0-only')
depends=('gcc-libs' 'glibc' 'hicolor-icon-theme' 'qt5-base' 'qt5-multimedia' 'qt5-serialport' 'sdl2')
optdepends=('dfu-util: tool for flashing stm32 based radios')
makedepends=('arm-none-eabi-binutils' 'arm-none-eabi-gcc' 'arm-none-eabi-newlib'
             'avr-gcc' 'avr-libc' 'bc' 'clang' 'cmake' 'fox' 'gcc' 'git' 'icu' 'python'
             'python-jinja' 'python-lz4' 'python-pillow' 'python-pyqt5' 'qt5-svg'
             'qt5-tools' 'qt5-translations' 'sed' 'xsd')
options=('!debug')
provides=('companion')
conflicts=('companion')
source=("git+https://github.com/EdgeTX/edgetx.git#tag=v$pkgver"
        "git+https://github.com/raphaelcoeffic/AccessDenied.git"
        "git+https://github.com/FreeRTOS/FreeRTOS-Kernel.git"
        "git+https://github.com/adfernandes/segger-rtt.git"
        "git+https://github.com/FreeRTOS/FreeRTOS-Kernel-Community-Supported-Ports.git"
        "git+https://github.com/FreeRTOS/FreeRTOS-Kernel-Partner-Supported-Ports.git"
        "git+https://github.com/EdgeTX/lvgl.git"
        "git+https://github.com/nothings/stb.git"
        "git+https://github.com/microsoft/uf2"
        "git+https://github.com/signal11/hidapi"
        install.patch)
b2sums=('df729e121cb29e2bc0976a57b8071172a978aef0f0b44d2d4a58967fccf920a076ae03b6a552a777e3a8e3c517d21148cb12445a60003c29cde334d7345ffce6'
        'SKIP'
        'SKIP'
        'SKIP'
        'SKIP'
        'SKIP'
        'SKIP'
        'SKIP'
        '97badff74d64db444a780f48a3003e4a7232e7c0ab1ef43f9adbf20044c988f41dd455dc5aad548e5d3501ccc7a1ad9967a69bf43cbd2bb133eb6d00d50f210c')

prepare() {
  export EDGETX_VERSION_TAG=$pkgver
  _pkgbase=$srcdir/${pkgname%%-*}
  cd $_pkgbase
   
  patch ./tools/build-companion.sh < $srcdir/install.patch

  # Deactivate these functions; they bundle the libs for AppImage.
  for pattern in "LIBSSL1" "LIBUSB1" "DFU_UTIL"; do
      sed -i "s/if(${pattern}_FOUND)/if(false)/g" ./companion/src/CMakeLists.txt
  done
  
  cd "$_pkgbase/radio/src/thirdparty/"
  git submodule init
  git config submodule.AccessDenied.url $srcdir/AccessDenied
  git config submodule.FreeRTOS-Kernel.url $srcdir/FreeRTOS-Kernel
  git config submodule.Segger_RTT.url $srcdir/Segger_RTT
  git config submodule.lvgl.url $srcdir/lvgl
  git config submodule.stb.url $srcdir/stb
  git config submodule.uf2.url $srcdir/uf2
  git submodule update --init

  cd "$_pkgbase/radio/src/thirdparty/FreeRTOS/portable/ThirdParty/"
  git submodule init
  git config submodule.FreeRTOS-Kernel-Community-Supported-Ports.url $srcdir/Community-Supported-Ports
  git config submodule.FreeRTOS-Kernel-Partner-Supported-Ports.url $srcdir/Partner-Supported-Ports
  git submodule update --init

  cd "$_pkgbase/radio/src/thirdparty/uf2/"
  git submodule init
  git config submodule.hidapi.url $srcdir/hidapi
  git -c protocol.file.allow=always submodule update --init
}

build() {
  cd $srcdir/edgetx
  ./tools/build-companion.sh $MAKEFLAGS $srcdir/edgetx $srcdir/build
}

package() {
  cd $srcdir/build/native
  make DESTDIR=$pkgdir/ install
  install -Dm644 "$srcdir/edgetx/LICENSE" "$pkgdir/usr/share/licenses/edgetx-companion/LICENSE"
}
