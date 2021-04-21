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

pkgbase=libc++-stable
pkgname=('libc++-stable' 'libc++abi-stable' 'libc++experimental-stable')
url='https://libcxx.llvm.org/'
pkgver=12.0.0
pkgrel=1
license=('custom:Apache 2.0 with LLVM Exception')
arch=('x86_64')
depends=('gcc-libs')
makedepends=('clang' 'cmake' 'llvm' 'libunwind' 'ninja' 'python')
source=("https://github.com/llvm/llvm-project/releases/download/llvmorg-$pkgver/llvm-project-$pkgver.src.tar.xz")
md5sums=('SKIP')

build(){
  cd llvm-project-$pkgver.src

  rm -rf build-libc++

  rm -rf build-libc++abi

  cmake -H. -G Ninja -Bbuild-libc++ \
  -S libcxx  \
  -DCMAKE_BUILD_TYPE=Release \
  -DCMAKE_INSTALL_PREFIX=/usr \
  -DCMAKE_C_COMPILER=clang \
  -DCMAKE_CXX_COMPILER=clang++ \
  -DLIBCXX_INSTALL_EXPERIMENTAL_LIBRARY=NO

  cmake -H. -G Ninja -Bbuild-libc++abi \
  -S libcxxabi  \
  -DCMAKE_BUILD_TYPE=Release \
  -DCMAKE_INSTALL_PREFIX=/usr \
  -DCMAKE_C_COMPILER=clang \
  -DCMAKE_CXX_COMPILER=clang++

  ninja -C build-libc++
  ninja -C build-libc++abi
}

package_libc++-stable(){
  pkgdesc='LLVM C++ standard library'
  depends=("libc++abi")
  options=('staticlibs')
  conflicts=('libc++' 'libc++-git' 'libc++-rc')
  provides=('libc++')

  DESTDIR="$pkgdir" ninja -C llvm-project-$pkgver.src/build-libc++/ install

  install -Dm0644 llvm-project-$pkgver.src/libcxx/CREDITS.TXT "$pkgdir"/usr/share/licenses/"$pkgname"/CREDITS
  install -Dm0644 llvm-project-$pkgver.src/libcxx/LICENSE.TXT "$pkgdir"/usr/share/licenses/"$pkgname"/LICENSE
}

package_libc++abi-stable(){
  pkgdesc='Low level support for the LLVM C++ standard library'
  options=('staticlibs')
  conflicts=('libc++abi' 'libc++abi-git' 'libc++abi-rc')
  provides=('libc++abi')

  DESTDIR="$pkgdir" ninja -C llvm-project-$pkgver.src/build-libc++abi/ install

  install -Dm0644 llvm-project-$pkgver.src/libcxxabi/CREDITS.TXT "$pkgdir"/usr/share/licenses/"$pkgname"/CREDITS
  install -Dm0644 llvm-project-$pkgver.src/libcxxabi/LICENSE.TXT "$pkgdir"/usr/share/licenses/"$pkgname"/LICENSE
}

package_libc++experimental-stable(){
  pkgdesc='LLVM C++ experimental library'
  depends=("libc++")
  conflicts=('libc++experimental' 'libc++experimental-git' 'libc++experimental-rc')
  provides=('libc++experimental')

  install -Dm0644 -t "$pkgdir"/usr/lib/ llvm-project-$pkgver.src/build-libc++/lib/libc++experimental.a
  install -Dm0644 llvm-project-$pkgver.src/libcxx/CREDITS.TXT "$pkgdir"/usr/share/licenses/"$pkgname"/CREDITS
  install -Dm0644 llvm-project-$pkgver.src/libcxx/LICENSE.TXT "$pkgdir"/usr/share/licenses/"$pkgname"/LICENSE
}
