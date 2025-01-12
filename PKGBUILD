# Maintainer:  dreieck (https://aur.archlinux.org/account/dreieck)
# Maintainer:  Afnan Enayet <afnan at afnan.io>
# Contributor: Eric Engestrom (https://aur.archlinux.org/account/1ace)

_pkgname=hdrview
pkgname="${_pkgname}-git"
epoch=0
pkgver=2.1.0+8.r427.20250111.dfedb14
pkgrel=1
pkgdesc='High dynamic range (HDR) image viewer and comparison tool'
url='https://github.com/wkjarosz/hdrview'
arch=(
  'x86_64'
  'i686'
)
license=('BSD-3-Clause')
makedepends=(
  'cmake'
  'freetype2>=2.12'
  'git'
  'glfw'
  # 'imgui-git' # Fails to build when 'imgui' is installed.
  'libdeflate'
  'libjpeg'
  'libx11'
  'libxext'
  'fmt'
  'imath'
  'nasm'
  'ninja'
  'plutosvg'
  'sdl2'
  'spdlog'
  'vulkan-icd-loader'
)
depends=(
  'gcc-libs'
  'glibc'
  'glfw'
  'imath'
  'libfmt.so'
  'libfreetype.so'
  'libjpeg.so'
  'libspdlog.so'
  'libx11'
  'libxext'
  'sdl2'
  'vulkan-icd-loader'
)
source=(
  "${_pkgname}::git+${url}.git"
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
  cmake -S "${_pkgname}" -B build \
    -G Ninja \
    -DBUILD_WEBSITE=OFF \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=Release \
    -DCPM_USE_LOCAL_PACKAGES=ON \
    -DBoost_NO_BOOST_CMAKE=OFF \
    -Dcli11_DIR=/usr/share/cmake/CLI11 \
    -DEGL_INCLUDE_DIRS=/usr/include/EGL \
    -DEGL_LIBRARIES=/usr/lib \
    -DFETCHCONTENT_BASE_DIR="${SRCDEST}" \
    -DFETCHCONTENT_FULLY_DISCONNECTED=OFF \
    -DFETCHCONTENT_UPDATES_DISCONNECTED=OFF \
    -DFETCHCONTENT_QUIET=OFF \
    -DFMT_CUDA_TEST=OFF \
    -DFMT_DOC=OFF \
    -DFMT_FUZZ=OFF \
    -DFMT_INSTALL=ON \
    -DFMT_MODULE=OFF \
    -DFMT_OS=ON \
    -DFMT_PEDANTIC=OFF \
    -DFMT_TEST=OFF \
    -DFMT_UNICODE=ON \
    -DFMT_WERROR=OFF \
    -DHDRVIEW_BUILD_UHDR_DEPS=OFF \
    -DHDRVIEW_NO_UHDR=OFF \
    -DHDRVIEW_PORTABLE_INSTALL=OFF \
    -DHELLOIMGUI_ADD_APP_WITH_INSTALL=ON \
    -DHELLOIMGUI_BUILD_DEMOS=ON \
    -DHELLOIMGUI_BUILD_DOCS=OFF \
    -DHELLOIMGUI_BUILD_IMGUI=ON \
    -DHELLOIMGUI_BUILD_TESTS=ON \
    -DHELLOIMGUI_DOWNLOAD_FREETYPE_IF_NEEDED=OFF \
    -DHELLOIMGUI_DOWNLOAD_GLFW_IF_NEEDED=OFF \
    -DHELLOIMGUI_DOWNLOAD_SDL_IF_NEEDED=OFF \
    -DHELLOIMGUI_FETCH_IMGUI_TEST_ENGINE=ON \
    -DHELLOIMGUI_HAS_OPENGL=ON \
    -DHELLOIMGUI_HAS_OPENGL3=ON \
    -DHELLOIMGUI_HAS_VULKAN=ON \
    -DHELLOIMGUI_HEADLESS=OFF \
    -DHELLOIMGUI_INSTALL=ON \
    -DHELLOIMGUI_STB_IMAGE_IMPLEMENTATION=ON \
    -DHELLOIMGUI_STB_IMAGE_WRITE_IMPLEMENTATION=ON \
    -DHELLOIMGUI_USE_FREETYPE=ON \
    -DHELLOIMGUI_USE_FREETYPE_PLUTOSVG=ON \
    -DHELLOIMGUI_USE_IMGUI_CMAKE_PACKAGE=OFF \
    -DHELLOIMGUI_USE_GLFW3=ON \
    -DHELLOIMGUI_USE_SDL2=ON \
    -DHELLOIMGUI_WITH_IMGUIWS=OFF \
    -DHELLOIMGUI_WITH_NETIMGUI=OFF \
    -DHELLOIMGUI_WITH_TEST_ENGINE=OFF \
    -DIMATH_INSTALL_PKG_CONFIG=OFF \
    -DIMATH_INSTALL_SYM_LINK=OFF \
    -DJPEG_INCLUDE_DIR=/usr/include \
    -DJPEG_LIBRARY_DEBUG=/usr/lib/libjpeg.so \
    -DJPEG_LIBRARY_RELEASE=/usr/lib/libjpeg.so \
    -DOPENEXR_BUILD_LIBS=ON \
    -DOPENEXR_BUILD_PYTHON=ON \
    -DOPENEXR_ENABLE_THREADING=ON \
    -DOPENEXR_INSTALL=OFF \
    -DOPENEXR_INSTALL_DOCS=OFF \
    -DOPENEXR_INSTALL_PKG_CONFIG=OFF \
    -DOPENEXR_INSTALL_TOOLS=OFF \
    -DOPENEXR_TEST_LIBRARIES=OFF \
    -DOPENEXR_TEST_PYTHON=OFF \
    -DOPENEXR_TEST_TOOLS=OFF \
    -DOPENGLES3_INCLUDE_DIRS=/usr/include/GLES3 \
    -DOPENGLES3_LIBRARIES=/usr/lib \
    -DOpenGL_GL_PREFERENCE=GLVND \
    -DPYTHON=ON \
    -DSPDLOG_BUILD_ALL=OFF \
    -DUHDR_BUILD_DEPS=OFF \
    -DUHDR_BUILD_JAVA=OFF \
    -DUHDR_BUILD_PACKAGING=OFF \
    -DUHDR_ENABLE_GLES=OFF \
    -DUHDR_ENABLE_INTRINSICS=ON \
    -DUHDR_ENABLE_LOGS=OFF \
    -DUHDR_ENABLE_WERROR=OFF \
    -DUHDR_WRITE_ISO=ON \
    -DUHDR_WRITE_XMP=ON \
    -Wno-dev

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

  ## Install documentation and license
  for _docfile in README.md TODO.md git.log; do
    install -D -m644 -v "$srcdir/${_pkgname}/${_docfile}" "${pkgdir}/usr/share/doc/${_pkgname}/${_docfile}"
  done
  install -D -m644 -v "$srcdir/${_pkgname}/LICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt"
}
