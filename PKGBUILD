pkgname=xenia-git
pkgver=r6909.e55cb737c.linux_fixes
pkgrel=1
pkgdesc="Xenia is an experimental emulator for the Xbox 360."
arch=('x86_64')
url="http://xenia.jp"
license=('BSD')
options=('debug' '!strip')
depends=('gtk3' 'lz4' 'glew' 'libx11')
# TODO use installed premake5 instead of building it
# premake: powerpc patch added
makedepends=('python' 'clang' 'git' 'libpthread-stubs')
provides=('xenia')
conflicts=('xenia')
# TODO: Use system installed deps for non-forked libs
source=("git+https://github.com/benvanik/xenia.git"
        # "xenia-linux-fixes::git+https://github.com/bwrsandman/xenia.git#branch=linux"
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
        "xxhash::git+https://github.com/Cyan4973/xxHash.git")
sha256sums=('SKIP'
            # 'SKIP'
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
            'SKIP')

pkgver() {
  cd "${srcdir}/${pkgname%-git}"
  #printf "r%s.%s.linux_fixes" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "${srcdir}/${pkgname%-git}"

  sed -i '16 a #include <optional>' src/xenia/ui/imgui_drawer.h

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

  # msg2 "Merging Linux Fixes"
  # git config pull.rebase false
  # git pull "../${pkgname%-git}-linux-fixes" --no-edit

  # FIXME: Currently the default /etc/makepkg.conf treat unused
  # results as warnings which causes build to fail
  sed -i 's,"FatalWarnings",--"FatalWarnings",g' premake5.lua

  # Manual submodule assign should make this line unnecessary
  # If package fails, it might be due to new submodule added
  # In that case, this line should be able to fetch it
  # python xenia-build setup
}

# FIXME: Currently xenia does not compile on linux with the default
# /etc/makepkg.conf debug and linking particularily
# --fvar-tracking-assignments and --as-needed
DEBUG_CFLAGS="-g"
DEBUG_CXXFLAGS="-g"
LDFLAGS="-Wl,-O1,--sort-common,-z,relro,-z,now"

build() {
  cd "${srcdir}/${pkgname%-git}"
  CC=clang CXX=clang++ python xenia-build premake
  CC=clang CXX=clang++ python xenia-build build --no_premake
}

package() {
  cd "${srcdir}/${pkgname%-git}"

  install -m755 -d ${pkgdir}/usr/bin
  install -m755 build/bin/Linux/Debug/* ${pkgdir}/usr/bin
  rm ${pkgdir}/usr/bin/*.a

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
