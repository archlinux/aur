# Maintainer: Nikos Toutountzoglou <nikos dot toutou at protonmail dot com>

pkgname=srt-xtransmit
pkgver=0.3.0
pkgrel=1
pkgdesc="A testing utility with support for SRT and UDP network protocols"
arch=("x86_64")
url="https://github.com/maxsharabayko/srt-xtransmit"
license=("MPL-2.0")
options=("!lto")
depends=(
  "bash"
  "gcc-libs"
  "glibc"
  "openssl"
  "python-click"
  "srt"
)
makedepends=(
  "cmake"
  "git"
  "make"
  "ninja"
)
optdepends=(
  "python-bokeh: visualization scripts"
  "python-pandas: data analysis scripts"
)
source=(
  "${pkgname}-${pkgver}.tar.gz::https://github.com/maxsharabayko/srt-xtransmit/archive/refs/tags/v${pkgver}.tar.gz"
  "git+https://github.com/CLIUtils/CLI11.git#commit=37bb6edc5317e99af72ef48405e65d9ca5218861"
  "git+https://github.com/Naios/function2.git#commit=3a0746bf5f601dfed05330aefcb6854354fce07d"
  "git+https://github.com/nlohmann/json.git#commit=9cca280a4d0ccf0c08f47a99aa71d1b0e52f8d03"
  "git+https://github.com/gabime/spdlog.git#commit=79524ddd08a4ec981b7fea76afd08ee05f83755d"
  "git+https://github.com/Haivision/srt.git#commit=c63c311e88aa55e430e3b7d94b89d790994f88c4"
)
sha256sums=('fbce517861ad9e137fa10d0e402a24f4ee6442e0d2f0f76830568bf46e411de8'
            '212e8298241135976b934f82d78d8687d587b83df7f97afb8cb2c1607eb854e7'
            '45e95da7de858ceb21e6792b3d9d9c37a9f6993bf4a3818cb2fc9a34b249e095'
            '758268d6b3c0fdcba8ec1d6f0ff35a59b2453f6c468ba4c075a42964d065472b'
            'c62402f7e83d1ca5cab47687c0950d17b420ef2e149390a91f64df5a437ba9be'
            '477889e56ffe685d9009ac22f3721b44d1487cf57e78089ad8cc07da3d39bd89')

prepare() {
  cd "${pkgname}-${pkgver}"

  # Copy submodules
  cp -Pr "${srcdir}/CLI11"/* submodule/CLI11
  cp -Pr "${srcdir}/function2"/* submodule/function2
  cp -Pr "${srcdir}/json"/* submodule/nlohmann_json
  cp -Pr "${srcdir}/spdlog"/* submodule/spdlog
  cp -Pr "${srcdir}/srt"/* submodule/srt

  # Replace SRT build with a stub that uses system libsrt
  # Compile only the app support sources (uriparser, verbose, etc.)
  # that xtransmit needs, link against system libsrt
  cat > submodule/srt/CMakeLists.txt << 'CMAKEEOF'
cmake_minimum_required(VERSION 3.5 FATAL_ERROR)
project(SRT VERSION 1.5.4 LANGUAGES C CXX)
set(TARGET_srt "srt" CACHE STRING "")

# Set version variables for configure_file
set(SRT_VERSION 1.5.4)
set(SRT_VERSION_MAJOR 1)
set(SRT_VERSION_MINOR 5)
set(SRT_VERSION_PATCH 4)

# Generate version.h from the bundled template
configure_file("srtcore/version.h.in" "${CMAKE_CURRENT_BINARY_DIR}/version.h" @ONLY)

# Include directories
include_directories(
  "${CMAKE_CURRENT_SOURCE_DIR}/srtcore"
  "${CMAKE_CURRENT_BINARY_DIR}"
  "${CMAKE_CURRENT_SOURCE_DIR}/common"
  "${CMAKE_CURRENT_SOURCE_DIR}/haicrypt"
  "${CMAKE_CURRENT_SOURCE_DIR}/apps"
  "${CMAKE_CURRENT_SOURCE_DIR}/testing"
)

# Find system SRT
find_library(SRT_SYSTEM_LIB srt REQUIRED)
find_path(SRT_HEADERS srt/srt.h PATHS /usr/include)
include_directories("${SRT_HEADERS}")

# Build srtsupport_virtual OBJECT library from app support sources
set(SOURCES_support
  apps/apputil.cpp
  apps/logsupport.cpp
  apps/logsupport_appdefs.cpp
  apps/socketoptions.cpp
  apps/uriparser.cpp
  apps/verbose.cpp
  apps/statswriter.cpp
)
add_library(srtsupport_virtual OBJECT ${SOURCES_support})
target_compile_definitions(srtsupport_virtual PUBLIC SRT_VERSION="${SRT_VERSION}")
target_link_libraries(srtsupport_virtual PUBLIC "${SRT_SYSTEM_LIB}")

# Dummy srt_virtual object for the real srt lib references
file(WRITE "${CMAKE_CURRENT_SOURCE_DIR}/cmake_object_lib_support.c" "")
add_library(srt_virtual OBJECT cmake_object_lib_support.c)
set(VIRTUAL_srt $<TARGET_OBJECTS:srt_virtual>)

# srt_static (wraps system libsrt)
add_library(srt_static STATIC cmake_object_lib_support.c)
target_link_libraries(srt_static PUBLIC "${SRT_SYSTEM_LIB}" ssl crypto)

set(SRT_INCLUDE_DIR "${CMAKE_CURRENT_SOURCE_DIR}/srtcore;${CMAKE_CURRENT_BINARY_DIR};${SRT_HEADERS};${CMAKE_CURRENT_SOURCE_DIR}/common;${CMAKE_CURRENT_SOURCE_DIR}/haicrypt" PARENT_SCOPE)
set(SRT_UTILS_INCLUDE_DIR "${CMAKE_CURRENT_SOURCE_DIR}/apps;${CMAKE_CURRENT_SOURCE_DIR}/testing" PARENT_SCOPE)
CMAKEEOF
}

build() {
  cd "${pkgname}-${pkgver}"

  local cmake_options=(
    -G Ninja
    -Wno-dev
    -DCMAKE_POLICY_VERSION_MINIMUM=3.5
    -DCMAKE_INSTALL_PREFIX=/usr
    -DCMAKE_BUILD_TYPE=None
    -DENABLE_APPS=ON
    -DENABLE_SHARED=OFF
    -DENABLE_CXX17=ON
    -DENABLE_BONDING=ON
  )

  cmake "${cmake_options[@]}" -B build
  ninja -C build
}

package() {
  # MPL-2.0 license declared in license field (no file upstream)
  install -Dm755 "${srcdir}/${pkgname}-${pkgver}/build/bin/srt-xtransmit" "${pkgdir}/usr/bin/srt-xtransmit"
}

# vim:set ts=2 sw=2 et:
