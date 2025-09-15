# Maintainer: David Hummel <hummeltech@sherpaguru.com>

_binname=xenia_canary
_branchname=canary_experimental
pkgname=xenia-canary-git
pkgver=r7959.8d03766d0
pkgrel=1
pkgdesc='An experimental emulator for the Xbox 360.'
arch=('x86_64')
url='https://github.com/xenia-canary/xenia-canary'
license=('BSD-3-Clause')
checkdepends=('catch2-v2')
makedepends=('clang'
             'cmake'
             'cxxopts'
             'git'
             'premake'
             'rapidjson'
             'tomlplusplus'
             'vulkan-headers')
depends=('capstone'
         'fmt'
         'gtk3'
         'hicolor-icon-theme'
         'pugixml'
         'sdl2'
         'snappy'
         'zarchive'
         'zlib-ng')
conflicts=('xenia' 'xenia-git')
provides=('xenia')
# TODO: Use system installed deps for non-forked libs
source=("${pkgname}::git+https://github.com/xenia-canary/xenia-canary.git#branch=${_branchname}"
        'FFmpeg::git+https://github.com/xenia-canary/FFmpeg_radixsplit.git'
        'FidelityFX-CAS::git+https://github.com/GPUOpen-Effects/FidelityFX-CAS.git'
        'FidelityFX-FSR::git+https://github.com/GPUOpen-Effects/FidelityFX-FSR.git'
        'VulkanMemoryAllocator::git+https://github.com/GPUOpen-LibrariesAndSDKs/VulkanMemoryAllocator.git'
        'aes_128::git+https://github.com/openluopworld/aes_128.git'
        'date::git+https://github.com/HowardHinnant/date.git'
        'discord-rpc::git+https://github.com/discordapp/discord-rpc.git'
        'disruptorplus::git+https://github.com/xenia-canary/disruptorplus.git'
        'glslang::git+https://github.com/KhronosGroup/glslang.git'
        'imgui::git+https://github.com/ocornut/imgui.git'
        'premake-cmake::git+https://github.com/JoelLinn/premake-cmake.git'
        'rapidcsv::git+https://github.com/d99kris/rapidcsv.git'
        'tabulate::git+https://github.com/p-ranav/tabulate.git'
        'utfcpp::git+https://github.com/nemtrif/utfcpp.git'
        'xbyak::git+https://github.com/herumi/xbyak.git'
        "${pkgname}.desktop"
        '0001-Use-system-dependencies.patch')
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
            '6df34559e1bb42e1c0a67152a8f1ebd8c59bd890f6d7625f711ae80859165822'
            'ae84bddfa376a5e85e305fb5767836863ed38fe3cd71c7b1ccfc6031c723438d')

pkgver() {
  printf 'r%s.%s' "$(git -C ${pkgname} rev-list --count HEAD)" "$(git -C ${pkgname} rev-parse --short HEAD)"
}

prepare() {
  sed --in-place \
    --expression '/fatalwarnings("All")/d' \
    "${pkgname}"/premake5.lua

  # Initialize Submodules
  for submodule in $(git -C "${pkgname}" submodule | awk '{print $2}')
  do
    if [ ! -d "${srcdir}"/"${submodule#third_party/}" ]
    then
      continue
    fi
    git -C "${pkgname}" submodule init "${submodule}"
    git -C "${pkgname}" config submodule."${submodule}".url "${srcdir}"/"${submodule#third_party/}"
    git -C "${pkgname}" -c protocol.file.allow=always submodule update "${submodule}"
  done

  # Use System Dependencies
  git -C "${pkgname}" apply --verbose "${srcdir}"/0001-Use-system-dependencies.patch

  export CXXFLAGS CFLAGS LDFLAGS
  premake5 \
    --file="${pkgname}"/premake5.lua \
    cmake
  cmake \
    -B "${pkgname}"-build \
    -D CMAKE_BUILD_TYPE:STRING=Release \
    -D CMAKE_CXX_COMPILER:STRING=clang++ \
    -D CMAKE_C_COMPILER:STRING=clang \
    -S "${pkgname}"/build
  echo "#ifndef GENERATED_VERSION_H_" > "${pkgname}"/build/version.h
  echo "#define GENERATED_VERSION_H_" >> "${pkgname}"/build/version.h
  echo "#define XE_BUILD_BRANCH \"${_branchname}\"" >> "${pkgname}"/build/version.h
  echo "#define XE_BUILD_COMMIT \"$(git -C ${pkgname} rev-parse HEAD)\"" >> "${pkgname}"/build/version.h
  echo "#define XE_BUILD_COMMIT_SHORT \"$(git -C ${pkgname} rev-parse --short HEAD)\"" >> "${pkgname}"/build/version.h
  echo "#define XE_BUILD_DATE __DATE__" >> "${pkgname}"/build/version.h
  echo "#endif" >> "${pkgname}"/build/version.h
}

build() {
  export MAKEFLAGS
  cmake \
    --build "${pkgname}"-build \
    --target xenia-app
}

check() {
  sed --in-place \
    --expression 's/enableTests = false/enableTests = true/g' \
    "${pkgname}"/premake5.lua

  premake5 \
    --file="${pkgname}"/premake5.lua \
    cmake
  cmake \
    -B "${pkgname}"-build \
    -D CMAKE_BUILD_TYPE:STRING=Release \
    -D CMAKE_CXX_COMPILER:STRING=clang++ \
    -D CMAKE_C_COMPILER:STRING=clang \
    -S "${pkgname}"/build
  cmake \
    --build "${pkgname}"-build \
    --target xenia-base-tests

  "${pkgname}"/build/bin/Linux/Release/xenia-base-tests
}

package() {
  install -Dm755 "${pkgname}"/build/bin/Linux/Release/"${_binname}" "${pkgdir}"/usr/bin/xenia
  install -Dm644 "${pkgname}"/LICENSE "${pkgdir}"/usr/share/licenses/"${pkgname}"/LICENSE

  # Desktop file
  install -Dm755 "${pkgname}".desktop "${pkgdir}"/usr/share/applications/"${pkgname}".desktop

  # Icons
  install -Dm644 "${pkgname}"/assets/icon/16.png "${pkgdir}"/usr/share/icons/hicolor/16x16/apps/jp.xenia.Xenia.png
  install -Dm644 "${pkgname}"/assets/icon/32.png "${pkgdir}"/usr/share/icons/hicolor/32x32/apps/jp.xenia.Xenia.png
  install -Dm644 "${pkgname}"/assets/icon/48.png "${pkgdir}"/usr/share/icons/hicolor/48x48/apps/jp.xenia.Xenia.png
  install -Dm644 "${pkgname}"/assets/icon/64.png "${pkgdir}"/usr/share/icons/hicolor/64x64/apps/jp.xenia.Xenia.png
  install -Dm644 "${pkgname}"/assets/icon/128.png "${pkgdir}"/usr/share/icons/hicolor/128x128/apps/jp.xenia.Xenia.png
  install -Dm644 "${pkgname}"/assets/icon/256.png "${pkgdir}"/usr/share/icons/hicolor/256x256/apps/jp.xenia.Xenia.png
  install -Dm644 "${pkgname}"/assets/icon/512.png "${pkgdir}"/usr/share/icons/hicolor/512x512/apps/jp.xenia.Xenia.png
  install -Dm644 "${pkgname}"/assets/icon/1024.png "${pkgdir}"/usr/share/icons/hicolor/1024x1024/apps/jp.xenia.Xenia.png
}
