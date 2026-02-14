# Maintainer: Karl-Felix Glatzer <karl.glatzer@gmx.de>
# Contributor: Daniel Bermond <dbermond@archlinux.org>

pkgname=mingw-w64-libjxl
pkgver=0.11.2
pkgrel=1
pkgdesc='JPEG XL image format reference implementation (mingw-w64)'
arch=('any')
url='https://jpeg.org/jpegxl/'
license=('BSD-3-Clause')
depends=('mingw-w64-crt')
options=(!strip !buildflags staticlibs !debug)
# TODO: Add dependency for gimp plugin
# TODO: Add dependency for java bindings
makedepends=(
  'git'
  'mingw-w64-cmake'
  'mingw-w64-gcc'
  'mingw-w64-gdk-pixbuf2'
)
#	     'gtest' 'python' 'asciidoc' 'doxygen'
#             'graphviz' 'xdg-utils')
depends=(
  'mingw-w64-brotli'
  'mingw-w64-giflib'
  'mingw-w64-highway'
  'mingw-w64-libjpeg-turbo'
  'mingw-w64-libpng'
  'mingw-w64-openexr'
)
optdepends=('mingw-w64-gdk-pixbuf2: for gdk-pixbuf loader')
#            'mingw-w64-gimp: for gimp plugin'
#            'java-runtime: for JNI bindings')
source=("git+https://github.com/libjxl/libjxl.git#tag=v${pkgver}"
        'git+https://github.com/mm2/Little-CMS.git'
        'git+https://github.com/webmproject/sjpeg.git'
        'git+https://skia.googlesource.com/skcms.git'
        'libjxl-testdata'::'git+https://github.com/libjxl/testdata.git'
        'git+https://github.com/libjpeg-turbo/libjpeg-turbo.git')
sha256sums=('0d1a459ef8390a8d991f8e6501c0292cc5f443a7663aeedf0922df855a61f9a2'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP')
_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

prepare() {
    git -C libjxl submodule init
    local _submodule
    for _submodule in libjpeg-turbo sjpeg skcms
    do
        git -C libjxl config --local "submodule.third_party/${_submodule}.url" "${srcdir}/${_submodule}"
    done

    for _submodule in brotli googletest highway libpng zlib
    do
        git -C libjxl config --local "submodule.third_party/${_submodule}.update" none
    done

    git -C libjxl config --local submodule.third_party/lcms.url "${srcdir}/Little-CMS"
    git -C libjxl config --local submodule.third_party/testdata.url "${srcdir}/libjxl-testdata"
    git -C libjxl -c protocol.file.allow='always' submodule update
}

build() {
  for _arch in ${_architectures}; do
    if [ "${_arch}" == "i686-w64-mingw32" ]
    then
      EXTRA_CFLAGS="-msse2"
    else
      unset EXTRA_CFLAGS
    fi

    CFLAGS="$CFLAGS $EXTRA_CFLAGS" CXXFLAGS="$CFLAGS $EXTRA_CFLAGS" ${_arch}-cmake -B build-${_arch} -S libjxl \
        -DCMAKE_BUILD_TYPE:STRING='None' \
        -DCMAKE_POLICY_VERSION_MINIMUM:STRING='3.5.0' \
        -DJPEGXL_BUNDLE_LIBPNG:BOOL='false' \
        -DJPEGXL_ENABLE_AVX512:BOOL='true' \
        -DJPEGXL_ENABLE_BENCHMARK:BOOL='false' \
        -DJPEGXL_ENABLE_EXAMPLES:BOOL='false' \
        -DJPEGXL_ENABLE_FUZZERS:BOOL='false' \
        -DJPEGXL_ENABLE_PLUGINS:BOOL='false' \
        -DJPEGXL_ENABLE_VIEWERS:BOOL='false' \
        -DJPEGXL_FORCE_SYSTEM_BROTLI:BOOL='true' \
        -DJPEGXL_FORCE_SYSTEM_GTEST:BOOL='true' \
        -DJPEGXL_FORCE_SYSTEM_HWY:BOOL='true' \
	-DBUILD_TESTING=OFF \
        -Wno-dev
    make -C build-${_arch} all
  done
}

# TODO: Add gtest and enable tests
#check() {
#  for _arch in ${_architectures}; do
#    make -C build-${_arch} test
#  done
#}

package() {
  for _arch in ${_architectures}; do
    DESTDIR="$pkgdir" cmake --install build-${_arch}
  done

  install -D -m644 libjxl/{LICENSE,PATENTS} -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
