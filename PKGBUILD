# Maintainer: Martchus <martchus@gmx.net>
# Contributor: ant32 <antreimer@gmail.com>
# Contributor: Filip Brcic <brcha@gna.org>
# Contributor: xantares
# Contributor: jellysheep <max DOT mail AT dameweb DOT de>

# All my PKGBUILDs are managed at https://github.com/Martchus/PKGBUILDs where
# you also find the URL of a binary repository.

pkgname=mingw-w64-angleproject
pkgver=2.1.r6289.f097e23
pkgrel=1
pkgdesc='ANGLE project (mingw-w64)'
arch=('any')
url='https://chromium.googlesource.com/angle/angle/+/master/README.md'
license=('BSD')
depends=('mingw-w64-crt')
makedepends=('mingw-w64-gcc' 'git' 'gyp-git' 'depot-tools-git' 'python' 'python2')
options=('!strip' '!buildflags' 'staticlibs')
source=('angleproject::git+https://chromium.googlesource.com/angle/angle#commit=f097e23'
        'additional-mingw-header::git+https://github.com/Martchus/additional-mingw-header.git#commit=7a8f394'
        '0001-Provide-workaround-for-building-static-libs.patch'
        '0002-Provide-Windows-XP-support.patch'
        '0003-Fix-dynamic-libraries.patch'
        '0004-Link-against-dxguid-d3d9-and-gdi32.patch'
        '0005-Export-shader-API-via-libGLESv2.dll.patch'
        '0006-Make-GLintptr-and-GLsizeiptr-match-those-from-Qt-5.patch'
        '0007-Remove-copy_scripts-target.patch'
        '0008-Fix-generation-of-commit_id.h.patch')
sha256sums=('SKIP'
            'SKIP'
            'b90c65737137d3e4f146fcd7fcb7c1893f071888046c8125c41470a800b4ac72'
            'e79008c38c429937985812e525c71292bd612f6a3844abb328d2837fd69ce763'
            '08e47bb775a032a470f9fc995f1a06721b0431c30c2b7a79ca083ea06d0a9622'
            'd7a0c9de5c91aa9d5364fa453240309d30c0a17ea85dde979c85b836916ae11e'
            'b85618a22d25ced858ff47a6b4102c0d48b89470484add48063ccfe242169555'
            'da091bbe30f96038026713941ce47c7aaf2bb8767150bd941ec95878cde7c4a2'
            '8da56bffa5e718d987306794fd9087a8a92a49e79203857ca81d383c9d5462c8'
            '0a513ee36b9b452ff7c2ba3a37539efe3d5b65992969c95e07afccdf7545f0ee')
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
  # Set cache dir manually, though
  #gclient config --name change2dot --unmanaged --cache-dir /tmp/gclient \
  #    'https://chromium.googlesource.com/angle/angle.git'
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
    -DUNICODE -D_UNICODE -DANGLE_WINDOWS_XP_SUPPORT\
    -I${srcdir}/angleproject/include\
    -I${srcdir}/angleproject/sysinclude\
    -I${srcdir}/angleproject/src\
    -I${srcdir}/angleproject/src/common/third_party/numerics"

  # Use ninja
  export GYP_GENERATORS=ninja

  for _arch in ${_architectures}; do
    mkdir -p build-${_arch} && pushd build-${_arch}

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
    local gyp_args="-D use_ozone=0 -D OS=win -D TARGET=$target -D MSVS_VERSION='' --depth . -I ../build/common.gypi ../src/angle.gyp"
    local ninja_args="-C out/Release -j $(nproc)"

    # Build shared libs
    gyp $gyp_args
    ninja $ninja_args

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

package() {
  for _arch in ${_architectures}; do
    cd "${srcdir}/angleproject/build-${_arch}"
    mkdir -p "${pkgdir}/usr/${_arch}/"{bin,lib,include}
    install out/Release/lib/libGLESv2.so "${pkgdir}/usr/${_arch}/bin/libGLESv2.dll"
    install out/Release/lib/libEGL.so "${pkgdir}/usr/${_arch}/bin/libEGL.dll"
    install \
        out/Release/libGLESv2.dll.a \
        out/Release/libEGL.dll.a \
        out/Release/src/lib*.a \
        "${pkgdir}/usr/${_arch}/lib/"
    cp -Rv ../include/* "${pkgdir}/usr/${_arch}/include/"

    ${_arch}-strip --strip-unneeded "${pkgdir}/usr/${_arch}/bin/"*.dll
    ${_arch}-strip -g "${pkgdir}/usr/${_arch}/lib/"*.a
  done
}
