# Maintainer: Martchus <martchus@gmx.net>
# Contributor: ant32 <antreimer@gmail.com>
# Contributor: Filip Brcic <brcha@gna.org>
# Contributor: xantares
# Contributor: jellysheep <max DOT mail AT dameweb DOT de>

# All my PKGBUILDs are managed at https://github.com/Martchus/PKGBUILDs where
# you also find the URL of a binary repository.

pkgname=(mingw-w64-angleproject{,-samples})
pkgver=2.1.r6381.9f09037
pkgrel=1
pkgdesc='ANGLE project (mingw-w64)'
arch=('any')
url='https://chromium.googlesource.com/angle/angle/+/master/README.md'
license=('BSD')
depends=('mingw-w64-crt')
makedepends=('mingw-w64-gcc' 'git' 'gyp-git' 'depot-tools-git' 'python' 'python2')
options=('!strip' '!buildflags' 'staticlibs')
source=('angleproject::git+https://chromium.googlesource.com/angle/anglecommit=f097e23'
        'additional-mingw-header::git+https://github.com/Martchus/additional-mingw-header.git'
        'additional-mingw-header::git+https://github.com/Martchus/additional-mingw-header.git#commit=7a8f394'
        '0001-Provide-workaround-for-building-static-libs.patch'
        '0002-Provide-Windows-XP-support.patch'
        '0003-Fix-dynamic-libraries.patch'
        '0004-Link-against-dxguid-d3d9-and-gdi32.patch'
        '0005-Export-shader-API-via-libGLESv2.dll.patch'
        '0006-Make-GLintptr-and-GLsizeiptr-match-those-from-Qt-5.patch'
        '0007-Remove-copy_scripts-target.patch'
        '0008-Fix-generation-of-commit_id.h.patch'
        '0009-Ensure-dependencies-of-samples-are-found.patch'
        '0010-Win32_system_utils.cpp-Make-implicit-cast-explicit.patch')
sha256sums=('SKIP'
            'SKIP'
            'SKIP'
            '59bc63ccf6d46db725bac5e259941677586315553cb545c51c2fb339e7c586c6'
            '595d5f807b69947d55d4b6285b5dc687cc16d15b6a8c56ec79f496001bbd1f2e'
            '2c5de1623d3ee2a8818063edaea287d1d684785a3443b4f7a2db482c45c59194'
            'd2ed2cf0518fc09b472b17db857d979189b660135347b4c19be8e7352c032ed4'
            'a214c2bb6a1472843227b27cf6963113e4e42e5051dfa4ba9dbdfd353da887b5'
            '34e363820e24df349b5798526bd7040aaf5224086310d92901b71b2e5285cd96'
            '8098e5f6999ffb15761a4bea668e14fbe9af9af94c2ec504fd6b6421198a938a'
            '9a17c871dfcef1bde47d54a12ba1d3ad88c2349d3bede4b12fa9c9453f0a1129'
            '106e5607986669bba430d1b021e180f27c595d31d3ba239cad26583f423eccd2'
            '2b195f1238b433fb68564f9c53adfc0d715cc4908c4ab0b9dd5977c88b763620')
_architectures='i686-w64-mingw32 x86_64-w64-mingw32'

#pkgver() {
#  cd "$srcdir/angleproject"
#  grep -E "^#define ANGLE_M..OR_VERSION [0-9]+$" src/common/version.h | sed 's/#define ANGLE_M..OR_VERSION //' | tr '\n' '.'
#  printf "r%s.%s\n" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
#}

prepare() {
  cd "${srcdir}/angleproject"

  # Ensure depot-tools are in PATH
  source /etc/profile.d/depot_tools.sh

  # Provide recent versions of some Windows header files
  mkdir -p sysinclude
  cp ../additional-mingw-header/{d3d11sdklayers,dxgi1_2,versionhelpers,d3d10_1,sdkddkver,d3d11,dcomp,dcomptypes,dcompanimation}.h sysinclude/
  cp sysinclude/{versionhelpers,VersionHelpers}.h

  # Set cache dir for gsutil
  mkdir -p /tmp/gsutil
  export DEPOT_TOOLS_GSUTIL_BIN_DIR=/tmp/gsutil

  # Execute bootstrap scripts
  python2 scripts/bootstrap.py
  gclient sync --deps=all

  # Apply patches; further descriptions can be found in patch files itself
  for patch in "$srcdir/"*.patch; do
    patch -p1 -i "$patch"
  done
}

build() {
  cd "${srcdir}/angleproject"

  # Set common build flags and make sure all header files are found
  local CXXFLAGS_COMMON="\
    -O2 -g -pipe -Wall -Wp,-D_FORTIFY_SOURCE=2 -fexceptions --param=ssp-buffer-size=4 -std=c++11 -msse2\
    -DUNICODE -D_UNICODE -DANGLE_WINDOWS_XP_SUPPORT -D_USE_MATH_DEFINES\
    -I${srcdir}/angleproject/include\
    -I${srcdir}/angleproject/sysinclude\
    -I${srcdir}/angleproject/src\
    -I${srcdir}/angleproject/src/common/third_party/numerics"

  # Use ninja
  export GYP_GENERATORS=ninja

  for _arch in ${_architectures}; do
    mkdir -p build-${_arch}-shared && pushd build-${_arch}-shared

    # Set ar/compiler and architecture specific compiler flags
    export CC="${_arch}-gcc"
    export CXX="${_arch}-g++"
    export AR="${_arch}-ar"
    export AS="${_arch}-as"
    export RANLIB="${_arch}-ranlib"
    unset LDFLAGS
    if [[ ${_arch} == i686-w64-mingw32 ]]; then
      local target='win32'
      export CXXFLAGS="${CXXFLAGS_COMMON} -march=i686"
    else
      local target='win64'
      export CXXFLAGS="${CXXFLAGS_COMMON} -march=x86-64"
    fi

    # Compose args for gyp and ninja
    local gyp_args="-D use_ozone=0 -D use_x11=0 -D OS=win -D TARGET=$target -D MSVS_VERSION='' --depth . -I ../gyp/common.gypi ../src/angle.gyp"
    local ninja_args="-C out/Release -j $(nproc)"

    # Build shared libs
    gyp $gyp_args ../samples/samples.gyp
    ninja $ninja_args

    popd
    mkdir -p build-${_arch}-static && pushd build-${_arch}-static

    # Build static libs
    gyp $gyp_args -D angle_gl_library_type=static_library
    ninja $ninja_args

    # Static libs produced by the build script are just thin archives so they don't contain any objects themselves
    # -> Repackage them to actually contain the object files
    for lib in out/Release/src/lib*.a; do
      $AR -t $lib | xargs ${_arch}-ar rvs $lib.new && mv $lib.new $lib;
      $RANLIB $lib
    done

    popd
  done
}

package_mingw-w64-angleproject() {
  depends=('mingw-w64-crt')

  for _arch in ${_architectures}; do
    mkdir -p "${pkgdir}/usr/${_arch}/"{bin,lib,include}

    # shared build
    cd "${srcdir}/angleproject/build-${_arch}-shared/out/Release"
    install \
        lib/libGLESv2.so \
        "${pkgdir}/usr/${_arch}/bin/libGLESv2.dll"
    install \
        lib/libEGL.so \
        "${pkgdir}/usr/${_arch}/bin/libEGL.dll"
    install \
        libGLESv2.dll.a \
        libEGL.dll.a \
        src/lib*.a \
        "${pkgdir}/usr/${_arch}/lib/"
    cp -Rv \
        ../../../include/* \
        "${pkgdir}/usr/${_arch}/include/"

    # static build
    cd "${srcdir}/angleproject/build-${_arch}-static/out/Release"
    install \
        src/lib*.a \
        "${pkgdir}/usr/${_arch}/lib/"

    ${_arch}-strip --strip-unneeded "${pkgdir}/usr/${_arch}/bin/"*.dll
    ${_arch}-strip -g "${pkgdir}/usr/${_arch}/lib/"*.a
  done
}

package_mingw-w64-angleproject-samples() {
  pkgdesc='ANGLE project samples (mingw-w64)'
  depends=('mingw-w64-angleproject')

  for _arch in ${_architectures}; do
    mkdir -p "${pkgdir}/usr/${_arch}/"{bin,share/angleproject}

    cd "${srcdir}/angleproject/build-${_arch}-shared/out/Release"
    for sample in $(find . -maxdepth 1 -type f -not -iname '*.*'); do
      install "$sample" "${pkgdir}/usr/${_arch}/bin/$sample.exe"
    done
    install \
        *.tga \
        *.glsl \
        "${pkgdir}/usr/${_arch}/share/angleproject"

    ${_arch}-strip --strip-all "${pkgdir}/usr/${_arch}/bin/"*.exe
  done
}

