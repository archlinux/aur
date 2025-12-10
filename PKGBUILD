# Maintainer:  dreieck (https://aur.archlinux.org/account/dreieck)
# Maintainer:  Afnan Enayet <afnan at afnan.io>
# Contributor: Eric Engestrom (https://aur.archlinux.org/account/1ace)

_pkgname=hdrview
pkgname="${_pkgname}-git"
epoch=0
pkgver=2.6.0+91.r825.20251210.f9f6e34
pkgrel=1
pkgdesc='High dynamic range (HDR) image viewer and comparison tool'
url='https://github.com/wkjarosz/hdrview'
# url='https://wkjarosz.github.io/hdrview/' # This actually is an online version of the software, not a website about the software.
arch=(
  'x86_64'
  'i686'
  'aarch64'
  'armv6h'
  'armv7h'
)
license=('BSD-3-Clause')
makedepends=(
  'brotli'
  'cmake'
  'dav1d'
  'ffmpeg'
  #'fmt'            # When not using system packages, this gets downloaded to the build directory.
  'freetype2>=2.12'
  'gcc-libs'
  'git'
  'glibc'
  'glfw'
  'gperftools'
  'gtest'
  'highway'
  #'imath'          # When not using system packages, this gets downloaded to the build directory.
  # 'imgui-git' # Fails to build when 'imgui' is installed. Need to download it locally to build directory.
  'kvazaar'
  'lcms2'
  'libde265'
  #'libdeflate'     # When not using system packages, this gets downloaded to the build directory.
  'libjpeg'
  'libwebp'
  'libx11'
  'libxext'
  #'libjxl'         # When not using system packages, this gets downloaded to the build directory.
  'nasm'
  'ninja'
  'nlohmann-json'
  #'openexr'        # When not using system packages, this gets downloaded to the build directory.
  'openjpeg2'
  #'plutosvg'       # When not using system packages, this gets downloaded to the build directory.
  #'plutovg'        # When not using system packages, this gets downloaded to the build directory.
  'rav1e'
  'sdl2'
  #'spdlog'         # When not using system packages, this gets downloaded to the build directory.
  'svt-av1'
  'uvg266'
  'vvenc'           # Seems to be fixed in `aur/vvenc` (2025-08-25): As of 2025-08-24, vvenc-git is needed because vvenc does not install the file `/usr/lib/cmake/vvenc/vvencTargets-shared.cmake`. See https://aur.archlinux.org/packages/vvenc#comment-1037407.
  'vvdec'
  'vulkan-icd-loader'
  'x265'
)
depends=(
  'gcc-libs'
  'glibc'
  'glfw'
  'highway'
  'libbrotlienc.so'    # Provided by 'brotli'
  'libbrotlidec.so'    # Provided by 'brotli'
  'libbrotlicommon.so' # Provided by 'brotli'
  'libopenh264.so'
  'libde265'
  'libfreetype.so'
  'libjpeg.so'
  'liblcms2.so'
  'libx11'
  'libxext'
  'sdl2'
  'vulkan-icd-loader'
)
source=(
  "${_pkgname}::git+https://github.com/wkjarosz/hdrview.git"
)
sha256sums=(
  'SKIP'
)
provides=(
  "${_pkgname}=${pkgver}"
)
conflicts=(
  "${_pkgname}"
)
if which ccache > /dev/null 2>&1; then
  options+=('ccache')
fi

_CFLAGSADDITIONS="-w"

_cpuflag2cmake() {
  # returns "ON", if the host CPU supports the CPU flag submitted via argument $1. Returns "OFF" otherwise. ("returning" means printing to stdout.)
  if grep -E '^flags[[:space:]]*:' /proc/cpuinfo | head -n1 | grep -qFwi "$1"; then
    printf '%s' "ON"
  else
    printf '%s' "OFF"
  fi
}

prepare() {
  CFLAGS+=" ${_CFLAGSADDITIONS}"
  CXXFLAGS+=" ${_CFLAGSADDITIONS}"
  export CFLAGS
  export CXXFLAGS

  if pacman -Qqi imgui > /dev/null 2>&1; then
    error "Package 'imgui' is installed. Build fails in that case. Please build in an environment where 'imgui' is not installed."
    return 99
  fi

  # Run cmake in `prepare()` since it will download stuff.
  _cmake_config=(
    -DBUILD_WEBSITE=OFF
    -DCMAKE_INSTALL_PREFIX=/usr
    -DEXEC_INSTALL_PREFIX=/usr/bin
    -DLIB_INSTALL_DIR=/usr/lib
    # -DLIB_INSTALL_DIR=/opt/hdrview/lib
    -DCMAKE_BUILD_TYPE=Release
    -DCPM_DONT_UPDATE_MODULE_PATH=OFF
    -DCPM_DOWNLOAD_ALL=OFF
    -DCPM_LOCAL_PACKAGES_ONLY=OFF
    -DCPM_USE_LOCAL_PACKAGES=OFF
    
    # -DBoost_NO_BOOST_CMAKE=OFF
    # -Dcli11_DIR=/usr/share/cmake/CLI11
    # -DEGL_INCLUDE_DIRS=/usr/include/EGL
    # -DEGL_LIBRARIES=/usr/lib
    
    -DENABLE_CLANG_TIDY=OFF
    -DENABLE_COVERAGE=OFF
    -DENABLE_CPPCHECK=OFF
    -DENABLE_EXPERIMENTAL_FEATURES=ON
    -DENABLE_EXPERIMENTAL_MINI_FORMAT=OFF
    -DENABLE_PARALLEL_TILE_DECODING=ON
    -DENABLE_PLUGIN_LOADING=ON
    
    -DFETCHCONTENT_FULLY_DISCONNECTED=OFF
    -DFETCHCONTENT_UPDATES_DISCONNECTED=OFF
    -DFETCHCONTENT_QUIET=OFF
    
    -DFMT_CUDA_TEST=OFF
    -DFMT_DOC=OFF
    -DFMT_FUZZ=OFF
    -DFMT_INSTALL=OFF
    # -DFMT_MODULE=OFF
    # -DFMT_OS=ON
    -DFMT_PEDANTIC=OFF
    -DFMT_TEST=OFF
    -DFMT_WERROR=OFF
    
    # -DHDRVIEW_BUILD_UHDR_DEPS=OFF
    -DHDRVIEW_ENABLE_HEIF=ON
    -DHDRVIEW_ENABLE_JPEGXL=ON
    -DHDRVIEW_ENABLE_LIBJPEG=ON
    -DHDRVIEW_ENABLE_LIBPNG=ON
    -DHDRVIEW_ENABLE_UHDR=ON
    # -DHDRVIEW_ICONSET=HDRVIEW_ICONSET_MS
    # -DHDRVIEW_IGNORE_BREW_PORTS=OFF
    -DHDRVIEW_PORTABLE_INSTALL=OFF
    
    -DHELLOIMGUI_ADD_APP_WITH_INSTALL=OFF
    -DHELLOIMGUI_BUILD_DEMOS=OFF
    -DHELLOIMGUI_BUILD_DOCS=OFF
    -DHELLOIMGUI_BUILD_GLFW_OPENGL3_BARE_EXAMPLE=OFF
    -DHELLOIMGUI_BUILD_IMGUI=ON
    -DHELLOIMGUI_BUILD_TESTS=OFF
    -DHELLOIMGUI_DOWNLOAD_FREETYPE_IF_NEEDED=OFF
    -DHELLOIMGUI_DOWNLOAD_GLFW_IF_NEEDED=OFF
    -DHELLOIMGUI_DOWNLOAD_SDL_IF_NEEDED=OFF
    -DHELLOIMGUI_FETCH_IMGUI_TEST_ENGINE=OFF
    -DHELLOIMGUI_FREETYPE_STATIC=OFF
    -DHELLOIMGUI_HAS_OPENGL=ON
    -DHELLOIMGUI_HAS_OPENGL3=ON
    -DHELLOIMGUI_HAS_VULKAN=ON
    -DHELLOIMGUI_HEADLESS=OFF
    -DHELLOIMGUI_INSTALL=OFF
    -DHELLOIMGUI_STB_IMAGE_IMPLEMENTATION=ON
    -DHELLOIMGUI_STB_IMAGE_WRITE_IMPLEMENTATION=ON
    -DHELLOIMGUI_USE_EXTERNAL_JSON=OFF
    -DHELLOIMGUI_USE_FREETYPE=ON
    -DHELLOIMGUI_USE_FREETYPE_PLUTOSVG=ON
    -DHELLOIMGUI_USE_IMGUI_CMAKE_PACKAGE=OFF
    -DHELLOIMGUI_USE_GLFW3=ON
    -DHELLOIMGUI_USE_SDL2=ON
    -DHELLOIMGUI_WITH_IMGUIWS=OFF
    -DHELLOIMGUI_WITH_NETIMGUI=OFF
    -DHELLOIMGUI_WITH_TEST_ENGINE=OFF
    
    -DHWY_CMAKE_HEADER_ONLY=OFF
    -DHWY_CMAKE_RVV=`_cpuflag2cmake rvv`
    -DHWY_CMAKE_SSE2=`_cpuflag2cmake sse2`
    -DHWY_ENABLE_INSTALL=OFF
    -DHWY_WARNINGS_ARE_ERRORS=OFF
    -DIMATH_ENABLE_LARGE_STACK=ON
    -DIMATH_HALF_USE_LOOKUP_TABLE=ON
    -DIMATH_INSTALL_PKG_CONFIG=OFF
    -DIMATH_INSTALL_SYM_LINK=OFF
    -DIMATH_USE_CLANG_TIDY=OFF
    -DJPEG_INCLUDE_DIR=/usr/include
    -DJPEG_LIBRARY_DEBUG=/usr/lib/libjpeg.so
    -DJPEG_LIBRARY_RELEASE=/usr/lib/libjpeg.so
    
    -DJPEGXL_BUNDLE_LIBPNG=OFF
    -DJPEGXL_ENABLE_AVX512=`_cpuflag2cmake avx512f`
    -DJPEGXL_ENABLE_AVX512_SPR=`_cpuflag2cmake avx512_bf16`  # Assuming that `avx_bf16` means "AVX-512FP16".
    -DJPEGXL_ENABLE_AVX512_ZEN4=OFF                          # Don't know how to test for it.
    -DJPEGXL_ENABLE_BENCHMARK=OFF
    -DJPEGXL_ENABLE_BOXES=ON
    -DJPEGXL_ENABLE_COVERAGE=OFF
    -DJPEGXL_ENABLE_DEVTOOLS=OFF
    -DJPEGXL_ENABLE_DOXYGEN=OFF
    -DJPEGXL_ENABLE_EXAMPLES=OFF
    -DJPEGXL_ENABLE_FUZZERS=OFF
    -DJPEGXL_ENABLE_JNI=OFF
    -DJPEGXL_ENABLE_JPEGLI=OFF
    -DJPEGXL_ENABLE_JPEGLI_LIBJPEG=OFF
    -DJPEGXL_ENABLE_MANPAGES=OFF
    -DJPEGXL_ENABLE_OPENEXR=ON
    -DJPEGXL_ENABLE_PLUGINS=OFF
    -DJPEGXL_ENABLE_SIZELESS_VECTORS=ON
    -DJPEGXL_ENABLE_SJPEG=ON
    -DJPEGXL_ENABLE_SKCMS=OFF
    -DJPEGXL_ENABLE_TCMALLOC=ON
    -DJPEGXL_ENABLE_TOOLS=OFF
    -DJPEGXL_ENABLE_TRANSCODE_JPEG=ON
    -DJPEGXL_ENABLE_VIEWERS=OFF
    -DJPEGXL_ENABLE_WASM_THREADS=ON
    -DJPEGXL_FORCE_NEON=OFF
    -DJPEGXL_FORCE_SYSTEM_BROTLI=ON
    -DJPEGXL_FORCE_SYSTEM_GTEST=ON
    -DJPEGXL_FORCE_SYSTEM_HWY=ON
    -DJPEGXL_FORCE_SYSTEM_LCMS2=ON
    -DJPEGXL_INSTALL_JPEGLI_LIBJPEG=OFF
    -DJPEGXL_TEST_TOOLS=OFF
    -DJPEGXL_WARNINGS_AS_ERRORS=OFF
    
    -DLIBDEFLATE_BUILD_GZIP=OFF
    -DLIBDEFLATE_BUILD_TESTS=OFF
    -DLIBDEFLATE_COMPRESSION_SUPPORT=ON
    -DLIBDEFLATE_DECOMPRESSION_SUPPORT=ON
    -DLIBDEFLATE_FREESTANDING=OFF
    -DLIBDEFLATE_GZIP_SUPPORT=ON
    -DLIBDEFLATE_USE_SHARED_LIB=ON
    -DLIBDEFLATE_ZLIB_SUPPORT=ON
    
    -DMATH_LIBRARY=/usr/lib/libm.so
    -DM_LIBRARY=/usr/lib/libm.so
    
    -DOPENEXR_BUILD_PYTHON=OFF
    -DOPENEXR_ENABLE_LARGE_STACK=ON
    -DOPENEXR_ENABLE_THREADING=ON
    -DOPENEXR_FORCE_INTERNAL_IMATH=OFF
    -DOPENEXR_INSTALL_DOCS=OFF
    -DOPENEXR_INSTALL_PKG_CONFIG=OFF
    -DOPENEXR_INSTALL_TOOLS=OFF
    -DOPENEXR_TEST_LIBRARIES=OFF
    -DOPENEXR_TEST_PYTHON=OFF
    -DOPENEXR_TEST_TOOLS=OFF
    -DOPENEXR_USE_CLANG_TIDY=OFF
    
    -DOpenGL_GL_PREFERENCE=GLVND
    
    -DPLUTOVG_BUILD_EXAMPLES=OFF
    
    -DPNG_TOOLS=OFF
    -DPNG_HARDWARE_OPTIMIZATIONS=ON
    
    -DPYTHON=OFF
    
    -DSPDLOG_BUILD_ALL=OFF
    -DSPDLOG_BUILD_BENCH=OFF
    -DSPDLOG_BUILD_EXAMPLE=OFF
    -DSPDLOG_BUILD_EXAMPLE_HO=OFF
    -DSPDLOG_BUILD_PIC=ON
    -DSPDLOG_BUILD_SHARED=OFF
    -DSPDLOG_BUILD_TESTS=OFF
    -DSPDLOG_BUILD_TESTS_HO=OFF
    -DSPDLOG_BUILD_WARNINGS=OFF
    -DSPDLOG_CLOCK_COARSE=OFF
    -DSPDLOG_DISABLE_DEFAULT_LOGGER=OFF
    -DSPDLOG_ENABLE_PCH=OFF
    -DSPDLOG_FMT_EXTERNAL_HO=OFF
    -DSPDLOG_NO_ATOMIC_LEVELS=OFF
    -DSPDLOG_NO_EXCEPTIONS=OFF
    -DSPDLOG_NO_THREAD_ID=OFF
    -DSPDLOG_NO_TLS=OFF
    -DSPDLOG_PREVENT_CHILD_FD=OFF
    -DSPDLOG_SANITIZE_ADDRESS=OFF
    -DSPDLOG_SYSTEM_INCLUDES=OFF
    -DSPDLOG_TIDY=OFF
    -DSPDLOG_USE_STD_FORMAT=OFF
    -DSPDLOG_WCHAR_FILENAMES=OFF
    -DSPDLOG_WCHAR_SUPPORT=OFF
    
    -DUHDR_BUILD_DEPS=OFF
    -DUHDR_BUILD_JAVA=OFF
    -DUHDR_ENABLE_GLES=OFF
    -DUHDR_ENABLE_INTRINSICS=ON
    -DUHDR_ENABLE_LOGS=OFF
    -DUHDR_ENABLE_WERROR=OFF
    -DUHDR_WRITE_ISO=ON
    -DUHDR_WRITE_XMP=ON
    
    -DWITH_AOM_DECODER=ON
    -DWITH_AOM_DECODER_PLUGIN=ON
    -DWITH_AOM_ENCODER=ON
    -DWITH_AOM_ENCODER_PLUGIN=ON
    -DWITH_DAV1D=ON
    -DWITH_DAV1D_PLUGIN=ON
    -DWITH_FFMPEG_DECODER=ON
    -DWITH_FFMPEG_DECODER_PLUGIN=ON
    -DWITH_HEADER_COMPRESSION=ON
    -DWITH_JPEG_DECODER=ON
    -DWITH_JPEG_DECODER_PLUGIN=ON
    -DWITH_JPEG_ENCODER=ON
    -DWITH_JPEG_ENCODER_PLUGIN=ON
    -DWITH_KVAZAAR=ON
    -DWITH_KVAZAAR_PLUGIN=ON
    -DWITH_LIBSHARPYUV=ON
    -DWITH_OPENJPH_ENCODER=OFF
    -DWITH_OPENJPH_ENCODER_PLUGIN=OFF
    -DWITH_OpenJPEG_DECODER=ON
    -DWITH_OpenJPEG_DECODER_PLUGIN=ON
    -DWITH_OpenJPEG_ENCODER=ON
    -DWITH_OpenJPEG_ENCODER_PLUGIN=ON
    -DWITH_RAV1E=ON
    -DWITH_RAV1E_PLUGIN=ON
    -DWITH_REDUCED_VISIBILITY=OFF
    -DWITH_SvtEnc=ON
    -DWITH_SvtEnc_PLUGIN=ON
    -DWITH_UNCOMPRESSED_CODEC=ON
    -DWITH_UVG266=ON
    -DWITH_UVG266_PLUGIN=ON
    -DWITH_VVDEC=ON
    -DWITH_VVDEC_PLUGIN=ON
    -DWITH_VVENC=ON
    -DWITH_VVENC_PLUGIN=ON
    -DWITH_X265=ON
    -DWITH_X265_PLUGIN=ON
    
    -DZLIB_VERBOSE=OFF
    
    -Wno-dev
  )

  cmake -S "${_pkgname}" -B build \
    -G Ninja \
    "${_cmake_config[@]}"

  cd "${_pkgname}"
  git log > "git.log"
}

pkgver() {
  cd "$srcdir/${_pkgname}"

  _ver="$(git describe  --tags | sed -E 's|-g[0-9a-fA-F]*$||' | sed -E 's|^[vV]||' | tr '-' '+')"
  _rev="$(git rev-list --count HEAD)"
  _date="$(git log -1 --date=format:"%Y%m%d" --format="%ad")"
  _hash="$(git rev-parse --short HEAD)"

  if [ -z "${_ver}" ]; then
      error "Version could not be determined."
  return 1
  else
      printf '%s' "${_ver}.r${_rev}.${_date}.${_hash}"
  fi
}

build() {
  CFLAGS+=" ${_CFLAGSADDITIONS}"
  CXXFLAGS+=" ${_CFLAGSADDITIONS}"
  export CFLAGS
  export CXXFLAGS

  cmake --build build
}

package() {
  CFLAGS+=" ${_CFLAGSADDITIONS}"
  CXXFLAGS+=" ${_CFLAGSADDITIONS}"
  export CFLAGS
  export CXXFLAGS

  ## Install main project
  DESTDIR="${pkgdir}" cmake --install build

  ## Add a lowercase executable symlink
  ln -svr "${pkgdir}/usr/bin/HDRView" "${pkgdir}/usr/bin/hdrview"

  ## Clean up stuff we do not want to install locally
  #rm -Rf "${pkgdir}/opt/hdrview/lib"
#   rm -Rf "${pkgdir}/usr/include/glad"
#   rm -Rf "${pkgdir}/usr/include/hello_imgui"
#   rm -Rf "${pkgdir}/usr/include/jxl"
#   rm -Rf "${pkgdir}/usr/include/KHR"
#   rm -Rf "${pkgdir}/usr/include/libexif"
#   rm -Rf "${pkgdir}/usr/include/libheif"
#   rm -Rf "${pkgdir}/usr/include/plutovg"
#   rm -f  "${pkgdir}/usr/include"/imconfig.h
#   rm -f  "${pkgdir}/usr/include"/imgui*.h
#   rm -f  "${pkgdir}/usr/include"/stb_image*.h
#   rm -f  "${pkgdir}/usr/include"/zconf.h
#   rm -f  "${pkgdir}/usr/include"/zlib.h
#   rm -f  "${pkgdir}/usr/lib"/*.a
#   rm -Rf "${pkgdir}/usr/lib/cmake/hello_imgui"
#   rm -Rf "${pkgdir}/usr/lib/cmake/libheif"
#   rm -Rf "${pkgdir}/usr/lib/cmake/plutovg"
#   rm -Rf "${pkgdir}/usr/lib/cmake/zlib"
#   rm -Rf "${pkgdir}/usr/lib/libheif"
#   rm -f  "${pkgdir}/usr/lib/pkgconfig"/libexif.pc
#   rm -f  "${pkgdir}/usr/lib/pkgconfig"/libheif.pc
#   rm -f  "${pkgdir}/usr/lib/pkgconfig"/libjxl*.pc
#   rm -f  "${pkgdir}/usr/lib/pkgconfig"/zlib.pc

  rm -Rf "${pkgdir}/usr"/{include,lib}

  rm -Rf "${pkgdir}/usr/assets"
  rm -Rf "${pkgdir}/usr/share/hello-imgui"
  rm -f  "${pkgdir}/usr"/hello_* rm -f "${pkgdir}/usr"/Hello_*


  ## Install documentation and license
  for _docfile in README.md TODO.md git.log; do
    install -D -m644 -v "$srcdir/${_pkgname}/${_docfile}" "${pkgdir}/usr/share/doc/${_pkgname}/${_docfile}"
  done
  install -D -m644 -v "$srcdir/${_pkgname}/LICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt"
}
