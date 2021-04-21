#_                   _ _ _  _ _____ _  _
#| | _______   ____ _| | | || |___  | || |
#| |/ / _ \ \ / / _` | | | || |_ / /| || |_
#|   <  __/\ V / (_| | | |__   _/ / |__   _|
#|_|\_\___| \_/ \__,_|_|_|  |_|/_/     |_|

#Maintainer: kevall474 <kevall474@tuta.io> <https://github.com/kevall474>
#Credits: Evangelos Foutras <evangelos@foutrelis.com>
#Credits: Jan "heftig" Steffens <jan.steffens@gmail.com>

pkgname=lld-rc
pkgdesc='Linker from the LLVM project (rc release)'
url='https://lld.llvm.org/'
pkgver=12.0.0rc5
versiontag=12.0.0-rc5
pkgrel=1
arch=('x86_64')
license=('custom:Apache 2.0 with LLVM Exception')
depends=('llvm-libs')
makedepends=('llvm' 'cmake' 'ninja' 'python-sphinx')
conflicts=('lld' 'lld-git' 'lld-rc')
provides=('lld')
source=("https://github.com/llvm/llvm-project/releases/download/llvmorg-$versiontag/llvm-project-$pkgver.src.tar.xz")
md5sums=('SKIP')

build(){
  cd llvm-project-$pkgver.src/lld

  rm -rf build

  cmake -H. -G Ninja -Bbuild \
  -DCMAKE_BUILD_TYPE=Release \
  -DCMAKE_INSTALL_PREFIX=/usr \
  -DPYTHON_EXECUTABLE=/usr/bin/python \
  -DLLVM_LINK_LLVM_DYLIB=ON \
  -DLLVM_INCLUDE_TESTS=ON \
  -DLLVM_BUILD_TESTS=OFF \
  -DLLVM_BUILD_DOCS=OFF \
  -DLLVM_ENABLE_SPHINX=OFF \
  -DLLVM_EXTERNAL_LIT=/usr/bin/lit \
  -DLLVM_MAIN_SRC_DIR="$srcdir/llvm-project-$pkgver.src/llvm"

  ninja -C build
}

package(){
  cd llvm-project-$pkgver.src/lld

  DESTDIR="$pkgdir" ninja -C build install

  install -Dm644 LICENSE.TXT "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  # https://bugs.llvm.org/show_bug.cgi?id=42455
  install -Dm644 -t "$pkgdir/usr/share/man/man1" docs/ld.lld.1

  # Remove documentation sources
  #rm -r "$pkgdir"/usr/share/doc/lld/html/{_sources,.buildinfo}
}
