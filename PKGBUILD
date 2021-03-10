#_                   _ _ _  _ _____ _  _
#| | _______   ____ _| | | || |___  | || |
#| |/ / _ \ \ / / _` | | | || |_ / /| || |_
#|   <  __/\ V / (_| | | |__   _/ / |__   _|
#|_|\_\___| \_/ \__,_|_|_|  |_|/_/     |_|

#Maintainer: kevall474 <kevall474@tuta.io> <https://github.com/kevall474>
#Credits: Evangelos Foutras <evangelos@foutrelis.com>

pkgname=lib32-polly-rc
pkgdesc='High-level loop and data-locality optimizer and optimization infrastructure for LLVM (32-bit) (rc release)'
url='https://polly.llvm.org/'
pkgver=12.0.0rc3
versiontag=12.0.0-rc3
pkgrel=1
arch=('i686' 'x86_64')
license=('custom:Apache 2.0 with LLVM Exception')
depends=('gcc-libs' 'lib32-gcc-libs' 'polly')
makedepends=('llvm' 'lib32-llvm' 'cmake' 'ninja' 'python-sphinx')
conflicts=('lib32-polly-git')
provides=('lib32-polly')
source=("https://github.com/llvm/llvm-project/releases/download/llvmorg-$versiontag/llvm-project-$pkgver.src.tar.xz")
md5sums=('SKIP')

build(){
export PKG_CONFIG_PATH="/usr/lib32/pkgconfig"

  cd llvm-project-$pkgver.src/polly

  rm -rf build

  cmake -H. -G Ninja -Bbuild \
  -DCMAKE_BUILD_TYPE=Release \
  -DCMAKE_INSTALL_PREFIX=/usr \
  -DLLVM_LIBDIR_SUFFIX=32 \
  -DCMAKE_C_FLAGS:STRING=-m32 \
  -DCMAKE_CXX_FLAGS:STRING=-m32 \
  -DLLVM_TARGET_ARCH:STRING=i686 \
  -DLLVM_LINK_LLVM_DYLIB=ON \
  -DLLVM_BUILD_TESTS=ON \
  -DLLVM_BUILD_DOCS=OFF \
  -DLLVM_ENABLE_SPHINX=OFF \
  -DSPHINX_WARNINGS_AS_ERRORS=OFF \
  -DLLVM_EXTERNAL_LIT=/usr/bin/lit \
  -DLLVM_BUILD_MAIN_SRC_DIR="$srcdir/llvm-project-$pkgver.src/llvm"

  ninja -C build/
}

package(){
  cd llvm-project-$pkgver.src/polly

  DESTDIR="$pkgdir" ninja -C build/ install

  rm -rf "$pkgdir"/usr/{share,include,bin}

  install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
