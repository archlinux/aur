pkgname=xenia-git
pkgver=r6950.3d30b2eec
pkgrel=2
pkgdesc="An experimental emulator for the Xbox 360."
arch=('x86_64')
url="http://xenia.jp"
license=('BSD')
depends=('gtk3' 'lz4' 'glew' 'libx11' 'sdl2')
makedepends=('premake' 'python' 'clang' 'git' 'libpthread-stubs' 'llvm')
provides=('xenia')
conflicts=('xenia')
# TODO: Use system installed deps for non-forked libs
source=("git+https://github.com/benvanik/xenia.git"
        "git+https://github.com/openluopworld/aes_128.git"
        "git+https://github.com/benvanik/binutils-ppc-cygwin.git"
        "git+https://github.com/xenia-project/capstone.git"
        "catch::git+https://github.com/catchorg/Catch2.git"
        "git+https://github.com/skystrife/cpptoml.git"
        "git+https://github.com/jarro2783/cxxopts.git"
        "git+https://github.com/HowardHinnant/date.git"
        "git+https://github.com/microsoft/DirectXShaderCompiler.git"
        "git+https://github.com/discord/discord-rpc.git"
        "git+https://github.com/xenia-project/disruptorplus.git"
        "git+https://github.com/xenia-project/FFmpeg.git"
        "git+https://github.com/GPUOpen-Effects/FidelityFX-CAS.git"
        "git+https://github.com/GPUOpen-Effects/FidelityFX-FSR.git"
        "git+https://github.com/fmtlib/fmt.git"
        "git+https://github.com/KhronosGroup/glslang.git"
        "git+https://github.com/ocornut/imgui.git"
        "git+https://github.com/Triang3l/premake-androidndk.git"
        "git+https://github.com/JoelLinn/premake-cmake.git"
        "git+https://github.com/xenia-project/premake-core.git"
        "git+https://github.com/xenia-project/premake-export-compile-commands.git"
        "git+https://github.com/Tencent/rapidjson.git"
        "SDL2::git+https://github.com/libsdl-org/SDL.git"
        "git+https://github.com/xenia-project/snappy.git"
        "git+https://github.com/KhronosGroup/SPIRV-Tools.git"
        "git+https://github.com/xenia-project/utfcpp.git"
        "git+https://github.com/KhronosGroup/Vulkan-Headers.git"
        "git+https://github.com/GPUOpen-LibrariesAndSDKs/VulkanMemoryAllocator.git"
        "git+https://github.com/xenia-project/xbyak.git"
        "xxhash::git+https://github.com/Cyan4973/xxHash.git"
        "0001-use-system-premake5.patch"
        "0002-remove-logging-from-console-main.patch")
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
            'd8df7c6d7047fdc4278315b733a470843eab608f8bba5b8ea4355e8c4f44c88f'
            '91b5fe5c3a66b72bc4c7965b38a1dd5f925b55ce1f98f873300072f5f0f8a4e0')

pkgver() {
  cd "${srcdir}/${pkgname%-git}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "${srcdir}/${pkgname%-git}"

  msg2 "Applying patches"
  patch -Np1 -i "${srcdir}/0001-use-system-premake5.patch"
  patch -Np1 -i "${srcdir}/0002-remove-logging-from-console-main.patch"

  msg2 "Setting submodule paths"
  # Take intersection of src and src/xenia/third_party
  _sources=`ls ${srcdir} -I xenia -I xenia-linux-fixes`
  _thirdparties=`ls ${srcdir}/${pkgname%-git}/third_party`
  for _modulename in `comm -12 <(echo "${_sources[@]}") <(echo "${_thirdparties[@]}") `
  do
    _modulepath="third_party/$_modulename"
    git submodule init "$_modulepath"
    git config "submodule.$_modulepath.url" "$srcdir/$_modulename/"
    git -c protocol.file.allow=always submodule update "$_modulepath"
  done

  # FIXME: Warnings treated as errors that cause the build to fail.
  # Warnings:
  # - Currently the default /etc/makepkg.conf adds -Wunused-result
  # - If config is set to debug, there is a warning about optimizations being off
  sed -i 's,"FatalWarnings",--"FatalWarnings",g' premake5.lua
}

build() {
  CFLAGS=${CFLAGS/-fvar-tracking-assignments}
  CXXFLAGS=${CXXFLAGS/-fvar-tracking-assignments}

  cd "${srcdir}/${pkgname%-git}"
  mkdir -p build
  ./xenia-build \
    build \
    --config=release \
    `echo $MAKEFLAGS | grep -oE '\-j\s?[0-9]+' | sed -r 's/-j([0-9]+)/-j \1/' | head -n 1`
}

package() {
  cd "${srcdir}/${pkgname%-git}"

  install -m755 -d ${pkgdir}/usr/bin
  install -m755 build/bin/Linux/Release/* ${pkgdir}/usr/bin
  rm ${pkgdir}/usr/bin/*.a

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

## vim:set ts=2 sw=2 et:
