# Maintainer: Martchus <martchus@gmx.net>
# Contributor: ant32 <antreimer@gmail.com>
# Contributor: Filip Brcic <brcha@gna.org>
# Contributor: xantares
# Contributor: jellysheep <max DOT mail AT dameweb DOT de>

# All my PKGBUILDs are managed at https://github.com/Martchus/PKGBUILDs where
# you also find the URL of a binary repository.

# Patches are managed under https://github.com/Martchus/angle/tree/mingw-w64

_latest_git=

pkgver=2.1.r6381.9f09037
if [[ $_latest_git ]]; then
  pkgname=(mingw-w64-angleproject{,-samples}-git)
  pkgdesc='ANGLE project (mingw-w64, git version)'
  _angle_commit=
  _header_commit=
else
  pkgname=(mingw-w64-angleproject{,-samples})
  pkgdesc='ANGLE project (mingw-w64)'
  _angle_commit="#commit=${pkgver##*.}"
  _header_commit='#commit=7a8f394'
fi
pkgrel=2
arch=('any')
url='https://chromium.googlesource.com/angle/angle/+/master/README.md'
license=('BSD')
depends=('mingw-w64-crt')
makedepends=('mingw-w64-gcc' 'git' 'gyp-git' 'depot-tools-git' 'python' 'python2')
options=('!strip' '!buildflags' 'staticlibs')
source=("angleproject::git+https://chromium.googlesource.com/angle/angle$_angle_commit"
        "additional-mingw-header::git+https://github.com/Martchus/additional-mingw-header.git$_header_commit"
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
            '59bc63ccf6d46db725bac5e259941677586315553cb545c51c2fb339e7c586c6'
            '595d5f807b69947d55d4b6285b5dc687cc16d15b6a8c56ec79f496001bbd1f2e'
            '2c5de1623d3ee2a8818063edaea287d1d684785a3443b4f7a2db482c45c59194'
            'd2ed2cf0518fc09b472b17db857d979189b660135347b4c19be8e7352c032ed4'
            'd017726a8953ef409dc614f87b2b99d91725c3d9f1c6bc7d4043301cfb1ce032'
            '8e17fd1b3bfa95c1f8f82a05b3697dfbd26a9c87ba5c3f8e3b5c8dfdccddbaa2'
            '26add1c1ce33db65a102d63926d429e4cc3c61e505a622ef0e1faa0ed1867c40'
            '5239b6bcd38a282adc38a45a7e420752b6f79310553fba19b9a5ae8b70eec31f'
            'd665d266cb4d9b00f70d97df6859b455476beed4af5566a5fc0b4d75ddaaf5cc'
            'cab5b50139148c882a409ddb38df80019648151beb4735e115e92f2fc5677326')
_architectures='i686-w64-mingw32 x86_64-w64-mingw32'

if [[ $_latest_git ]]; then
  pkgver() {
    cd "$srcdir/angleproject"
    grep -E "^#define ANGLE_M..OR_VERSION [0-9]+$" src/common/version.h | sed 's/#define ANGLE_M..OR_VERSION //' | tr '\n' '.'
    printf "r%s.%s\n" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  }
fi

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
  if [[ $_latest_git ]]; then
    provides=('mingw-w64-angleproject')
    conflicts=('mingw-w64-angleproject')
  fi

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
        lib/libangle_util.so \
        "${pkgdir}/usr/${_arch}/bin/libangle_util.dll"
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
  if [[ $_latest_git ]]; then
    pkgdesc='ANGLE project samples (mingw-w64, git version)'
    depends=('mingw-w64-angleproject-git')
    provides=('mingw-w64-angleproject-samples')
    conflicts=('mingw-w64-angleproject-samples')
  else
    pkgdesc='ANGLE project samples (mingw-w64)'
    depends=('mingw-w64-angleproject')
  fi

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

if [[ $_latest_git ]]; then
  package_mingw-w64-angleproject-git() {
    package_mingw-w64-angleproject
  }
  package_mingw-w64-angleproject-samples-git() {
    package_mingw-w64-angleproject-samples
  }
fi
