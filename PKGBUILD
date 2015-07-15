# Contributor: Vlad Kolotvin <vlad.kolotvin@gmail.com>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=emscripten-git
pkgver=1.34.2.1.g4d95be2
pkgrel=1
pkgdesc="LLVM-to-JavaScript compiler"
arch=('i686' 'x86_64')
url="http://emscripten.org"
license=('custom')
depends=('nodejs' 'python2' 'libxml2')
makedepends=('git' 'cmake' 'clang')
optdepends=('java-envionment: for using clojure')
conflicts=('emscripten')
provides=('emscripten')
source=('git://github.com/kripken/emscripten.git#branch=incoming'
        'git://github.com/kripken/emscripten-fastcomp.git#branch=incoming'
        'git://github.com/kripken/emscripten-fastcomp-clang.git#branch=incoming'
        'emscripten.sh'
        'emscripten.config')
md5sums=('SKIP'
         'SKIP'
         'SKIP'
         '543c109cf8753f5d834d1b206312f049'
         'c8b7db20a44edb41c8675812e17b5c42')
options=('!makeflags')

pkgver() {
  cd $srcdir/emscripten
  git describe --tags |  sed 's+[_-]+.+g'
}

prepare() {
  sed -i 's+intinsics_gen+intrinsics_gen+' \
      $srcdir/emscripten-fastcomp/lib/Bitcode/NaCl/Writer/CMakeLists.txt
  cd $srcdir/emscripten
  sed -i 's/\<python\>/python2/g' $(find . -name \*.py) em++ emar \
      emcc em-config emconfigure emmake emranlib emrun emscons
}

build() {
  cd $srcdir/emscripten-fastcomp
  
  [[ -d tools/clang ]] && rm -rf tools/clang
  ln -s $srcdir/emscripten-fastcomp-clang tools/clang
  
  [[ -d build ]] && rm -rf build
  mkdir build
  cd build

  CC=clang CXX=clang++ cmake .. -DPYTHON_EXECUTABLE=/usr/bin/python2 \
    -DCMAKE_BUILD_TYPE=Release \
    -DLLVM_TARGETS_TO_BUILD="X86;JSBackend" \
    -DLLVM_BUILD_RUNTIME=OFF \
    -DLLVM_INCLUDE_EXAMPLES=OFF \
    -DLLVM_INCLUDE_TESTS=OFF
  RPATH="" make
}

package() {
  install -d $pkgdir/opt/emscripten-fastcomp
  install -d $pkgdir/usr/lib/emscripten
  install -d $pkgdir/etc/profile.d
  install -d $pkgdir/usr/bin
  
  cp -R $srcdir/emscripten-fastcomp/build/bin/* \
     $pkgdir/opt/emscripten-fastcomp
  install -m 0755 $srcdir/emscripten-fastcomp/emscripten-version.txt \
	  $pkgdir/opt/emscripten-fastcomp
  install -m 0755 $srcdir/emscripten.sh $pkgdir/etc/profile.d/
  for i in em++ emar emcc em-config emconfigure emmake emranlib \
		emrun emscons
  do
    ln -s /usr/lib/emscripten/$i "$pkgdir/usr/bin/$i"
  done
  
  cd "$srcdir/emscripten"
  cp -R em* cmake/ site/ src/ system/ third_party/ tools/ \
     $pkgdir/usr/lib/emscripten
  install -m 0755 $srcdir/emscripten.config \
	  $pkgdir/usr/lib/emscripten/tools/settings_template_readonly.py
  install -Dm0644 LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
  sed -i 's/\<python\>/python2/g' \
      $pkgdir/opt/emscripten-fastcomp/llvm-lit
}
