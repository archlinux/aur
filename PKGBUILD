#_                   _ _ _  _ _____ _  _
#| | _______   ____ _| | | || |___  | || |
#| |/ / _ \ \ / / _` | | | || |_ / /| || |_
#|   <  __/\ V / (_| | | |__   _/ / |__   _|
#|_|\_\___| \_/ \__,_|_|_|  |_|/_/     |_|

#Maintainer: kevall474 <kevall474@tuta.io> <https://github.com/kevall474>
#Credits: Evangelos Foutras <evangelos@foutrelis.com>

pkgname=polly-rc
pkgdesc='High-level loop and data-locality optimizer and optimization infrastructure for LLVM (rc release)'
url='https://polly.llvm.org/'
pkgver=12.0.0rc5
versiontag=12.0.0-rc5
pkgrel=1
arch=('x86_64')
license=('custom:Apache 2.0 with LLVM Exception')
depends=('gcc-libs')
makedepends=('llvm' 'cmake' 'ninja' 'python-sphinx')
conflicts=('polly' 'polly-git')
provides=('polly')
source=("https://github.com/llvm/llvm-project/releases/download/llvmorg-$versiontag/llvm-project-$pkgver.src.tar.xz")
md5sums=('SKIP')


build(){
  cd llvm-project-$pkgver.src/polly

  rm -rf build

  cmake -H. -G Ninja -Bbuild \
  -DCMAKE_BUILD_TYPE=Release \
  -DCMAKE_INSTALL_PREFIX=/usr \
  -DLLVM_LINK_LLVM_DYLIB=ON \
  -DLLVM_BUILD_TESTS=ON \
  -DLLVM_BUILD_DOCS=OFF \
  -DLLVM_ENABLE_SPHINX=OFF \
  -DSPHINX_WARNINGS_AS_ERRORS=OFF \
  -DLLVM_EXTERNAL_LIT=/usr/bin/lit \
  -DLLVM_BUILD_MAIN_SRC_DIR="$srcdir/llvm-project/llvm"

  ninja -C build/
}

package(){
  cd llvm-project-$pkgver.src/polly

  DESTDIR="$pkgdir" ninja -C build/ install
  install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  # Remove documentation sources
  #rm -r "$pkgdir"/usr/share/doc/polly/html/{_sources,.buildinfo}
}
