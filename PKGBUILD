# Contributor: Vlad Kolotvin <vlad.kolotvin@gmail.com>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=emscripten-git
epoch=2
pkgver=1.39.20.r14.gdf5f6d150
pkgrel=1
pkgdesc="LLVM-to-JavaScript compiler"
arch=('i686' 'x86_64')
url="http://emscripten.org"
license=('custom')
depends=('nodejs' 'python2' 'python' 'libxml2' 'binaryen')
makedepends=('git' 'ninja' 'cmake' 'clang' 'libxml2' 'ocaml-ctypes')
optdepends=('java-runtime: for using clojure'
	    'gcc-go: for using llvm-go, go may also work'
	    'ruby: for running some scripts')
conflicts=('emscripten')
provides=('emscripten')
source=('git+https://github.com/emscripten-core/emscripten.git'
	'git+https://github.com/llvm/llvm-project.git#commit=411f1885b655ea622fe124a87a6eadfd988d7a5e'
        'emscripten.sh::https://git.archlinux.org/svntogit/community.git/plain/trunk/emscripten.sh?h=packages/emscripten'
	'libcxxabi-include-libunwind.patch::https://git.archlinux.org/svntogit/community.git/plain/trunk/libcxxabi-include-libunwind.patch?h=packages/emscripten'
	'emscripten-config::https://projects.archlinux.de/svntogit/community.git/tree/trunk/emscripten-config?h=packages/emscripten')
sha256sums=('SKIP'
            'SKIP'
            '9108d609fee1a7fb7687c13d8d30eb26c0866e8f665c74000f131d3518af1de2'
            '9e5b24e9b39f2c6f6ae23b1bb130630d930b290b31e6c543024cb998678dee16'
            '22a3ba176676cee5ced6e8ca50846ff436708299e76b33390932a98ad186b379')

pkgver() {
  cd ${pkgname%-git}
  git describe --tags |  sed 's+-+.r+' |tr - .
}

prepare() {
  cd ${pkgname%-git}
  patch -Np1 --no-backup-if-mismatch -i "$srcdir"/libcxxabi-include-libunwind.patch
  [[ -d "$srcdir"/llvm-project/llvm/build ]] || mkdir "$srcdir"/llvm-project/llvm/build
}

build() {
  cd "$srcdir"/llvm-project/llvm/build
  cmake .. \
    -GNinja \
    -DPYTHON_EXECUTABLE=/usr/bin/python \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_SKIP_RPATH=YES \
    -DLLVM_TARGETS_TO_BUILD="X86;WebAssembly" \
    -DLLVM_BUILD_RUNTIME=OFF \
    -DLLVM_TOOL_LTO_BUILD=ON \
    -DLLVM_INSTALL_TOOLCHAIN_ONLY=ON \
    -DLLVM_INCLUDE_EXAMPLES=OFF \
    -DLLVM_INCLUDE_TESTS=OFF \
    -DLLVM_ENABLE_PROJECTS="lld;clang" \
    -DCLANG_INCLUDE_TESTS=OFF
  ninja -j1
}

package() {
  # Install LLVM stuff according to https://github.com/emscripten-core/emscripten/blob/incoming/docs/process.md
  install -d "$pkgdir"/usr/lib
  cp -r "$srcdir"/llvm-project/llvm/build/bin "$pkgdir"/usr/lib/emscripten-llvm

  # Install emscripten
  cd "$srcdir"/emscripten
  install -d "$pkgdir"/usr/lib/emscripten
  cp -rup em* cmake site src system third_party tools "$pkgdir"/usr/lib/emscripten
  install -Dm644 "$srcdir"/llvm-project/llvm/build/lib/libclang.so.10svn "$pkgdir"/usr/lib/libclang.so.10svn
  
  # Remove clutter
  rm "$pkgdir"/usr/lib/emscripten/*.bat

  install -d "$pkgdir"/usr/share/doc
  ln -s /usr/lib/emscripten/site/source/docs "$pkgdir"/usr/share/doc/$pkgname
  install -Dm755 "$srcdir"/emscripten.sh "$pkgdir"/etc/profile.d/emscripten.sh
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
