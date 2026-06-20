# Maintainer: lod <aur@lod.sh>

pkgname=edgetx-companion
pkgver=2.12.2
pkgrel=1
pkgdesc="EEPROM Editor and Simulator for EdgeTX RC radio transmitter firmwares"
arch=('x86_64')
url='https://edgetx.org/'
license=('GPL-2.0-only')
depends=('dfu-util' 'glibc' 'hicolor-icon-theme' 'libgcc' 'libstdc++' 'qt6-base' 'qt6-multimedia' 'qt6-serialport' 'sdl2')
makedepends=('arm-none-eabi-binutils' 'arm-none-eabi-gcc' 'arm-none-eabi-newlib' 'avr-gcc' 'avr-libc' 'bc' 'clang' 'cmake' 'doxygen'
             'fox' 'gcc' 'git' 'ninja' 'python' 'python-jinja' 'python-lz4' 'python-pillow' 'qt6-svg' 'qt6-tools' 'sed')
options=('!debug')
provides=('companion')
conflicts=('companion')
source=("git+https://github.com/EdgeTX/edgetx.git#tag=v$pkgver"
        "git+https://github.com/raphaelcoeffic/AccessDenied.git"
        "git+https://github.com/FreeRTOS/FreeRTOS-Kernel.git"
        "git+https://github.com/FreeRTOS/FreeRTOS-Kernel-Community-Supported-Ports.git"
        "git+https://github.com/FreeRTOS/FreeRTOS-Kernel-Partner-Supported-Ports.git"
        "git+https://github.com/EdgeTX/lvgl.git"
        "git+https://github.com/nothings/stb.git"
        "git+https://github.com/microsoft/uf2"
        "git+https://github.com/signal11/hidapi")
b2sums=('fa2ec6b2ec9bbaed394d81589f3d2a568f234821e27ca13571e88257280d0a2e9fb3350393d1985aea7b7df645572fcc4b3846eee6474353e9ab941c3939cff9'
        'SKIP'
        'SKIP'
        'SKIP'
        'SKIP'
        'SKIP'
        'SKIP'
        'SKIP'
        'SKIP')

prepare() {
  # Deactivate this statement; it bundles the OPENSSL lib for AppImage.
  sed -i "s/if(OPENSSL_FOUND)/if(false)/g" edgetx/companion/src/CMakeLists.txt
  # Install the desktop files
  sed -i '/simulator.desktop.in.*)/a install(FILES ${COMPANION_DESKTOP_FILE} ${SIMULATOR_DESKTOP_FILE} DESTINATION ${CMAKE_INSTALL_PREFIX}/share/applications)' edgetx/companion/src/CMakeLists.txt

  cd "$srcdir/edgetx/radio/src/thirdparty/"
  git submodule init
  git config submodule.AccessDenied.url "$srcdir/AccessDenied"
  git config submodule.FreeRTOS-Kernel.url "$srcdir/FreeRTOS-Kernel"
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

  declare -a simulator_plugins=(x9lite x9lites x9d x9dp x9dp2019 x9e
                                x7 x7access
                                t8 t12 t12max tx12 tx12mk2 t15 t15pro t22 t16 t18 t20 t20v2
                                xlite xlites
                                x10 x10express x12s
                                zorro tx16s tx16smk3 tx15
                                commando8 boxer pocket mt12 gx12
                                tlite tpro tprov2 tpros bumblebee lr3pro t14
                                nv14 el18 pl18 pl18ev pl18u st16 pa01
                                f16 v14 v16)

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
