#_                   _ _ _  _ _____ _  _
#| | _______   ____ _| | | || |___  | || |
#| |/ / _ \ \ / / _` | | | || |_ / /| || |_
#|   <  __/\ V / (_| | | |__   _/ / |__   _|
#|_|\_\___| \_/ \__,_|_|_|  |_|/_/     |_|

#Maintainer: kevall474 <kevall474@tuta.io> <https://github.com/kevall474>
#Credits: Anatol Pomozov
#Credits: Llewelyn Trahaearn <woefulderelict [at] gmail [dot] com>
#Credits: Daniel Micay <danielmicay [at] gmail [dot] com>
#Credits: MThinkCpp <mtc [dot] maintainer [at] outlook [dot] com>

pkgbase=lib32-libc++-rc
pkgname=('lib32-libc++-rc' 'lib32-libc++abi-rc' 'lib32-libc++experimental-rc')
url='https://libcxx.llvm.org/'
pkgver=12.0.0rc3
versiontag=12.0.0-rc3
pkgrel=1
license=('custom:Apache 2.0 with LLVM Exception')
arch=('i686' 'x86_64')
depends=('lib32-gcc-libs')
makedepends=('lib32-clang' 'cmake' 'lib32-llvm' 'lib32-libunwind' 'ninja' 'python')
source=("https://github.com/llvm/llvm-project/releases/download/llvmorg-$versiontag/llvm-project-$pkgver.src.tar.xz")
md5sums=('SKIP')

build(){
export PKG_CONFIG_PATH="/usr/lib32/pkgconfig"

  cd llvm-project-$pkgver.src

  rm -rf build-libc++

  rm -rf build-libc++abi

  cmake -H. -G Ninja -Bbuild-libc++ \
  -S libcxx  \
  -DCMAKE_BUILD_TYPE=Release \
  -DCMAKE_INSTALL_PREFIX=/usr \
  -DLLVM_LIBDIR_SUFFIX=32 \
  -DCMAKE_C_FLAGS:STRING=-m32 \
  -DCMAKE_CXX_FLAGS:STRING=-m32 \
  -DLLVM_TARGET_ARCH:STRING=i686 \
  -DCMAKE_C_COMPILER=clang \
  -DCMAKE_CXX_COMPILER=clang++ \
  -DLIBCXX_INSTALL_EXPERIMENTAL_LIBRARY=NO

  cmake -H. -G Ninja -Bbuild-libc++abi \
  -S libcxxabi  \
  -DCMAKE_BUILD_TYPE=Release \
  -DCMAKE_INSTALL_PREFIX=/usr \
  -DLLVM_LIBDIR_SUFFIX=32 \
  -DCMAKE_C_FLAGS:STRING=-m32 \
  -DCMAKE_CXX_FLAGS:STRING=-m32 \
  -DLLVM_TARGET_ARCH:STRING=i686 \
  -DCMAKE_C_COMPILER=clang \
  -DCMAKE_CXX_COMPILER=clang++

  ninja -C build-libc++
  ninja -C build-libc++abi
}

package_lib32-libc++-rc(){
  pkgdesc='LLVM C++ standard library (32-bit) (rc release)'
  depends=('lib32-libc++abi' 'libc++')
  options=('staticlibs')
  conflicts=('lib32-libc++-git')
  provides=('lib32-libc++')

  DESTDIR="$pkgdir" ninja -C llvm-project-$pkgver.src/build-libc++/ install

  rm -rf "${pkgdir}"/usr/{include,share,bin}

  install -Dm0644 llvm-project-$pkgver.src/libcxx/CREDITS.TXT "$pkgdir"/usr/share/licenses/"$pkgname"/CREDITS
  install -Dm0644 llvm-project-$pkgver.src/libcxx/LICENSE.TXT "$pkgdir"/usr/share/licenses/"$pkgname"/LICENSE
}

package_lib32-libc++abi-rc(){
  pkgdesc='Low level support for the LLVM C++ standard library (32-bit) (rc release)'
  options=('staticlibs')
  depends=('libc++abi')
  conflicts=('lib32-libc++abi-git')
  provides=('lib32-libc++abi')

  DESTDIR="$pkgdir" ninja -C llvm-project-$pkgver.src/build-libc++abi/ install

  rm -rf "${pkgdir}"/usr/{include,share,bin}

  install -Dm0644 llvm-project-$pkgver.src/libcxxabi/CREDITS.TXT "$pkgdir"/usr/share/licenses/"$pkgname"/CREDITS
  install -Dm0644 llvm-project-$pkgver.src/libcxxabi/LICENSE.TXT "$pkgdir"/usr/share/licenses/"$pkgname"/LICENSE
}

package_lib32-libc++experimental-rc(){
  pkgdesc='LLVM C++ experimental library (32-bit) (rc release)'
  depends=('lib32-libc++' 'libc++experimental')
  conflicts=('lib32-libc++experimental-git')
  provides=('lib32-libc++experimental')

  install -Dm0644 -t "$pkgdir"/usr/lib32/ llvm-project-$pkgver.src/build-libc++/lib32/libc++experimental.a
  install -Dm0644 llvm-project-$pkgver.src/libcxx/CREDITS.TXT "$pkgdir"/usr/share/licenses/"$pkgname"/CREDITS
  install -Dm0644 llvm-project-$pkgver.src/libcxx/LICENSE.TXT "$pkgdir"/usr/share/licenses/"$pkgname"/LICENSE
}
