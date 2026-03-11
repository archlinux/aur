# Maintainer: lod <aur@cyber-anlage.de>

pkgname=edgetx-companion
pkgver=2.11.5
pkgrel=1
pkgdesc="EEPROM Editor and Simulator for EdgeTX RC radio transmitter firmwares"
arch=('x86_64')
url='https://edgetx.org/'
license=('GPL-2.0-only')
depends=('dfu-util' 'glibc' 'hicolor-icon-theme' 'libgcc' 'libstdc++' 'qt5-base' 'qt5-multimedia' 'qt5-serialport' 'sdl2')
makedepends=('arm-none-eabi-binutils' 'arm-none-eabi-gcc' 'arm-none-eabi-newlib' 'avr-gcc' 'avr-libc' 'bc' 'clang'
             'cmake' 'doxygen' 'fox' 'gcc' 'git' 'graphviz' 'icu' 'ninja' 'openssl' 'python' 'python-jinja'
             'python-lz4' 'python-pillow' 'python-pyqt5' 'qt5-svg' 'qt5-tools' 'qt5-translations' 'sed' 'xsd')
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
        "git+https://github.com/signal11/hidapi")
b2sums=('82f7616fb75e37d4357d3f3080ccf42ee88364a7a09ea15459af933784d6ec56a0a054f1834646c2ab0f0cf81abaa91af78779730b2101d07de0ecc3c051efa1'
        'SKIP'
        'SKIP'
        'SKIP'
        'SKIP'
        'SKIP'
        'SKIP'
        'SKIP'
        'SKIP'
        'SKIP')

prepare() {
  # Deactivate these statements; they bundle the libs for AppImage.
  for pattern in "LIBSSL1" "LIBUSB1"; do
      sed -i "s/if(${pattern}_FOUND)/if(false)/g" edgetx/companion/src/CMakeLists.txt
  done

  sed -i 's/$(MAKE)/ninja/g' edgetx/CMakeLists.txt

  cd "$srcdir/edgetx/radio/src/thirdparty/"
  git submodule init
  git config submodule.AccessDenied.url "$srcdir/AccessDenied"
  git config submodule.FreeRTOS-Kernel.url "$srcdir/FreeRTOS-Kernel"
  git config submodule.Segger_RTT.url "$srcdir/Segger_RTT"
  git config submodule.lvgl.url "$srcdir/lvgl"
  git config submodule.stb.url "$srcdir/stb"
  git config submodule.uf2.url "$srcdir/uf2"
  git submodule update --init

  cd "$srcdir/edgetx/radio/src/thirdparty/FreeRTOS/portable/ThirdParty/"
  git submodule init
  git config submodule.FreeRTOS-Kernel-Community-Supported-Ports.url "$srcdir/Community-Supported-Ports"
  git config submodule.FreeRTOS-Kernel-Partner-Supported-Ports.url "$srcdir/Partner-Supported-Ports"
  git submodule update --init

  cd "$srcdir/edgetx/radio/src/thirdparty/uf2/"
  git submodule init
  git config submodule.hidapi.url "$srcdir/hidapi"
  git -c protocol.file.allow=always submodule update --init
}

build() {
  cd edgetx
  export EDGETX_VERSION_TAG=$pkgver
  source tools/build-common.sh # Provides get_target_build_options() for retrieving individual build options per simulated radio.

  rm -rf build
  mkdir build
  cd build

  declare -a simulator_plugins=(x9lite x9lites
                              x7 x7access
                              t8 t12 t12max tx12 tx12mk2
                              zorro commando8 boxer pocket mt12 gx12
                              tlite tpro tprov2 tpros bumblebee lr3pro t14
                              x9d x9dp x9dp2019 x9e
                              xlite xlites
                              nv14 el18 pa01 pl18 pl18ev pl18u st16
                              x10 x10express x12s
                              t15 t16 t18 t20 t20v2 tx16s f16 v14 v16)

  for plugin in "${simulator_plugins[@]}"
  do
    echo "Building ${plugin}"
    BUILD_OPTIONS=""

    if ! get_target_build_options "$plugin"; then
        echo "Error: Failed to find a match for target '$plugin'"
        exit 1
    fi

    rm -f CMakeCache.txt native/CMakeCache.txt
    cmake \
      -S .. \
      -G Ninja \
      -DCMAKE_MAKE_PROGRAM=/usr/bin/ninja \
      -DCMAKE_BUILD_TYPE=Release \
      -DCMAKE_INSTALL_PREFIX=/usr \
      -DCMAKE_INTERPROCEDURAL_OPTIMIZATION=ON \
      -DGVARS=YES \
      -DHELI=YES \
      -DLUA=YES \
      -Wno-dev \
      ${BUILD_OPTIONS}
    cmake --build . --target native-configure
    cmake --build native --target libsimulator
  done

  cmake --build native --target companion
}

package() {
  DESTDIR="$pkgdir" ninja -C edgetx/build/native install
  install -Dm644 edgetx/LICENSE "$pkgdir/usr/share/licenses/edgetx-companion/LICENSE"
}
