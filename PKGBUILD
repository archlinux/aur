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
  'alsa-lib'
  'gcc-libs'
  'glibc'
  'gtk3'
  'hicolor-icon-theme'
  'libx11'
  'sdl3'
  'vulkan-icd-loader'
)
makedepends=(
  'clang'
  'cmake'
  'cxxopts'
  'git'
  'rapidjson'
  'spirv-tools'
  'tomlplusplus'
  'vulkan-headers'
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
  'capstone::git+https://github.com/capstone-engine/capstone.git'
  'catch::git+https://github.com/catchorg/Catch2.git'
  'date::git+https://github.com/HowardHinnant/date.git'
  'discord-rpc::git+https://github.com/discordapp/discord-rpc.git'
  'disruptorplus::git+https://github.com/xenia-canary/disruptorplus.git'
  'fmt::git+https://github.com/fmtlib/fmt.git'
  'glslang::git+https://github.com/KhronosGroup/glslang.git'
  'imgui::git+https://github.com/ocornut/imgui.git'
  'pugixml::git+https://github.com/zeux/pugixml.git'
  'rapidcsv::git+https://github.com/d99kris/rapidcsv.git'
  'snappy::git+https://github.com/google/snappy.git'
  'tabulate::git+https://github.com/p-ranav/tabulate.git'
  'utfcpp::git+https://github.com/nemtrif/utfcpp.git'
  'xbyak::git+https://github.com/herumi/xbyak.git'
  'xxhash::git+https://github.com/Cyan4973/xxHash.git'
  'zarchive::git+https://github.com/exzap/ZArchive.git'
  'zlib-ng::git+https://github.com/zlib-ng/zlib-ng.git'
  'zstd::git+https://github.com/facebook/zstd.git'
  "${pkgname}.desktop"
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
  'SKIP'
  'SKIP'
  'SKIP'
  'SKIP'
  'SKIP'
  'SKIP'
  'SKIP'
  '243b520f53161c2e3b1bd7ecae4ddcdeb91778cd426e89d8bc64e018fa4210fb'
)

pkgver() {
  printf 'r%s.%s' \
    "$(git -C "${pkgname}" rev-list --count HEAD)" \
    "$(git -C "${pkgname}" rev-parse --short HEAD)"
}

prepare() {
  local _submodule
  for _submodule in $(git -C "${pkgname}" submodule status | awk '{print $2}'); do
    [[ -d "${srcdir}/${_submodule#third_party/}" ]] || continue
    git -C "${pkgname}" submodule init "${_submodule}"
    git -C "${pkgname}" config "submodule.${_submodule}.url" "${srcdir}/${_submodule#third_party/}"
  done
  git -C "${pkgname}" -c protocol.file.allow=always submodule update

  # Link system headers in place of unbundled third_party submodules
  rm -rf \
    "${pkgname}/third_party/SDL3" \
    "${pkgname}/third_party/SPIRV-Tools" \
    "${pkgname}/third_party/Vulkan-Headers" \
    "${pkgname}/third_party/cxxopts" \
    "${pkgname}/third_party/tomlplusplus"

  mkdir -p \
    "${pkgname}/third_party/SDL3" \
    "${pkgname}/third_party/SPIRV-Tools/include" \
    "${pkgname}/third_party/Vulkan-Headers/include" \
    "${pkgname}/third_party/cxxopts/include" \
    "${pkgname}/third_party/tomlplusplus/include"

  ln -s /usr/include/SDL3 "${pkgname}/third_party/SDL3/include"
  ln -s /usr/include/spirv-tools "${pkgname}/third_party/SPIRV-Tools/include/spirv-tools"
  ln -s /usr/include/vulkan "${pkgname}/third_party/Vulkan-Headers/include/vulkan"
  ln -s /usr/include/cxxopts.hpp "${pkgname}/third_party/cxxopts/include/cxxopts.hpp"
  ln -s /usr/include/toml++/toml.hpp "${pkgname}/third_party/tomlplusplus/toml.hpp"
  ln -s /usr/include/toml++/impl "${pkgname}/third_party/tomlplusplus/impl"
  ln -s /usr/include/toml++ "${pkgname}/third_party/tomlplusplus/include/toml++"
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
