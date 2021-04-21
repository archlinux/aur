#_                   _ _ _  _ _____ _  _
#| | _______   ____ _| | | || |___  | || |
#| |/ / _ \ \ / / _` | | | || |_ / /| || |_
#|   <  __/\ V / (_| | | |__   _/ / |__   _|
#|_|\_\___| \_/ \__,_|_|_|  |_|/_/     |_|

#Maintainer: kevall474 <kevall474@tuta.io> <https://github.com/kevall474>
#Credits: Evangelos Foutras <evangelos@foutrelis.com>
#Credits: Jan "heftig" Steffens <jan.steffens@gmail.com>

pkgname=compiler-rt-rc
pkgdesc='Compiler runtime libraries for clang (rc release)'
url='https://compiler-rt.llvm.org/'
pkgver=12.0.0rc5
versiontag=12.0.0-rc5
pkgrel=1
arch=('x86_64')
license=('custom:Apache 2.0 with LLVM Exception')
depends=('gcc-libs')
makedepends=('llvm' 'cmake' 'ninja' 'python')
# Build 32-bit compiler-rt libraries on x86_64 (FS#41911)
makedepends_x86_64=('lib32-gcc-libs')
options=('staticlibs')
conflicts=('compiler-rt' 'compiler-rt-git' 'compiler-rt-stable')
provides=('compiler-rt')
source=("https://github.com/llvm/llvm-project/releases/download/llvmorg-$versiontag/llvm-project-$pkgver.src.tar.xz")
md5sums=('SKIP')

build(){
  cd llvm-project-$pkgver.src/compiler-rt

  rm -rf build

  cmake -H. -G Ninja -Bbuild \
  -DCMAKE_BUILD_TYPE=Release \
  -DCMAKE_INSTALL_PREFIX=/usr

  ninja -C build
}

package(){
  cd llvm-project-$pkgver.src/compiler-rt

  DESTDIR="$pkgdir" ninja -C build/ install

  install -Dm644 LICENSE.TXT "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  mkdir -p "$pkgdir"/usr/lib/clang/12.0.0/{lib,share}
  mv "$pkgdir"/usr/lib/{linux,clang/12.0.0/lib/}
  mv "$pkgdir"/usr/{share/*.txt,lib/clang/12.0.0/share/}
}
