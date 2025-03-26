# Maintainer: David Hummel <hummeltech@sherpaguru.com>

_binname=xenia_canary
pkgname=xenia-canary-git
pkgver=r7790.5f918ef28
pkgrel=1
pkgdesc='An experimental emulator for the Xbox 360.'
arch=('x86_64')
url='http://xenia.jp'
license=('BSD-3-Clause')
depends=('gtk3'
         'libx11'
         'libxcb'
         'sdl2'
         'zlib')
makedepends=('clang'
             'git'
             'libpthread-stubs'
             'llvm'
             'ninja'
             'premake'
             'python')
conflicts=('xenia' 'xenia-git')
provides=('xenia')
# TODO: Use system installed deps for non-forked libs
source=("${pkgname}::git+https://github.com/xenia-canary/xenia-canary.git#branch=canary_experimental"
        'DirectXShaderCompiler::git+https://github.com/microsoft/DirectXShaderCompiler.git'
        'FFmpeg::git+https://github.com/xenia-canary/FFmpeg_radixsplit.git'
        'FidelityFX-CAS::git+https://github.com/GPUOpen-Effects/FidelityFX-CAS.git'
        'FidelityFX-FSR::git+https://github.com/GPUOpen-Effects/FidelityFX-FSR.git'
        'SDL2::git+https://github.com/libsdl-org/SDL.git'
        'SPIRV-Tools::git+https://github.com/KhronosGroup/SPIRV-Tools.git'
        'Vulkan-Headers::git+https://github.com/KhronosGroup/Vulkan-Headers.git'
        'VulkanMemoryAllocator::git+https://github.com/GPUOpen-LibrariesAndSDKs/VulkanMemoryAllocator.git'
        'aes_128::git+https://github.com/openluopworld/aes_128.git'
        'binutils-ppc-cygwin::git+https://github.com/benvanik/binutils-ppc-cygwin.git'
        'capstone::git+https://github.com/capstone-engine/capstone.git'
        'catch::git+https://github.com/catchorg/Catch2.git'
        'cxxopts::git+https://github.com/jarro2783/cxxopts.git'
        'date::git+https://github.com/HowardHinnant/date.git'
        'discord-rpc::git+https://github.com/discordapp/discord-rpc.git'
        'disruptorplus::git+https://github.com/xenia-canary/disruptorplus.git'
        'fmt::git+https://github.com/fmtlib/fmt.git'
        'glslang::git+https://github.com/KhronosGroup/glslang.git'
        'imgui::git+https://github.com/ocornut/imgui.git'
        'premake-androidndk::git+https://github.com/Triang3l/premake-androidndk.git'
        'premake-cmake::git+https://github.com/JoelLinn/premake-cmake.git'
        'premake-core::git+https://github.com/premake/premake-core.git'
        'premake-export-compile-commands::git+https://github.com/xenia-project/premake-export-compile-commands.git'
        'pugixml::git+https://github.com/zeux/pugixml.git'
        'rapidcsv::git+https://github.com/d99kris/rapidcsv.git'
        'rapidjson::git+https://github.com/Tencent/rapidjson.git'
        'snappy::git+https://github.com/xenia-project/snappy.git'
        'tabulate::git+https://github.com/p-ranav/tabulate.git'
        'tomlplusplus::git+https://github.com/marzer/tomlplusplus.git'
        'utfcpp::git+https://github.com/nemtrif/utfcpp.git'
        'xbyak::git+https://github.com/herumi/xbyak.git'
        'xxhash::git+https://github.com/Cyan4973/xxHash.git'
        'zarchive::git+https://github.com/exzap/ZArchive.git'
        'zlib::git+https://github.com/madler/zlib.git'
        'zstd::git+https://github.com/facebook/zstd.git'
        '0001-use-system-premake5.patch'
        '0002-use-cmake-build-instead.patch'
        '0003-disable-portable-mode.patch::https://github.com/xenia-canary/xenia-canary/pull/535/commits/38058a15d5670e14ab1b6b11f78f78ed6e7b6a6c.patch')
sha256sums=('SKIP'
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
            'd8df7c6d7047fdc4278315b733a470843eab608f8bba5b8ea4355e8c4f44c88f'
            'd6027c91a57272211a6b49adb2a8af6a740716ed9cfa4f95bd74ce4df3491fc2'
            'fd314745ca74654afcd047028d2000ac359e106b2bf75b0fa3ff24ec6b08aa8b')

pkgver() {
  printf 'r%s.%s' "$(git -C ${pkgname} rev-list --count HEAD)" "$(git -C ${pkgname} rev-parse --short HEAD)"
}

prepare() {
  patch -d "${pkgname}" -Np1 < 0001-use-system-premake5.patch
  patch -d "${pkgname}" -Np1 < 0002-use-cmake-build-instead.patch
  patch -d "${pkgname}" -Np1 < 0003-disable-portable-mode.patch

  for submodule in $(git -C "${pkgname}" submodule | awk '{print $2}')
  do
    git -C "${pkgname}" submodule init "${submodule}"
    git -C "${pkgname}" config submodule."${submodule}".url "${srcdir}"/"${submodule#third_party/}"
    git -C "${pkgname}" -c protocol.file.allow=always submodule update "${submodule}"
  done

  cd "${pkgname}"
  ./xenia-build setup
}

build() {
  cd "${pkgname}"
  ./xenia-build build \
    --config Release \
    --target "${_binname}" \
    $(echo ${MAKEFLAGS} | grep -oE '\-j\s?[0-9]+' | sed -r 's/-j([0-9]+)/-j \1/' | head -n 1)
}

package() {
  install -m755 -d "${pkgdir}"/usr/bin
  install -m755 "${pkgname}"/build/bin/Linux/Release/"${_binname}" "${pkgdir}"/usr/bin/xenia
  install -Dm644 "${pkgname}"/LICENSE "${pkgdir}"/usr/share/licenses/"${pkgname}"/LICENSE
}
