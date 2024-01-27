# Maintainer: lod <aur@cyber-anlage.de>
# Contributer: Ysblokje <ysblokje at gmail dot com>
# Contributer: Jeff Youdontneedtoknow <jeffpublicjr at gmail dot com>
# Contributer: Arnaud

pkgname=edgetx-companion
pkgver=2.9.3
pkgrel=2
pkgdesc="EEPROM Editor and Simulator for EdgeTX RC radio transmitter firmwares"
arch=('x86_64')
url='https://edgetx.org/'
license=('GPL-2.0-only')
depends=('gcc-libs' 'glibc' 'hicolor-icon-theme' 'qt5-base' 'qt5-multimedia' 'sdl2')
optdepends=('dfu-util: tool for flashing stm32 based radios')
makedepends=('arm-none-eabi-binutils' 'arm-none-eabi-gcc' 'arm-none-eabi-newlib'
             'avr-gcc' 'avr-libc' 'bc' 'clang' 'cmake' 'fox' 'gcc' 'git' 'icu' 'python'
             'python-lz4' 'python-pillow' 'python-pyqt5' 'qt5-svg' 'qt5-tools'
             'qt5-translations' 'sed' 'xsd')
options=('!debug')
provides=('companion')
conflicts=('companion')
source=("git+https://github.com/EdgeTX/edgetx.git#tag=v$pkgver"
        "git+https://github.com/jbeder/yaml-cpp.git"
        "git+https://github.com/raphaelcoeffic/AccessDenied.git"
        "git+https://github.com/FreeRTOS/FreeRTOS-Kernel.git"
        "git+https://github.com/edgetx/libopenui.git"
        "git+https://github.com/FreeRTOS/FreeRTOS-Kernel-Community-Supported-Ports.git"
        "git+https://github.com/FreeRTOS/FreeRTOS-Kernel-Partner-Supported-Ports.git"
        "git+https://github.com/EdgeTX/lvgl.git"
        "git+https://github.com/nothings/stb.git"
        install.patch)
b2sums=('SKIP'
        'SKIP'
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
  
  declare -A submodules=(
    ["$_pkgbase/companion/src/thirdparty/"]="yaml-cpp"
    ["$_pkgbase/radio/src/thirdparty/"]="AccessDenied FreeRTOS-Kernel libopenui"
    ["$_pkgbase/radio/src/thirdparty/FreeRTOS/portable/ThirdParty/"]="FreeRTOS-Kernel-Community-Supported-Ports FreeRTOS-Kernel-Partner-Supported-Ports"
    ["$_pkgbase/radio/src/thirdparty/libopenui/thirdparty/"]="lvgl stb"
  )

  for path in "${!submodules[@]}"; do
    cd $path
    git submodule init
    for module in ${submodules[$path]}; do
      git config submodule.$module.url $srcdir/$module
    done
    git submodule update --init
  done
}

build() {
  cd $srcdir/edgetx
  ./tools/build-companion.sh $MAKEFLAGS $srcdir/edgetx $srcdir/build
}

package() {
  cd $srcdir/build/native
  make DESTDIR=$pkgdir/ install
}
