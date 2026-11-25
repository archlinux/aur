# Maintainer: David Hummel <hummeltech@sherpaguru.com>

_pkgname=xenia
_binname=xenia_canary
_branchname=canary_experimental
pkgname=xenia-canary-git
pkgver=r9085.2da251989
pkgrel=1
pkgdesc='Experimental Xbox 360 emulator'
arch=('x86_64')
url='https://github.com/xenia-canary/xenia-canary'
license=('BSD-3-Clause')
depends=(
  'capstone'
  'fmt'
  'glibc'
  'gtk3'
  'hicolor-icon-theme'
  'libx11'
  'pugixml'
  'sdl3'
  'snappy'
  'zstd'
)
makedepends=(
  'clang'
  'cmake'
  'cxxopts'
  'git'
  'glslang'
  'python'
  'rapidjson'
  'spirv-tools'
  'tomlplusplus'
  'utf8cpp'
  'vulkan-headers'
  'vulkan-icd-loader'
  'xxhash'
)
provides=("${_pkgname}")
conflicts=("${_pkgname}" "${_pkgname}-git")
source=(
  "${pkgname}::git+${url}.git#branch=${_branchname}"
  'FFmpeg::git+https://github.com/has207/FFmpeg.git#branch=xmaframes'
  'FidelityFX-CAS::git+https://github.com/GPUOpen-Effects/FidelityFX-CAS.git'
  'FidelityFX-FSR::git+https://github.com/GPUOpen-Effects/FidelityFX-FSR.git'
  'VulkanMemoryAllocator::git+https://github.com/GPUOpen-LibrariesAndSDKs/VulkanMemoryAllocator.git'
  'aes_128::git+https://github.com/openluopworld/aes_128.git'
  'catch::git+https://github.com/catchorg/Catch2.git'
  'date::git+https://github.com/HowardHinnant/date.git'
  'discord-rpc::git+https://github.com/discordapp/discord-rpc.git'
  'disruptorplus::git+https://github.com/xenia-canary/disruptorplus.git'
  'glslang::git+https://github.com/KhronosGroup/glslang.git'
  'imgui::git+https://github.com/ocornut/imgui.git'
  'rapidcsv::git+https://github.com/d99kris/rapidcsv.git'
  'tabulate::git+https://github.com/p-ranav/tabulate.git'
  'xbyak::git+https://github.com/herumi/xbyak.git'
  'zarchive::git+https://github.com/exzap/ZArchive.git'
  'zlib-ng::git+https://github.com/zlib-ng/zlib-ng.git'
  "${pkgname}.desktop"
  "xenia-canary-use-system-libs.patch"
)
sha256sums=(
  'SKIP'
  'SKIP'
  'SKIP'
  'SKIP'
  'SKIP'
  'SKIP'
  'SKIP'
  'SKIP'
  'SKIP'
  'SKIP'
  'SKIP'
  'SKIP'
  'SKIP'
  'SKIP'
  'SKIP'
  'SKIP'
  'SKIP'
  '243b520f53161c2e3b1bd7ecae4ddcdeb91778cd426e89d8bc64e018fa4210fb'
  '27fc0545435e2f3d2c17a260754f410b676b96957c65b0ba907822872d4452ab'
)

pkgver() {
  printf 'r%s.%s' \
    "$(git -C "${pkgname}" rev-list --count HEAD)" \
    "$(git -C "${pkgname}" rev-parse --short HEAD)"
}

prepare() {
  patch --directory="${pkgname}" --strip=1 --input="${srcdir}/xenia-canary-use-system-libs.patch"

  local _submodule
  for _submodule in $(git -C "${pkgname}" submodule status | awk '{print $2}'); do
    [[ -d "${srcdir}/${_submodule#third_party/}" ]] || continue
    git -C "${pkgname}" submodule init "${_submodule}"
    git -C "${pkgname}" config "submodule.${_submodule}.url" "${srcdir}/${_submodule#third_party/}"
  done
  git -C "${pkgname}" -c protocol.file.allow=always submodule update

  # Link system headers in place of unbundled third_party submodules
  rm --recursive --force \
    "${pkgname}/third_party/SDL3" \
    "${pkgname}/third_party/SPIRV-Tools" \
    "${pkgname}/third_party/Vulkan-Headers" \
    "${pkgname}/third_party/capstone" \
    "${pkgname}/third_party/cxxopts" \
    "${pkgname}/third_party/fmt" \
    "${pkgname}/third_party/pugixml" \
    "${pkgname}/third_party/snappy" \
    "${pkgname}/third_party/tomlplusplus" \
    "${pkgname}/third_party/utfcpp" \
    "${pkgname}/third_party/xxhash" \
    "${pkgname}/third_party/zstd"

  mkdir --parents \
    "${pkgname}/third_party/SDL3" \
    "${pkgname}/third_party/SPIRV-Tools/include" \
    "${pkgname}/third_party/Vulkan-Headers/include" \
    "${pkgname}/third_party/capstone/include" \
    "${pkgname}/third_party/cxxopts/include" \
    "${pkgname}/third_party/fmt/include" \
    "${pkgname}/third_party/pugixml/src" \
    "${pkgname}/third_party/snappy" \
    "${pkgname}/third_party/tomlplusplus/include" \
    "${pkgname}/third_party/utfcpp" \
    "${pkgname}/third_party/xxhash"

  ln --symbolic /usr/include/SDL3 "${pkgname}/third_party/SDL3/include"
  ln --symbolic /usr/include/spirv-tools "${pkgname}/third_party/SPIRV-Tools/include/spirv-tools"
  ln --symbolic /usr/include/vulkan "${pkgname}/third_party/Vulkan-Headers/include/vulkan"
  ln --symbolic /usr/include/capstone "${pkgname}/third_party/capstone/include/capstone"
  ln --symbolic /usr/include/cxxopts.hpp "${pkgname}/third_party/cxxopts/include/cxxopts.hpp"
  ln --symbolic /usr/include/fmt "${pkgname}/third_party/fmt/include/fmt"
  ln --symbolic /usr/include/pugixml.hpp "${pkgname}/third_party/pugixml/src/pugixml.hpp"
  ln --symbolic /usr/include/snappy-sinksource.h "${pkgname}/third_party/snappy/snappy-sinksource.h"
  ln --symbolic /usr/include/snappy.h "${pkgname}/third_party/snappy/snappy.h"
  ln --symbolic /usr/include/toml++/toml.hpp "${pkgname}/third_party/tomlplusplus/toml.hpp"
  ln --symbolic /usr/include/toml++/impl "${pkgname}/third_party/tomlplusplus/impl"
  ln --symbolic /usr/include/toml++ "${pkgname}/third_party/tomlplusplus/include/toml++"
  ln --symbolic /usr/include/utf8cpp "${pkgname}/third_party/utfcpp/source"
  ln --symbolic /usr/include/xxhash.h "${pkgname}/third_party/xxhash/xxhash.h"
}

build() {
  cmake -B "${pkgname}-build" -S "${pkgname}" \
    -D CMAKE_BUILD_TYPE:STRING=None \
    -D CMAKE_CXX_COMPILER:STRING=clang++ \
    -D CMAKE_CXX_FLAGS:STRING="${CXXFLAGS} -Wno-unused-result" \
    -D CMAKE_C_COMPILER:STRING=clang \
    -D XENIA_BUILD_TESTS:BOOL=ON

  cat > "${pkgname}-build/version.h" <<EOF
#ifndef GENERATED_VERSION_H_
#define GENERATED_VERSION_H_
#define XE_BUILD_BRANCH "${_branchname}"
#define XE_BUILD_COMMIT "$(git -C "${pkgname}" rev-parse HEAD)"
#define XE_BUILD_COMMIT_SHORT "$(git -C "${pkgname}" rev-parse --short HEAD)"
#define XE_BUILD_DATE __DATE__
#endif
EOF

  cmake --build "${pkgname}-build" --target xenia-app
}

check() {
  cmake --build "${pkgname}-build" \
    --target xenia-base-tests \
    --target xenia-cpu-ppc-tests

  pushd "${srcdir}/${pkgname}" > /dev/null
  "${srcdir}/${pkgname}-build/bin/Linux/xenia-base-tests" \
    "~PhysicalHeap vE0000000 AllocRange alignment"
  "${srcdir}/${pkgname}-build/bin/Linux/xenia-cpu-ppc-tests"
  popd > /dev/null
}

package() {
  install -D --mode=755 \
    "${pkgname}-build/bin/Linux/${_binname}" \
    "${pkgdir}/usr/bin/${_pkgname}"

  install -D --mode=644 \
    "${pkgname}/LICENSE" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  install -D --mode=644 \
    "${pkgname}.desktop" \
    "${pkgdir}/usr/share/applications/${pkgname}.desktop"

  local _size
  for _size in 16 32 48 64 128 256 512 1024; do
    install -D --mode=644 \
      "${pkgname}/assets/icon/${_size}.png" \
      "${pkgdir}/usr/share/icons/hicolor/${_size}x${_size}/apps/jp.xenia.Xenia.png"
  done
}
