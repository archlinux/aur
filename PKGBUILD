#_                   _ _ _  _ _____ _  _
#| | _______   ____ _| | | || |___  | || |
#| |/ / _ \ \ / / _` | | | || |_ / /| || |_
#|   <  __/\ V / (_| | | |__   _/ / |__   _|
#|_|\_\___| \_/ \__,_|_|_|  |_|/_/     |_|

#Maintainer: kevall474 <kevall474@tuta.io> <https://github.com/kevall474>
#Credits: Evangelos Foutras <evangelos@foutrelis.com>
#Credits: Jan "heftig" Steffens <jan.steffens@gmail.com>

pkgname=lldb-rc
pkgdesc='Next generation, high-performance debugger (rc release)'
url='https://lldb.llvm.org/'
pkgver=12.0.0rc5
versiontag=12.0.0-rc5
pkgrel=1
arch=('x86_64')
license=('custom:Apache 2.0 with LLVM Exception')
depends=('llvm-libs' 'clang' 'python' 'python-six')
makedepends=('llvm' 'cmake' 'ninja' 'swig' 'python-sphinx')
conflicts=('lldb' 'lldb-git')
provides=('lldb')
source=("https://github.com/llvm/llvm-project/releases/download/llvmorg-$versiontag/llvm-project-$pkgver.src.tar.xz")
md5sums=('SKIP')

build(){
  cd llvm-project-$pkgver.src/lldb

  rm -rf build

  cmake -H. -G Ninja -Bbuild \
  -DCMAKE_BUILD_TYPE=Release \
  -DCMAKE_INSTALL_PREFIX=/usr \
  -DLLVM_LINK_LLVM_DYLIB=ON \
  -DCLANG_LINK_CLANG_DYLIB=ON \
  -DLLVM_ENABLE_SPHINX=OFF \
  -DLLDB_USE_SYSTEM_SIX=1

  ninja -C build all
  #ninja -C build docs-lldb-man
}

package(){
  DESTDIR="$pkgdir" ninja -C llvm-project-$pkgver.src/lldb/build/ install

  install -Dm644 llvm-project-$pkgver.src/lldb/LICENSE.TXT "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  #install -Dm644 llvm-project/lldb/build/docs/man/lldb.1 "$pkgdir/usr/share/man/man1/lldb.1"
  #install -Dm644 llvm-project/lldb/build/docs/man/lldb-server.1 "$pkgdir/usr/share/man/man1/lldb-server.1"

  # Compile Python scripts
  python3 -m compileall "$pkgdir"
  python3 -O -m compileall "$pkgdir"
  python3 -OO -m compileall "$pkgdir"
}
