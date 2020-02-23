# Contributor: Vlad Kolotvin <vlad.kolotvin@gmail.com>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=emscripten-git
epoch=2
pkgver=1.39.8.r77.g1fc7303e5
pkgrel=1
pkgdesc="LLVM-to-JavaScript compiler"
arch=('i686' 'x86_64')
url="http://emscripten.org"
license=('custom')
depends=('nodejs' 'python2' 'python' 'libxml2')
makedepends=('git' 'ninja' 'cmake' 'clang' 'ocaml-ctypes')
optdepends=('java-runtime: for using clojure'
	    'gcc-go: for using llvm-go, go may also work'
	    'ruby: for running some scripts')
conflicts=('emscripten')
provides=('emscripten')
source=('git://github.com/kripken/emscripten.git'
	'git+https://github.com/llvm/llvm-project.git#commit=411f1885b655ea622fe124a87a6eadfd988d7a5e'
        'emscripten.sh::https://git.archlinux.org/svntogit/community.git/plain/trunk/emscripten.sh?h=packages/emscripten'
	'arch-template.patch::https://git.archlinux.org/svntogit/community.git/plain/trunk/arch-template.patch?h=packages/emscripten'
	'emscripten.config')
sha256sums=('SKIP'
            'SKIP'
            '44d6e3df973a7e7ef0b66dbc05d2d49fe06adf711a0f51ba9f05107dfffc35c5'
            '770f6c6322efeb280789e4d069ca19ad6621bb3867d3d51c86fe9f2256fb2fb0'
            'f5c3836a05f51285c12033607ba174c72576644d59a534ebe6b0476912642d7f')

pkgver() {
  cd ${pkgname%-git}
  git describe --tags |  sed 's+-+.r+' |tr - .
}

prepare() {
  cd ${pkgname%-git}
  patch -Np1 --no-backup-if-mismatch -i "$srcdir"/arch-template.patch
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

  # Remove clutter
  rm "$pkgdir"/usr/lib/emscripten/*.bat

  install -d "$pkgdir"/usr/share/doc
  ln -s /usr/lib/emscripten/site/source/docs "$pkgdir"/usr/share/doc/$pkgname
  install -Dm755 "$srcdir"/emscripten.sh "$pkgdir"/etc/profile.d/emscripten.sh
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
