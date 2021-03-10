#_                   _ _ _  _ _____ _  _
#| | _______   ____ _| | | || |___  | || |
#| |/ / _ \ \ / / _` | | | || |_ / /| || |_
#|   <  __/\ V / (_| | | |__   _/ / |__   _|
#|_|\_\___| \_/ \__,_|_|_|  |_|/_/     |_|

#Maintainer: kevall474 <kevall474@tuta.io> <https://github.com/kevall474>
#Credits: Evangelos Foutras <evangelos@foutrelis.com>

pkgname=lib32-openmp-rc
pkgdesc='LLVM OpenMP Runtime Library (32-bit) (rc release)'
url='https://openmp.llvm.org/'
pkgver=12.0.0rc3
versiontag=12.0.0-rc3
pkgrel=1
arch=('i686' 'x86_64')
license=('custom:Apache 2.0 with LLVM Exception')
depends=('lib32-glibc' 'lib32-libelf' 'lib32-libffi' 'openmp')
makedepends=('cmake' 'ninja')
conflicts=('lib32-openmp-git')
provides=('lib32-openmp')
source=("https://github.com/llvm/llvm-project/releases/download/llvmorg-$versiontag/llvm-project-$pkgver.src.tar.xz")
md5sums=('SKIP')

build(){
export PKG_CONFIG_PATH="/usr/lib32/pkgconfig"

  cd llvm-project-$pkgver.src/openmp

  rm -rf build

  cmake -H. -G Ninja -Bbuild \
  -DCMAKE_BUILD_TYPE=Release \
  -DCMAKE_INSTALL_PREFIX=/usr \
  -DCMAKE_C_FLAGS:STRING=-m32 \
  -DCMAKE_CXX_FLAGS:STRING=-m32 \
  -DLLVM_TARGET_ARCH:STRING=i686 \
  -DLIBOMP_INSTALL_ALIASES=OFF

  ninja -C build
}

package() {
  cd llvm-project-$pkgver.src/openmp

  DESTDIR="$pkgdir" ninja -C build/ install

  rm -rf "$pkgdir"/usr/{share,include,bin}

  mv "$pkgdir"/usr/lib/ "$pkgdir"/usr/lib32/

  install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  rm "$pkgdir/usr/lib32/libarcher_static.a"
}
