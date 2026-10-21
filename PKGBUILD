# Maintainer:  dreieck (https://aur.archlinux.org/account/dreieck)
# Maintainer:  Afnan Enayet <afnan at afnan.io>
# Contributor: Eric Engestrom (https://aur.archlinux.org/account/1ace)

_pkgname=hdrview
pkgname="${_pkgname}-git"
epoch=0
pkgver=3.0.2+89.r1498.20261021.5e707264
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
#Cloning into '/var/cache/makepkg/build/hdrview-git/src/build/_deps/jxl-src/third_party/libjpeg-turbo'...
#Cloning into '/var/cache/makepkg/build/hdrview-git/src/build/_deps/jxl-src/third_party/libpng'...
#Cloning into '/var/cache/makepkg/build/hdrview-git/src/build/_deps/jxl-src/third_party/sjpeg'...
#Cloning into '/var/cache/makepkg/build/hdrview-git/src/build/_deps/jxl-src/third_party/skcms'...
#Cloning into '/var/cache/makepkg/build/hdrview-git/src/build/_deps/jxl-src/third_party/zlib'...

depends=(
  # (Almost) surely needed (2026-10-21):
  glibc
  imath
  libdbus-1.so
  libexif.so
  libgcc_s.so
  libfmt.so
  libfreetype.so
  libheif.so
  libjpeg.so
  libjxl.so
  libjxl_threads.so
  liblcms2.so
  libpng16.so
  libraw
  libstdc++.so
  libspdlog.so
  libtiff.so
  libultrahdr
  libwebp.so
  libwebpdemux.so
  libx11
  libxext
  libz.so
  openexr
  openjpeg2
  sdl2
  tinyxml2
)
makedepends=(
  ## Probably _not_ needed anymore (2026-10-21):
  #ffmpeg
  #gperftools
  #gtest
  #kvazaar
  #libdeflate
  #nasm
  #openh264
  #openjph
  #rav1e
  #svt-av1
  #uvg266
  #vulkan-icd-loader
  #vvenc
  #vvdec
  #x265


  # Needed for build system itself (2026-10-21):
  cmake
  git
  ninja

  # (Almost) surely needed (2026-10-21):
  cli11
  dav1d
  egl-wayland
  fmt
  'freetype2>=2.12'
  glad
  glfw
  lcms2
  libdbus
  libexif
  libgcc
  libheif
  libjpeg-turbo
  libjpeg.so     # Move to 'depends' array.
  libjxl
  libpng
  libstdc++
  libtiff
  libwebp
  libx11
  libxext
  libxkbcommon
  nlohmann-json
  #opengl
  sdl
  spdlog
  wayland
  zlib

  ## The following packages exists in Arch Linux, but are not picked up by the build system (2026-10-21):
  # plutosvg  # 2026-10-21: Downloads and builds 'plutosvg' anyway.
  # plutovg   # 2026-10-21: Downloads and builds 'plutovg' anyway.
  # qoi       # 2026-10-21: Arch Linux package 'qoi' does not provide CMake files, so it won't be used.
  # stb       # 2026-10-21: Arch Linux package 'stb' does not provide CMake files, so it won't be used.

  ## The following packages exists in Arch Linux, but may not be installed when building this (2026-10-21):
  # imgui-git # Fails to build when 'imgui' is installed. Need to download it locally to build directory.
  # imgui     # Fails to build when 'imgui' is installed. Need to download it locally to build directory.
  # miniz     # 2026-10-21: Having it installed fails with 'Could not find or download miniz library', see https://github.com/wkjarosz/hdrview/issues/244.

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

_CFLAGSADDITIONS="-w -Wno-missing-field-initializers"
_cmake_preset="linux-local"  # See https://github.com/wkjarosz/hdrview#building-from-source.

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
  if pacman -Qqi miniz > /dev/null 2>&1; then
    error "Package 'miniz' is installed. Build fails in that case. Please build in an environment where 'miniz' is not installed."
    return 99
  fi

  # Run cmake in `prepare()` since it will download stuff.
  _cmake_config=(
    --preset "${_cmake_preset}"
    -S hdrview -B build
    -G Ninja
    -DCMAKE_BUILD_TYPE=Release
    -DCMAKE_INSTALL_PREFIX=/usr

    -DCPM_DOWNLOAD_ALL=OFF
    -DCPM_USE_LOCAL_PACKAGES=ON     # '=ON': Use system installed packages.
    -DCPM_LOCAL_PACKAGES_ONLY=OFF   # '=OFF': Download packages that are not found locally installed.
    -DFETCHCONTENT_QUIET=OFF

    -DHDRVIEW_PORTABLE_INSTALL=OFF
    -DHDRVIEW_BUILD_FUZZERS=OFF
    -DHDRVIEW_BUILD_GUI_TESTS=OFF
    -DHDRVIEW_BUILD_TESTS=OFF
    -DHDRVIEW_ENABLE_AVCI=ON
    -DHDRVIEW_ENABLE_AVIF=ON
    -DHDRVIEW_ENABLE_DAV1D=ON
    -DHDRVIEW_ENABLE_HDR_DISPLAY=ON
    -DHDRVIEW_ENABLE_HEIC=ON
    -DHDRVIEW_ENABLE_HTJ2K=ON
    -DHDRVIEW_ENABLE_IPC=ON
    -DHDRVIEW_ENABLE_J2K=ON
    -DHDRVIEW_ENABLE_LIBJPEG=ON
    -DHDRVIEW_ENABLE_LIBJXL=ON
    -DHDRVIEW_ENABLE_LIBPNG=ON
    -DHDRVIEW_ENABLE_LIBRAW=ON
    -DHDRVIEW_ENABLE_LIBTIFF=ON
    -DHDRVIEW_ENABLE_LIBUHDR=ON
    -DHDRVIEW_ENABLE_LIBWEBP=ON
    -DHDRVIEW_ENABLE_X3F=ON

    -DHELLOIMGUI_FETCH_IMGUI_TEST_ENGINE=OFF
    -DHELLOIMGUI_DOWNLOAD_SDL_IF_NEEDED=OFF
    -DHELLOIMGUI_FREETYPE_STATIC=OFF
    -DHELLOIMGUI_HAS_DIRECTX11=OFF
    -DHELLOIMGUI_HAS_DIRECTX12=OFF
    -DHELLOIMGUI_HAS_METAL=OFF
    -DHELLOIMGUI_HAS_OPENGL=ON
    -DHELLOIMGUI_HAS_OPENGL3=ON
    # -DHELLOIMGUI_HAS_VULKAN=ON                # '=ON': 2026-10-21: 'hello_imgui' fails to build with 'image_vulkan.cpp:103:52: error: cannot convert ‘VkSampler’ {aka ‘VkSampler_T*’} to ‘VkImageView’ {aka ‘VkImageView_T*’}'.
    -DHELLOIMGUI_HEADLESS=OFF
    -DHELLOIMGUI_INSTALL=OFF
    -DHELLOIMGUI_STB_IMAGE_IMPLEMENTATION=ON
    -DHELLOIMGUI_STB_IMAGE_WRITE_IMPLEMENTATION=ON
    -DHELLOIMGUI_USE_EXTERNAL_JSON=OFF        # 2026-10-21: Set '=OFF', otherwise error: 'Target "hello_imgui" links to: nlohmann_json::nlohmann_json but the target was not found.'
    -DHELLOIMGUI_USE_FREETYPE=ON
    -DHELLOIMGUI_USE_FREETYPE_PLUTOSVG=ON
    -DHELLOIMGUI_USE_IMGUI_CMAKE_PACKAGE=OFF  # '=ON': 'hello_imgui' should use system installed 'imgui'. '=OFF': Don't do that. Set to '=OFF' (and do not have any 'imgui' locally installed), since otherwise 'hello_imgui' ususally fails to build.
    -DHELLOIMGUI_USE_SDL2=ON
    -DHELLOIMGUI_WITH_IMGUIWS=OFF             # '=ON': 2026-10-21: 'hello_imgui' fails to configure.
    -DHELLOIMGUI_WITH_NETIMGUI=OFF            # '=ON': 2026-10-21: 'hello_imgui' fails to configure.
    -DHELLOIMGUI_WITH_TEST_ENGINE=OFF

    ## If system installed 'libultrahdr' is used, those options are obsolete.
    #-DUHDR_ENABLE_GLES=ON
    #-DUHDR_ENABLE_INTRINSICS=ON
    #-DUHDR_ENABLE_LOGS=OFF
    #-DUHDR_ENABLE_WERROR=OFF
    #-DUHDR_WRITE_ISO=ON
    #-DUHDR_WRITE_XMP=ON

    # -Dglfw_DIR=/usr/lib/cmake/glfw3           # The build system downloads and builds a HDR-enabled fork of glfw (Tom94/glfw) anyway. No system installed glfw is used. So do not specify 'glfw_DIR'.

    -Wno-author -Wno-deprecated -Wno-experimental -Wno-policy
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

  cmake --build build --preset "${_cmake_preset}-release"
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

  #rm -Rf "${pkgdir}/usr"/{include,lib}

  #rm -Rf "${pkgdir}/usr/assets"
  #rm -Rf "${pkgdir}/usr/share/hello-imgui"
  #rm -f  "${pkgdir}/usr"/hello_* rm -f "${pkgdir}/usr"/Hello_*


  ## Install documentation and license
  for _docfile in README.md TODO.md CLAUDE.md git.log; do
    install -D -m644 -v "$srcdir/${_pkgname}/${_docfile}" "${pkgdir}/usr/share/doc/${_pkgname}/${_docfile}"
  done
  install -D -m644 -v "$srcdir/${_pkgname}/LICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt"
}
