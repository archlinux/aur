# Maintainer: Robert Zhou <meep dot aur at meepzh dot com>

pkgname=openrv-git
pkgver=3.0.0.r430.94f9412
pkgrel=1
pkgdesc="aka Open RV, an image and sequence viewer for VFX and animation artists"
arch=('x86_64')
url='https://github.com/AcademySoftwareFoundation/OpenRV'
license=('Apache' 'custom')
depends=('alsa-lib' 'libaio' 'mesa' 'tk' 'tcsh' 'opencl-icd-loader' 'glu' 'nss'
         'libxcomposite' 'libxcursor' 'xcb-util-keysyms' 'libxrandr' 'libva'
         'xcb-util-wm' 'xcb-util-renderutil' 'libxkbcommon-x11' 'libvdpau' 'libxtst'
         'libva' 'xcb-util-keysyms' 'libnsl' 'xcb-util-image' 'libcups' 'libpulse')
makedepends=('cmake>=3.24' 'git' 'opencl-headers' 'nasm' 'python-pip' 'meson'
             'openssl-1.1' 'patchelf')
provides=('openrv')
options=(!strip)
source=('git+https://github.com/AcademySoftwareFoundation/OpenRV.git'
        'git+https://github.com/shotgunsoftware/openrv-WFObj.git'
        'git+https://github.com/shotgunsoftware/openrv-pub.git'
        'git+https://github.com/shotgunsoftware/openrv-oiio.git'
        'ffmpeg.patch'
        'ocio.patch'
        'ocio.h.patch'
        'ocio_install_yaml-cpp.patch'
        'ocio_yaml-cpp.patch'
        'oiio.patch'
        'externalpackages.patch'
        'glew-lib64.patch'
        'jpegturbo-lib64.patch'
        'pyside6.patch'
        'pyside6_build_main.patch')
b2sums=('SKIP'
        'SKIP'
        'SKIP'
        'SKIP'
        '006aafc6da23e045967968ffdfbe905436e05f66957e951917bcfc9aca9f515f9fcc2935884d7629ccaf1061ef64531356a2c89b07cad19fdc7f0bba8a7cd123'
        '95f6cff1b9026ad1b9bdd9845c7fc646dcff5b78728bff312605e9d3b0ee0616defd89e9125f9784d8aa532047b67339f4d6a3a984ece819790d10ba06f8d605'
        'c9ef45dfec9f5566fd9f6ab387907b73bb500ea1627f183cc5bbff6b9fb8419d67faa018c39f8f1f78d6164976a313b83842e584873069d17cefa40cdcdb4c22'
        'f5d463d66fadff1d8d9fc7fadd04f5b723bc24a5530dce916e881e812d5e5d701bcbfbcaff6331ef94612028a82b3275fb309dfee292d12800ba4118ddd8c6eb'
        'de1b4b59c5bfac9a9c9196a2775f83185c8d7901c6e9910408481bd0f057b5e9dc7d8b9cef31743a3a394881775f4959d4a991b22a9ea65a0bbedf2e3945fbaa'
        '4d6b004ae837a636bdaf3c97ca0e67feab3c9792548f9d515ff6cef8ee854d716703174aa4349905b9ed078a28ebc4a6f41166f855e3d4068d7b9de4555ebdb9'
        '83132f08eacfa5684d7adbcba60981e53e908025a31b6e39196a13a74a543d346fdcdbc95eb339bfc2c149c100ead760e7d0609afb275481d30a6c190782e8bb'
        'ab830c1bcae5a35a3c3efc7f09776837a5b0b3d53cb7a42db5fad052635e848a79013617c97abdba2ce51fd41a593f8dde216e52e73e0bc3a7f4e608a22d165b'
        '31ae9ab03451ac06771ae3d07d6b07ce86ea38494bea9d25c49940493a2a7e38db5267a5c4043a9811590ca236d3c9735376f4ab2c529b4565c33e57ee2b6448'
        '7eb73c1463fc59ad122cc6dcec795530f1331d754f7c9e1ed849d7b41d1bfe85fa6c84b2ffa1cfcdca247ee13d04b5d89a6d4d7e08c8f40cf39b9a3dc4cd1b52'
        '6ba80a7830666c4b7c79e51647bb71548324aa06c4785e7f806c5ab98105ebc18e7db218cc2a77b38865f54a6bd54c5b45f46fd1b1aaef5202a1c4967f6247fd')

pkgver() {
  cd OpenRV
  ! cmake . >/dev/null 2>&1
  ! cmakelistsver=$(! cmake --system-information |
      awk -F= '$1~/RV_MAJOR_VERSION:STRING/{MAJOR=$2; next} \
                  /RV_MINOR_VERSION:STRING/{MINOR=$2; next} \
                  /RV_REVISION_NUMBER:STRING/{print MAJOR "." MINOR "." $2}')
  git clean -f -d >/dev/null 2>&1
  printf "%s.r%s.%s" $cmakelistsver "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

prepare() {
  cd OpenRV

  git submodule init
  git config submodule.src/lib/files/WFObj.url "$srcdir/openrv-WFObj"
  git config submodule.src/pub.url "$srcdir/openrv-pub"
  git config submodule.src/lib/oiio.url "$srcdir/openrv-oiio"
  git -c protocol.file.allow=always submodule update

  # Use lib instead of lib64
  find cmake -type f -exec sed -i "s/lib64/lib/g" {} \;
  sed -i "s/lib64/lib/g" src/build/make_openssl.py
  sed -i "s/lib64/lib/g" src/build/make_python.py
  sed -i '/-rpath/a\ \ \ \ \ \ \ \ configure_args.append("--libdir=lib")' src/build/make_openssl.py
  patch --forward --strip=1 --input="$srcdir/glew-lib64.patch"
  patch --forward --strip=1 --input="$srcdir/jpegturbo-lib64.patch"

  # Fix build errors that occur on Arch
  patch --forward --strip=1 --input="$srcdir/ffmpeg.patch"  # Use the same version of ffmpeg from the Arch-provided ffmpeg and fix build errors
  patch --forward --strip=1 --input="$srcdir/ocio.patch"  # Include cstdint, force yaml-cpp static library build
  patch --forward --strip=1 --input="$srcdir/oiio.patch"  # Update OIIO version to fix build errors and force matching fmt build
  patch --forward --strip=1 --input="$srcdir/pyside6.patch"  # Force usage of OpenRV's Python installation for shiboken
  sed -i 's/HAVE_MREMAP 1/HAVE_MREMAP 0/g' src/pub/nedmalloc/malloc.c.h
  sed -i 's/s->pcrc_32_tab = get_crc_table()/s->pcrc_32_tab = (const unsigned long *)get_crc_table()/g' src/pub/minizip/unzip.c
  sed -i 's/char\* tagList = \&/char\* tagList = \(char\*\)\&/g' src/pub/FTGL/FTVectoriser.cpp
  sed -i 's/"--enable-shared",/"--enable-shared", "ax_cv_c_float_words_bigendian=no",/' src/build/make_python.py
  sed -i /aja.cmake/d cmake/dependencies/CMakeLists.txt  # Requires libajantv2, which is hardware-specific and requires an update in the AUR
  echo " " > src/plugins/output/AJADevices/CMakeLists.txt
  sed -i '/TwkGLFMesa/d' src/lib/graphics/CMakeLists.txt  # Requires OSMesa, only available through legacy support in mesa-amber
  sed -i '/(MovieRV)/d' src/lib/image/CMakeLists.txt  # Software-based MovieRV uses TwkGLFMesa
  sed -i '/rvio_sw/d' src/bin/imgtools/CMakeLists.txt  # rvio_sw uses MovieRV

  # Options
  # sed -i '/(NON_FREE_ENCODERS_TO_DISABLE/a "nvenc"' cmake/dependencies/ffmpeg.cmake  # Uncomment if not using nvidia
  # sed -i '/"aac"/d' cmake/dependencies/ffmpeg.cmake  # Re-enable non-free aac in ffmpeg

  # Update rvcmds.sh
  sed -i 's/pip install --user/pip install/' rvcmds.sh  # Install to venv
  sed -i -E 's/alias (\w+)="(.+)"/\1() { \2; };/' rvcmds.sh  # Convert aliases to PKGBUILD-callable functions
  sed -i 's,\\"${CMAKE_GENERATOR}\\","${CMAKE_GENERATOR}",' rvcmds.sh
  # Pass CMake defines to rvcmds.sh:
  # * Use latest dependencies in CY2024 and FFmpeg 7
  # * Copy cherry-picks from Arch-provided ffmpeg
  sed -i "s/{WIN_PERL};/{WIN_PERL} -DRV_FFMPEG=7 "'"'"-DRV_FFMPEG_PATCH_COMMAND_STEP=git cherry-pick -n bcfbf2bac8f9eeeedc407b40596f5c7aaa0d5b47 d0facac679faf45d3356dff2e2cb382580d7a521"'"'";/" rvcmds.sh
  sed -i 's/--target ;/--target $1;/' rvcmds.sh
  sed -i 's/ctest /ctest --exclude-regex ".*(ALSASafe|io_oiio).*" /' rvcmds.sh  # ALSASafe uses Rv::Option, removed OpenVDB from OIIO
  # sed -i 's/--parallel=8/--parallel=1/' rvcmds.sh  # May help with debugging
}

build() {
  cd OpenRV
  # export CMAKE_GENERATOR="Unix Makefiles"  # Uncomment to not use Ninja
  python -m venv .
  source bin/activate

  # Check for a suitable Qt installation, currently mirroring the rvcmds script
  local qt_arch="gcc_64"
  local qt_version="6.5.3"
  local qt_home=$(find ~/Qt*/6.5* -maxdepth 4 -type d -path "*/$qt_arch" | sort -V | tail -n 1)
  if [ -z "$qt_home" ]; then
    qt_home=$(find "$srcdir/Qt/$qt_version" -maxdepth 4 -type d -path "*/$qt_arch" | sort -V | tail -n 1)
  fi
  if [ -z "$qt_home" ]; then
    # If not, use aqtinstall to download it, mirroring the official OpenRV Dockerfiles
    # Thank you michimussato for the suggestion!
    if ! pip show aqtinstall &> /dev/null; then
      pip install aqtinstall
    fi
    local qt_modules="debug_info qt3d qt5compat qtcharts qtconnectivity qtdatavis3d qtgrpc qthttpserver \
                      qtimageformats qtlanguageserver qtlocation qtlottie qtmultimedia qtnetworkauth qtpdf \
                      qtpositioning qtquick3d qtquick3dphysics qtquickeffectmaker qtquicktimeline \
                      qtremoteobjects qtscxml qtsensors qtserialbus qtserialport qtshadertools qtspeech \
                      qtvirtualkeyboard qtwaylandcompositor qtwebchannel qtwebengine qtwebsockets qtwebview"
    local qt_archives="icu qtbase qtdeclarative qtsvg qttools qttranslations qtwayland"
    python -m aqt install-qt linux desktop $qt_version $qt_arch -O "$srcdir/Qt" \
      -m ${qt_modules} \
      --archives ${qt_archives}
    qt_home="$srcdir/Qt/$qt_version/$qt_arch"
  fi

  QT_HOME="$qt_home" source rvcmds.sh
  CMAKE_POLICY_VERSION_MINIMUM=3.5 QT_HOME="$qt_home" rvbootstrap
}

check() {
  cd OpenRV
  source rvcmds.sh
  rvtest
}

package() {
  cd OpenRV
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  mkdir -p "$pkgdir/opt/openrv"
  export RV_INST="$pkgdir/opt/openrv"
  source rvcmds.sh
  rvinst
}
