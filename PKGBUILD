# Maintainer: David Hummel <hummeltech@sherpaguru.com>

_binname=xenia_canary
_branchname=canary_experimental
pkgname=xenia-canary-git
pkgver=r8533.3e1bff213
pkgrel=1
pkgdesc='An experimental emulator for the Xbox 360.'
arch=('x86_64')
url='https://github.com/xenia-canary/xenia-canary'
license=('BSD-3-Clause')
makedepends=('clang'
             'cmake'
             'cxxopts'
             'git'
             'rapidjson'
             'tomlplusplus'
             'vulkan-headers')
depends=('alsa-lib'
         'gtk3'
         'hicolor-icon-theme'
         'sdl2')
conflicts=('xenia' 'xenia-git')
provides=('xenia')
# TODO: Use system installed deps for non-forked libs
source=("${pkgname}::git+https://github.com/xenia-canary/xenia-canary.git#branch=${_branchname}"
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
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            '6df34559e1bb42e1c0a67152a8f1ebd8c59bd890f6d7625f711ae80859165822'
            '70ef69cb7db6ddc2d7aa810dc6615689fe039a5afc3a902a223333d3dd5c0d7d')

pkgver() {
  printf 'r%s.%s' "$(git -C ${pkgname} rev-list --count HEAD)" "$(git -C ${pkgname} rev-parse --short HEAD)"
}

prepare() {
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

  CFLAGS="${CFLAGS} -Wno-incompatible-pointer-types"
  CXXFLAGS="${CXXFLAGS} -Wno-unused-result"
  export CFLAGS CXXFLAGS LDFLAGS
  cmake \
    -B "${pkgname}"-build \
    -D CMAKE_BUILD_TYPE:STRING=Release \
    -D CMAKE_CXX_COMPILER:STRING=clang++ \
    -D CMAKE_C_COMPILER:STRING=clang \
    -S "${pkgname}"
  echo "#ifndef GENERATED_VERSION_H_" > "${pkgname}"-build/version.h
  echo "#define GENERATED_VERSION_H_" >> "${pkgname}"-build/version.h
  echo "#define XE_BUILD_BRANCH \"${_branchname}\"" >> "${pkgname}"-build/version.h
  echo "#define XE_BUILD_COMMIT \"$(git -C ${pkgname} rev-parse HEAD)\"" >> "${pkgname}"-build/version.h
  echo "#define XE_BUILD_COMMIT_SHORT \"$(git -C ${pkgname} rev-parse --short HEAD)\"" >> "${pkgname}"-build/version.h
  echo "#define XE_BUILD_DATE __DATE__" >> "${pkgname}"-build/version.h
  echo "#endif" >> "${pkgname}"-build/version.h
}

build() {
  export MAKEFLAGS
  cmake \
    --build "${pkgname}"-build \
    --target xenia-app
}

check() {
  cmake \
    -B "${pkgname}"-build \
    -D CMAKE_BUILD_TYPE:STRING=Release \
    -D CMAKE_CXX_COMPILER:STRING=clang++ \
    -D CMAKE_C_COMPILER:STRING=clang \
    -D XENIA_BUILD_TESTS:BOOL=ON \
    -S "${pkgname}"
  cmake \
    --build "${pkgname}"-build \
    --target xenia-base-tests \
    --target xenia-cpu-ppc-tests

  pushd "${srcdir}"/"${pkgname}"
  "${srcdir}"/"${pkgname}"-build/bin/Linux/xenia-base-tests
  "${srcdir}"/"${pkgname}"-build/bin/Linux/xenia-cpu-ppc-tests
  popd
}

package() {
  install -Dm755 "${pkgname}"-build/bin/Linux/"${_binname}" "${pkgdir}"/usr/bin/xenia
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
