# Maintainer: ant32 <antreimer@gmail.com>
# Contributor: Filip Brcic <brcha@gna.org>
# Contributor: xantares
# Contributor: jellysheep <max DOT mail AT dameweb DOT de>

pkgname=mingw-w64-angleproject
pkgver=2.1.r3427.30d6c25
pkgrel=2
pkgdesc='Angle project (mingw-w64)'
arch=('any')
url='http://code.google.com/p/angleproject/'
license=('BSD')
depends=('mingw-w64-crt')
makedepends=('mingw-w64-gcc' 'gyp-svn' 'git' 'python')
options=('!strip' '!buildflags' 'staticlibs')
source=('angleproject::git+https://chromium.googlesource.com/angle/angle#commit=30d6c25'
        'libGLESv2_mingw32.def'
        'libEGL_mingw32.def'
        '0000-General-fixes-for-ANGLE-2.1.patch'
        '0004-Make-it-possible-to-link-ANGLE-statically-for-single.patch'
        '0008-ANGLE-Dynamically-load-D3D-compiler-from-a-list-or-t.patch'
        '0009-ANGLE-Support-WinRT.patch'
        '0010-ANGLE-Enable-D3D11-for-feature-level-9-cards.patch'
        '0012-ANGLE-fix-semantic-index-lookup.patch'
        '0013-ANGLE-Add-support-for-querying-platform-device.patch'
        '0014-Let-ANGLE-use-multithreaded-devices-if-necessary.patch'
        '0015-ANGLE-Fix-angle-d3d11-on-MSVC2010.patch'
        '0016-ANGLE-Fix-compilation-with-MinGW-D3D11.patch'
        '0017-ANGLE-Fix-compilation-with-D3D9.patch'
        '0018-ANGLE-Fix-releasing-textures-after-we-kill-D3D11.patch'
        'angleproject-undo-mingw-org-compatibility.patch'
        'angleproject-undo-mingw-org-compatibility2.patch'
        'angleproject-disable-debug-annotations.patch'
        'angleproject-undo-shader-renames.patch'
        'angleproject-prevent-multiple-definition-errors.patch'
        'commit-4de44cb'
        'commit-409078f'
        'angleproject-include-import-library-and-use-def-file.patch'
        'angleproject-export-shader-symbols.patch')
md5sums=('SKIP'
         'ebee3837c9f9ad9e9b49061a2274b963'
         '7d563b2218692a5ea232c1a7aa77e2a1'
         'b14a834c2d51c7af99f8aaf089851d23'
         'fa43f37117af18de3badfc4481ee3639'
         'fe69049b10928166ef62e1786a13e61b'
         'e573a80dec8b594bf6244ea4a28ce438'
         'b64f5fc4838d7157753f8255613ca511'
         'baf253bebf28653468e18b92d84f4431'
         '25b88bcf7132e62c6717c145177ea157'
         '8fdd8266b8b2c276dbf4e66d2947e5e3'
         'fbd26095e88c8e6930edc50c1c7dc0a8'
         '5f80ebeebded4a4bb80cd03e3075dae5'
         '780bc9ce3c0008910707b2df20c3430c'
         '2787c0a067665b02c161c7392b7175e4'
         'b8f289095e5a64514f3a7adb680fc3d3'
         'd5c2ca6cb655070ac75a035376e8b052'
         'f2289e55621764d05e16a71ba09dd779'
         'f44242b0abb63290bd571a953bae34b9'
         '8f54b19db99483c9ee37054d302bf806'
         'cce58c740f92bf1b2f7ca4a58999a5fc'
         'a94c3e8bfe9e62198b8b51311f28c9a5'
         '8374ba08ca0cc5620ac2c94209122134'
         '19a72088f614a5f22004b2687a73f3ad')
_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

#pkgver() {
#  cd "$srcdir/angleproject"
#  grep -E "^#define ANGLE_M..OR_VERSION [0-9]+$" src/common/version.h | sed 's/#define ANGLE_M..OR_VERSION //' | tr '\n' '.'
#  printf "r%s.%s\n" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
#}

prepare() {
  cd "${srcdir}/angleproject"

  # Install additional .def files
  cp ../libGLESv2_mingw32.def src/libGLESv2/
  cp ../libEGL_mingw32.def src/libEGL/

  # Patches taken from Qt5
  # https://qt.gitorious.org/qt/qtbase/source/2302d386c7a1aa1a96658f79c236d6b8a59db7ac:src/angle/patches
  patch -p4 -i ../0000-General-fixes-for-ANGLE-2.1.patch
  patch -p4 -i ../0004-Make-it-possible-to-link-ANGLE-statically-for-single.patch
  patch -p4 -i ../0008-ANGLE-Dynamically-load-D3D-compiler-from-a-list-or-t.patch
  patch -p4 -i ../0009-ANGLE-Support-WinRT.patch
  patch -p4 -i ../0010-ANGLE-Enable-D3D11-for-feature-level-9-cards.patch
  patch -p4 -i ../0012-ANGLE-fix-semantic-index-lookup.patch
  patch -p4 -i ../0013-ANGLE-Add-support-for-querying-platform-device.patch
  patch -p4 -i ../0014-Let-ANGLE-use-multithreaded-devices-if-necessary.patch
  patch -p4 -i ../0015-ANGLE-Fix-angle-d3d11-on-MSVC2010.patch
  patch -p4 -i ../0016-ANGLE-Fix-compilation-with-MinGW-D3D11.patch
  patch -p4 -i ../0017-ANGLE-Fix-compilation-with-D3D9.patch
  patch -p4 -i ../0018-ANGLE-Fix-releasing-textures-after-we-kill-D3D11.patch

  # Undo a change from 0016-ANGLE-Fix-compilation-with-MinGW-D3D11.patch which
  # implements some missing stuff from the mingw.org toolchain, but which already
  # exists in the mingw-w64 toolchain (and causes breakage)
  patch -p1 -i ../angleproject-undo-mingw-org-compatibility.patch

  # Same as above but introduced by a change from 0015-ANGLE-Fix-angle-d3d11-on-MSVC2010.patch
  patch -p1 -i ../angleproject-undo-mingw-org-compatibility2.patch

  # Disable some debug code as it depends on the ID3DUserDefinedAnnotation
  # interface which isn't available in mingw-w64 yet
  # Patch for this is currently pending at http://source.winehq.org/patches/data/108405
  patch -p1 -i ../angleproject-disable-debug-annotations.patch

  # Undo a change from 0000-General-fixes-for-ANGLE-2.1.patch which renames
  # some shader references, but which doesn't rename the precompiled shaders
  patch -p1 -i ../angleproject-undo-shader-renames.patch

  # Prevent multiple definition errors during the final link of libGLESv2
  patch -p1 -i ../angleproject-prevent-multiple-definition-errors.patch

  # Revert commit 4de44cb and commit 409078f as qt5-qtwebkit still depends on it
  patch -p1 -R -i ../commit-4de44cb
  patch -p1 -R -i ../commit-409078f

  # Make sure an import library is created and the correct .def file is used during the build
  patch -p1 -i ../angleproject-include-import-library-and-use-def-file.patch

  # WebKit depends on symbols which are used in the static library called translator_hlsl
  # This static library is linked into the libGLESv2 shared library
  # To allow building WebKit export the required symbols in the libGLESv2 shared library
  patch -p1 -i ../angleproject-export-shader-symbols.patch

  # Executing .bat scripts on Linux is a no-go so make this a no-op
  echo "" > src/copy_compiler_dll.bat
  chmod +x src/copy_compiler_dll.bat
}

build() {
  cd "${srcdir}/angleproject"

  export CFLAGS="-O2 -g -pipe -Wall -Wp,-D_FORTIFY_SOURCE=2 -fexceptions --param=ssp-buffer-size=4"
  export CXXFLAGS="-O2 -g -pipe -Wall -Wp,-D_FORTIFY_SOURCE=2 -fexceptions --param=ssp-buffer-size=4"
  unset LDFLAGS

  for _arch in ${_architectures}; do
    mkdir -p build-${_arch} && pushd build-${_arch}

    export CXX="${_arch}-g++"
    export AR="${_arch}-ar"

    if [ "${_arch}" = "i686-w64-mingw32" ]; then
      target="win32"
    else
      target="win64"
    fi

    gyp -D OS=win -D TARGET=$target -D MSVS_VERSION="" --depth . -I ../build/common.gypi ../src/angle.gyp

    # Make sure the correct libraries are linked in
    sed -i s@'^LIBS :='@'LIBS := -ld3d9 -ldxguid'@ ../src/libGLESv2.target.mk
    sed -i s@'^LIBS :='@'LIBS := -ld3d9 -ldxguid -L. -lGLESv2'@ ../src/libEGL.target.mk

    make V=1 CXXFLAGS="-std=c++11 -msse2 -DUNICODE -D_UNICODE -g"

    # Also build static libraries (which are needed by the static Qt build)
    ${AR} rcs libGLESv2.a \
        out/Debug/obj.target/src/common/*.o \
        out/Debug/obj.target/src/common/win32/*.o \
        out/Debug/obj.target/src/compiler/translator/*.o \
        out/Debug/obj.target/src/compiler/translator/depgraph/*.o \
        out/Debug/obj.target/src/compiler/translator/timing/*.o \
        out/Debug/obj.target/src/compiler/preprocessor/*.o \
        out/Debug/obj.target/src/third_party/compiler/*.o \
        out/Debug/obj.target/src/third_party/murmurhash/*.o \
        out/Debug/obj.target/src/third_party/systeminfo/*.o \
        out/Debug/obj.target/src/libGLESv2/*.o \
        out/Debug/obj.target/src/libGLESv2/renderer/*.o \
        out/Debug/obj.target/src/libGLESv2/renderer/d3d/*.o \
        out/Debug/obj.target/src/libGLESv2/renderer/d3d/d3d9/*.o \
        out/Debug/obj.target/src/libGLESv2/renderer/d3d/d3d11/*.o

    ${AR} rcs libEGL.a \
        out/Debug/obj.target/libEGL/../src/common/RefCountObject.o \
        out/Debug/obj.target/libEGL/../src/common/angleutils.o \
        out/Debug/obj.target/libEGL/../src/common/debug.o \
        out/Debug/obj.target/libEGL/../src/common/event_tracer.o \
        out/Debug/obj.target/libEGL/../src/common/mathutil.o \
        out/Debug/obj.target/libEGL/../src/common/tls.o \
        out/Debug/obj.target/libEGL/../src/common/utilities.o \
        out/Debug/obj.target/libEGL/../src/libEGL/AttributeMap.o \
        out/Debug/obj.target/libEGL/../src/libEGL/Config.o \
        out/Debug/obj.target/libEGL/../src/libEGL/Display.o \
        out/Debug/obj.target/libEGL/../src/libEGL/Error.o \
        out/Debug/obj.target/libEGL/../src/libEGL/Surface.o \
        out/Debug/obj.target/libEGL/../src/libEGL/libEGL.o \
        out/Debug/obj.target/libEGL/../src/libEGL/main.o \
        out/Debug/obj.target/libEGL/../src/common/win32/NativeWindow.o

    popd
  done
}

package() {
  for _arch in ${_architectures}; do
    cd "${srcdir}/angleproject/build-${_arch}"
    mkdir -p "${pkgdir}/usr/${_arch}/"{bin,lib,include}
    install out/Debug/src/libGLESv2.so "${pkgdir}/usr/${_arch}/bin/libGLESv2.dll"
    install out/Debug/src/libEGL.so "${pkgdir}/usr/${_arch}/bin/libEGL.dll"
    install libGLESv2.a "${pkgdir}/usr/${_arch}/lib/"
    install libEGL.a "${pkgdir}/usr/${_arch}/lib/"
    install libGLESv2.dll.a "${pkgdir}/usr/${_arch}/lib/"
    install libEGL.dll.a "${pkgdir}/usr/${_arch}/lib/"
    cp -Rv ../include/* "${pkgdir}/usr/${_arch}/include/"

    ${_arch}-strip --strip-unneeded "${pkgdir}/usr/${_arch}/bin/"*.dll
    ${_arch}-strip -g "${pkgdir}/usr/${_arch}/lib/"*.a
  done
}
