# Maintainer: asyync1024 <asyync1024 at proton dot me>
# Contributor: Peter Jung ptr1337 <admin@ptr1337.dev>

pkgname=llvm-bolt
pkgver=22.1.7
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
  llvm
  llvm-libs
  ninja
  python
)
options=(!debug !lto) # Disabled LTO & Debug as build times are huge with them
source=("https://github.com/llvm/llvm-project/releases/download/llvmorg-$pkgver/llvm-project-$pkgver.src.tar.xz"{,.sig})
b2sums=('201b7f8f8b4216ad250f9dcdc87f817ac2dac99c1c7f151077e46165c0efae6d04c33c84c70c04c670fe0733e621af866f78d4d93f49e4d8385645f71495f53b'
        'SKIP')
validpgpkeys=('474E22316ABF4785A88C6E8EA2C794A986419D8A'  # Tom Stellard <tstellar@redhat.com>
              'D574BD5D1D0E98895E3BF90044F2485E45D59042'  # Tobias Hieta <tobias@hieta.se>
              'FFB3368980F3E6BB5737145A316C56D064CACBA5'  # Douglas Yung <douglas.yung@sony.com>
              '71046D1E9C6656BDD61171873E83BABF4A4F9E85') # Cullen Rhodes <cullen.rhodes@arm.com>

build() {
  local _cmake_options=(
    -G Ninja
    -S "llvm-project-$pkgver.src/llvm"
    -B build
    -D CMAKE_BUILD_TYPE='Release'
    -D CMAKE_INSTALL_PREFIX='/usr'
    -D LLVM_INSTALL_UTILS=ON
    -D CMAKE_C_COMPILER=clang
    -D CMAKE_CXX_COMPILER=clang++
    -D BUILD_SHARED_LIBS=OFF
    -D LLVM_LINK_LLVM_DYLIB=OFF
    -D LLVM_EXTERNAL_LIT='/usr/bin/lit'
    -D LLVM_ENABLE_PROJECTS='bolt'
    -D LLVM_TARGETS_TO_BUILD='X86;AArch64'
  )
  cmake "${_cmake_options[@]}"
  ninja -C build bolt
}

package() {
  DESTDIR="$pkgdir" ninja -C build install-bolt
  install -Dm644 "$srcdir/llvm-project-$pkgver.src/LICENSE.TXT" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim: sw=2 ts=2 et:
