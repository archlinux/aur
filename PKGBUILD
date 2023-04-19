# Maintainer: lod <aur@cyber-anlage.de>
# Contributer: Ysblokje <ysblokje at gmail dot com>
# Contributer: Jeff Youdontneedtoknow <jeffpublicjr at gmail dot com>
# Contributer: Arnaud

pkgname=edgetx-companion
pkgver=2.8.3
pkgrel=1
pkgdesc="EEPROM Editor and Simulator for EdgeTX RC radio transmitter firmwares"
arch=('x86_64')
url='https://edgetx.org/'
license=('GPL2')
depends=('gcc-libs' 'glibc' 'hicolor-icon-theme'  'qt5-base' 'qt5-multimedia' 'sdl')
optdepends=('dfu-util: tool for flashing stm32 based radios')
makedepends=('arm-none-eabi-binutils' 'arm-none-eabi-gcc' 'arm-none-eabi-newlib'
             'avr-gcc' 'avr-libc' 'bc' 'cmake' 'fox' 'gcc' 'git' 'icu' 'python' 'python-lz4'
             'python-pillow' 'python-pyqt5' 'qt5-svg' 'qt5-tools' 'qt5-translations'
             'sed' 'xsd')
provides=('companion')
conflicts=('companion')
_pkgbase=${pkgname%%-*}
_versuff=${pkgver/./} && _versuff=${_versuff%%.*}
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
sha256sums=('SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'efa51cbbff6cb466a6a9bd681b04b158fce6e48d2db4c5cc235c1a871037f6c8')

prepare() {
  export EDGETX_VERSION_TAG=$pkgver

  cd $_pkgbase
  patch ./tools/build-companion.sh < $srcdir/install.patch
  
  cd $srcdir/$_pkgbase/companion/src/thirdparty/
  git submodule init
  git config submodule.yaml-cpp.url $srcdir/yaml-cpp
  git submodule update --init
  
  cd $srcdir/$_pkgbase/radio/src/thirdparty/
  git submodule init
  git config submodule.AccessDenied.url $srcdir/AccessDenied
  git config submodule.FreeRTOS-Kernel.url $srcdir/FreeRTOS
  git config submodule.libopenui.url $srcdir/libopenui
  git submodule update --init
  
  cd $srcdir/$_pkgbase/radio/src/thirdparty/FreeRTOS/portable/ThirdParty/
  git submodule init
  git config submodule.FreeRTOS-Kernel-Community-Supported-Ports.url $srcdir/Community-Supported-Ports
  git config submodule.FreeRTOS-Kernel-Partner-Supported-Ports.url $srcdir/FreeRTOS-Kernel-Partner-Supported-Ports
  git submodule update --init
  
  cd $srcdir/$_pkgbase/radio/src/thirdparty/libopenui/thirdparty/
  git submodule init
  git config submodule.lvgl.url $srcdir/lvgl
  git config submodule.stb.url $srcdir/stb
  git submodule update --init
}

build() {
  cd $_pkgbase
  ./tools/build-companion.sh $MAKEFLAGS $srcdir/$_pkgbase $srcdir/build $_versuff
}

package() {
  cd $srcdir/build/native
  make DESTDIR=$pkgdir/ install
  cd $pkgdir/usr/share/applications
  sed -i -e 's/Categories=Application/Categories=Utility/' companion$_versuff.desktop
  sed -i -e 's/Categories=Application/Categories=Utility/' simulator$_versuff.desktop
}
