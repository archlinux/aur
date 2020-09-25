pkgname=xenia-linux-fixes-git
pkgver=r5780.a641b5b1.linux_fixes
pkgrel=1
pkgdesc="Xenia is an experimental emulator for the Xbox 360 (linux fixes fork)."
arch=('x86_64')
url="http://xenia.jp"
license=('BSD')
options=('debug' '!strip')
depends=('gtk3' 'lz4' 'glew' 'libx11')
# TODO use installed premake5 instead of building it
# premake: powerpc patch added
makedepends=('python' 'clang' 'vulkan-headers' 'git' 'clang' 'libpthread-stubs')
provides=('xenia')
conflicts=('xenia')
# TODO: Use system installed deps for non-forked libs
source=("xenia-linux-fixes::git+https://github.com/bwrsandman/xenia.git#branch=linux"
        "git+https://github.com/benvanik/binutils-ppc-cygwin"
        "git+https://github.com/xenia-project/capstone.git"
        "git+https://github.com/catchorg/Catch2"  # catch-git
        "git+https://github.com/benvanik/gflags.git"
        "git+https://github.com/ocornut/imgui.git"
        "git+https://github.com/xenia-project/libav.git"
        "git+https://github.com/xenia-project/premake-core.git"
        "git+https://github.com/xenia-project/premake-export-compile-commands.git"
        "git+https://github.com/xenia-project/snappy.git"
        "git+https://github.com/KhronosGroup/SPIRV-Headers"  # spirv-headers or glslang
        "git+https://github.com/xenia-project/SPIRV-Tools.git"
        "git+https://github.com/xenia-project/xbyak.git"
        "git+https://github.com/jbeder/yaml-cpp.git")  # yaml-cpp
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
            'SKIP')

pkgver() {
  cd "${srcdir}/${pkgname%-git}"
  printf "r%s.%s.linux_fixes" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "${srcdir}/${pkgname%-git}"

  git submodule init
  git config submodule.third_party/binutils-ppc-cygwin.url $srcdir/binutils-ppc-cygwin
  git config submodule.third_party/capstone.url $srcdir/capstone
  git config submodule.third_party/catch.url $srcdir/Catch2
  git config submodule.third_party/gflags.url $srcdir/gflags
  git config submodule.third_party/imgui.url $srcdir/imgui
  git config submodule.third_party/libav.url $srcdir/libav
  git config submodule.third_party/premake-core.url $srcdir/premake-core
  git config submodule.third_party/premake-export-compile-commands.url $srcdir/premake-export-compile-commands
  git config submodule.third_party/snappy.url $srcdir/snappy
  git config submodule.third_party/spirv-headers.url $srcdir/SPIRV-Headers
  git config submodule.third_party/spirv-tools.url $srcdir/SPIRV-Tools
  git config submodule.third_party/xbyak.url $srcdir/xbyak
  git config submodule.third_party/yaml-cpp.url $srcdir/yaml-cpp
  git submodule update

  # FIXME: Currently the default /etc/makepkg.conf treat unused
  # results as warnings which causes build to fail
  sed -i 's,"FatalWarnings",--"FatalWarnings",g' premake5.lua

  # Manual submodule assign should make this line unnecessary
  # If package fails, it might be due to new submodule added
  # In that case, this line should be able to fetch it
  # python xenia-build setup

  cd "${srcdir}/xenia-linux-fixes/third_party/glslang-spirv"
  patch -p1 < "${startdir}/glsl-fix.patch"
  cd "${srcdir}/xenia-linux-fixes/third_party/libav"
  patch -p1 < "${startdir}/sysctl-deprecated.patch"
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
