# Contributor: Vlad Kolotvin <vlad.kolotvin@gmail.com>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=emscripten-git
epoch=2
pkgver=2.0.15.r31.g249815cf7
pkgrel=2
pkgdesc="LLVM-to-JavaScript compiler"
arch=('i686' 'x86_64')
url="http://emscripten.org"
license=('custom')
depends=('nodejs' 'python' 'libxml2' 'acorn')
makedepends=('git' 'ninja' 'cmake' 'clang' 'libxml2' 'ocaml-ctypes')
optdepends=('java-runtime: for using clojure'
	    'gcc-go: for using llvm-go, go may also work'
	    'ruby: for running some scripts')
conflicts=('emscripten' 'binaryen')
provides=('emscripten')
source=('git+https://github.com/emscripten-core/emscripten.git'
	'git+https://github.com/llvm/llvm-project.git#commit=25a8881b724abf7251a9278e72224af7e82cb9c2'
	'git+https://github.com/WebAssembly/binaryen.git#commit=5ae1724add800780475e02e05a4af133e3729bd6'
        'emscripten.sh'
	'emscripten-config')
sha256sums=('SKIP'
            'SKIP'
            'SKIP'
            '44d6e3df973a7e7ef0b66dbc05d2d49fe06adf711a0f51ba9f05107dfffc35c5'
            'ca93ab7b993b51fca540bbcadd21134ea75b1ba7e449ab645686dcf179f4165b')

pkgver() {
  cd ${pkgname%-git}
  git describe --tags |  sed 's+-+.r+' |tr - .
}

prepare() {
  cd ${pkgname%-git}
  [[ -d "$srcdir"/llvm-project/llvm/build ]] || mkdir "$srcdir"/llvm-project/llvm/build
}

build() {
  cd "$srcdir"/binaryen
  cmake . \
      -Bbuild \
      -GNinja \
      -DCMAKE_INSTALL_PREFIX=/usr
  ninja -C build
  
  cd "$srcdir"/llvm-project/llvm/build
  cmake .. \
    -GNinja \
    -DCMAKE_CXX_FLAGS=-Wno-nonportable-include-path \
    -DLLVM_ENABLE_LIBXML2=OFF \
    -DLLVM_INCLUDE_EXAMPLES=OFF \
    -DCOMPILER_RT_BUILD_XRAY=OFF \
    -DCOMPILER_RT_INCLUDE_TESTS=OFF \
    -DCOMPILER_RT_ENABLE_IOS=OFF \
    -DCMAKE_INSTALL_PREFIX=/opt/emscripten-llvm \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_SKIP_RPATH=ON \
    -DLLVM_BUILD_RUNTIME=OFF \
    -DLLVM_TOOL_LTO_BUILD=ON \
    -DLLVM_INSTALL_TOOLCHAIN_ONLY=ON \
    -DLLVM_INCLUDE_EXAMPLES=OFF \
    -DLLVM_INCLUDE_TESTS=OFF \
    -DLLVM_TARGETS_TO_BUILD="X86;WebAssembly" \
    -DLLVM_ENABLE_PROJECTS="lld;clang" \
    -DCLANG_INCLUDE_TESTS=OFF
  ninja -j1
}

package() {
  DESTDIR="$pkgdir" ninja -C binaryen/build install

  # Install LLVM stuff according to
  # https://github.com/emscripten-core/emscripten/blob/master/docs/packaging.md
  # and
  # https://github.com/WebAssembly/waterfall/blob/d4a504ffee488a68d09b336897c00d404544601d/src/build.py#L915
  DESTDIR="$pkgdir" ninja -C llvm-project/llvm/build install
  cd "$pkgdir"/opt/emscripten-llvm/bin

  # Clean up some unnecessary bins and libs
  rm clang-check clang-cl clang-cpp clang-extdef-mapping clang-format \
      clang-offload-bundler clang-refactor clang-rename clang-scan-deps \
      lld-link ld.lld llvm-lib
  cd ../lib
  rm libclang.so
  cd ..
  rm -r share

  # Copy some stuff that we need but that wasn't installed by default
  for bin in llvm-as llvm-dis FileCheck llc llvm-link llvm-mc llvm-readobj opt llvm-dwarfdump; do
      install -Dm755 "$srcdir"/llvm-project/llvm/build/bin/$bin "$pkgdir"/opt/emscripten-llvm/bin/$bin
  done

  # Install emscripten
  cd "$srcdir"/emscripten
  make DESTDIR="$pkgdir"/usr/lib/emscripten install
  install -Dm644 "$srcdir"/emscripten-config "$pkgdir"/usr/lib/emscripten/.emscripten

  install -d "$pkgdir"/usr/share/doc
  ln -s /usr/lib/emscripten/site/source/docs "$pkgdir"/usr/share/doc/$pkgname
  install -Dm755 "$srcdir"/emscripten.sh "$pkgdir"/etc/profile.d/emscripten.sh
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
