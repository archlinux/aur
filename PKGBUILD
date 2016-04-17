# Maintainer: Martchus <martchus@gmx.net>
# Contributor: ant32 <antreimer@gmail.com>
# Contributor: Filip Brcic <brcha@gna.org>
# Contributor: xantares
# Contributor: jellysheep <max DOT mail AT dameweb DOT de>

# All my PKGBUILDs are managed at https://github.com/Martchus/PKGBUILDs where
# you also find the URL of a binary repository.

pkgname=mingw-w64-angleproject
pkgver=2.1.r5707.5858f7e
pkgrel=1
pkgdesc='ANGLE project (mingw-w64)'
arch=('any')
url='https://chromium.googlesource.com/angle/angle/+/master/README.md'
license=('BSD')
depends=('mingw-w64-crt')
makedepends=('mingw-w64-gcc' 'git' 'gyp-git' 'python')
options=('!strip' '!buildflags' 'staticlibs')
source=('angleproject::git+https://chromium.googlesource.com/angle/angle#commit=5858f7e'
        'additional-mingw-header::git+https://github.com/Martchus/additional-mingw-header.git#commit=7a8f394'
        'angleproject-include-import-library-and-use-def-file.patch'
        'libEGL_mingw32.def'
        'libGLESv2_mingw32.def'
        'entry_points_shader.cpp'
        'provide_mbstowcs_s_for_xp.patch')
sha256sums=('SKIP'
            'SKIP'
            '895c62846e6784dcc33171523a452cb474010d3fc9e7c351c27b8add4e9930ab'
            'fb04f30b904760d32c4c0b733d0a0b44359855db1fde9e7f5ca7d0b8b1be3e56'
            '3186d913a5fb483d2ae568068453e494d52df8f3f23f09d16afbbf916a63e4a4'
            'ad347c9732f8897497aa51b8969a0e01cd8cd4ebb9a0e873a2ff47c210f1d46c'
            '57b16254c23dbd312dbbe0495a177690809b916c2f3d8b3bbf2dd405274d518c')
_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

#pkgver() {
#  cd "$srcdir/angleproject"
#  grep -E "^#define ANGLE_M..OR_VERSION [0-9]+$" src/common/version.h | sed 's/#define ANGLE_M..OR_VERSION //' | tr '\n' '.'
#  printf "r%s.%s\n" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
#}

prepare() {
  cd "${srcdir}/angleproject"

  # provide recent versions of some mingw-w64 header files
  mkdir -p sysinclude
  cp ../additional-mingw-header/{d3d11sdklayers,dxgi1_2,versionhelpers,d3d10_1,sdkddkver,d3d11,dcomp,dcomptypes,dcompanimation}.h sysinclude/
  cp sysinclude/{versionhelpers,VersionHelpers}.h

  # provide 32-bit versions of *.def files
  cp ../libEGL_mingw32.def src/libEGL/
  cp ../libGLESv2_mingw32.def src/libGLESv2/

  # provide a file to export symbols declared in ShaderLang.h as part of libGLESv2.dll
  # (required to build Qt WebKit which uses shader interface)
  cp ../entry_points_shader.cpp src/libGLESv2/

  # remove .git directory to prevent: No rule to make target '../build-i686-w64-mingw32/.git/index', needed by 'out/Debug/obj/gen/angle/id/commit.h'.
  rm -fr .git

  # make sure an import library is created, the correct .def file is used during the build
  # and entry_points_shader.cpp is compiled
  patch -p1 -i "${srcdir}/angleproject-include-import-library-and-use-def-file.patch"

  # provide own implementation of mbstowcs_s for Windows XP support
  patch -p1 -i "${srcdir}/provide_mbstowcs_s_for_xp.patch"

  # executing .bat scripts on Linux is a no-go so make this a no-op
  echo "" > src/copy_compiler_dll.bat
  chmod +x src/copy_compiler_dll.bat
}

build() {
  cd "${srcdir}/angleproject"

  # set build flags, make sure all header files are found
  export CXXFLAGS="-O2 -g -pipe -Wall -Wp,-D_FORTIFY_SOURCE=2 -fexceptions --param=ssp-buffer-size=4 -std=c++11 -msse2 -DUNICODE -D_UNICODE -g -I${srcdir}/angleproject/sysinclude -I${srcdir}/angleproject/src -I${srcdir}/angleproject/include"
  unset LDFLAGS

  for _arch in ${_architectures}; do
    mkdir -p build-${_arch} && pushd build-${_arch}

    export CXX="${_arch}-g++"
    export AR="${_arch}-ar"

    if [[ ${_arch} == i686-w64-mingw32 ]]; then
      target="win32"
    else
      target="win64"
    fi

    gyp -D use_ozone=0 -D OS=win -D TARGET=$target --format make -D MSVS_VERSION="" --depth . -I ../build/common.gypi ../src/angle.gyp

    # forcing non-concurrent build to prevent:
    # i686-w64-mingw32-g++ -shared   -Wl,-soname=libGLESv2.so -o out/Debug/obj.target/../src/libGLESv2.so -Wl,--whole-archive out/Debug/obj.target/libGLESv2/../src/libGLESv2/entry_points_egl.o out/Debug/obj.target/libGLESv2/../src/libGLESv2/entry_points_egl_ext.o out/Debug/obj.target/libGLESv2/../src/libGLESv2/entry_points_gles_2_0.o out/Debug/obj.target/libGLESv2/../src/libGLESv2/entry_points_gles_2_0_ext.o out/Debug/obj.target/libGLESv2/../src/libGLESv2/entry_points_gles_3_0.o out/Debug/obj.target/libGLESv2/../src/libGLESv2/global_state.o out/Debug/obj.target/libGLESv2/../src/libGLESv2/libGLESv2.o out/Debug/obj.target/../src/libANGLE.a out/Debug/obj.target/../src/libangle_common.a out/Debug/obj.target/../src/libtranslator_static.a out/Debug/obj.target/../src/libtranslator_lib.a out/Debug/obj.target/../src/libpreprocessor.a -Wl,--no-whole-archive
    # out/Debug/obj.target/../src/libtranslator_static.a: member out/Debug/obj.target/../src/../obj.target/src/compiler/translator/ShaderLang.o in archive is not an object
    # collect2: error: ld returned 1 exit status
    make -j1 V=1

    # static libs must be built separately
    gyp -D use_ozone=0 -D OS=win -D TARGET=$target --format make -D MSVS_VERSION="" --depth . -I ../build/common.gypi ../src/angle.gyp -D angle_gl_library_type=static_library
    make -j1 V=1

    # the static libs produced by the build script are just thin archives so they don't contain any objects themselves
    # -> repackage them to actually contain the object files
    for lib in out/Debug/src/lib*.a; do
      ${_arch}-ar -t $lib | xargs ${_arch}-ar rvs $lib.new && mv $lib.new $lib;
      ${_arch}-ranlib $lib
    done

    popd
  done
}

package() {
  for _arch in ${_architectures}; do
    cd "${srcdir}/angleproject/build-${_arch}"
    mkdir -p "${pkgdir}/usr/${_arch}/"{bin,lib,include}
    install out/Debug/src/libGLESv2.so "${pkgdir}/usr/${_arch}/bin/libGLESv2.dll"
    install out/Debug/src/libEGL.so "${pkgdir}/usr/${_arch}/bin/libEGL.dll"
    install libGLESv2.dll.a libEGL.dll.a out/Debug/src/lib*.a "${pkgdir}/usr/${_arch}/lib/"
    cp -Rv ../include/* "${pkgdir}/usr/${_arch}/include/"

    ${_arch}-strip --strip-unneeded "${pkgdir}/usr/${_arch}/bin/"*.dll
    ${_arch}-strip -g "${pkgdir}/usr/${_arch}/lib/"*.a
  done
}
