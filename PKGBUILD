# Maintainer: asyync1024 <asyync1024 at proton dot me>

pkgname=llvm-bolt-git
pkgver=23.0.0_r586403.734f73894151
pkgrel=1
pkgdesc='A post-link optimizer developed to speed up large applications'
url="https://github.com/llvm/llvm-project/tree/main/bolt"
license=('Apache-2.0 WITH LLVM-exception')
arch=('x86_64')
depends=(
  glibc
  libgcc
  libstdc++
  zlib
  zstd
)
makedepends=(
  clang
  cmake
  lld
  llvm
  llvm-libs
  ninja
  python
)
provides=("llvm-bolt")
conflicts=("llvm-bolt")
options=(!debug !lto) # Disabled LTO & Debug as build times are huge with them
source=("git+https://github.com/llvm/llvm-project.git")
b2sums=('SKIP')

pkgver() {
    cd llvm-project/cmake/Modules

    # This will almost match the output of `llvm-config --version` when the
    # LLVM_APPEND_VC_REV cmake flag is turned on. The only difference is
    # dash being replaced with underscore because of Pacman requirements.
    local _pkgver=$(awk -F 'MAJOR |MINOR |PATCH |)' \
            'BEGIN { ORS="." ; i=0 } \
             /set\(LLVM_VERSION_/ { print $2 ; i++ ; if (i==2) ORS="" } \
             END { print "\n" }' \
             LLVMVersion.cmake)_r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)
    echo "$_pkgver"
}

build() {
  local _cmake_options=(
    -G Ninja
    -S "llvm-project/llvm"
    -B build
    -D CMAKE_BUILD_TYPE='Release'
    -D CMAKE_INSTALL_PREFIX='/usr'
    -D LLVM_EXTERNAL_LIT='/usr/bin/lit'
    #-D LLVM_BUILD_TESTS=ON
    -D LLVM_ENABLE_PROJECTS='bolt'
    -D CMAKE_C_COMPILER=clang
    -D CMAKE_CXX_COMPILER=clang++
    -D LLVM_USE_LINKER=lld
    #-D BOLT_CLANG_EXE='/usr/bin/clang'
    #-D BOLT_LLD_EXE='/usr/bin/ld.lld'
    -D LLVM_INSTALL_UTILS=ON
    -D BUILD_SHARED_LIBS=OFF
    -D LLVM_LINK_LLVM_DYLIB=OFF
    -D LLVM_TARGETS_TO_BUILD='X86;AArch64'
  )
  cmake "${_cmake_options[@]}"
  ninja -C build bolt
}

# FIXME: Fix tests.
#check() {
#  ninja -C build check-bolt
#}

package() {
  DESTDIR="$pkgdir" ninja -C build install-bolt
  install -Dm644 "$srcdir/llvm-project/LICENSE.TXT" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim: sw=2 ts=2 et:
