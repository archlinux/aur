# Contributor: Vlad Kolotvin <vlad.kolotvin@gmail.com>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=emscripten-git
pkgver=1.36.2.8.gc8ea3a1
pkgrel=1
pkgdesc="LLVM-to-JavaScript compiler"
arch=('i686' 'x86_64')
url="http://emscripten.org"
license=('custom')
depends=('nodejs' 'python2' 'python')
makedepends=('git' 'cmake' 'clang' 'libxml2')
optdepends=('java-environment: for using clojure'
	    'gcc-go: for using llvm-go, go may also work'
	    'ruby: for running some scripts')
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

pkgver() {
  cd $srcdir/emscripten
  git describe --tags |  sed 's+[_-]+.+g'
}

prepare() {
  # fix an upstream typo 
  sed -i 's+intinsics_gen+intrinsics_gen+' \
      $srcdir/emscripten-fastcomp/lib/Bitcode/Writer/CMakeLists.txt

  cd $srcdir/emscripten
  
  # adapt config file template to use our custom environment variable and path
  sed -e "s|getenv('LLVM')|getenv('EMSCRIPTEN_FASTCOMP')|" \
      -e 's|{{{ LLVM_ROOT }}}|/usr/lib/emscripten-fastcomp|' \
      -i tools/settings_template_readonly.py
  
  # python2 shebang fixes
  sed '1s|python$|python2|' -i $(find third_party tools -name \*.py) emrun emcc{,.py} em++{,.py} emconfigure emmake emcmake emar emranlib
  sed '1s|python$|python2|' -i $srcdir/emscripten-fastcomp-clang/tools/scan-view/bin/scan-view 
  cd $srcdir/emscripten-fastcomp
  
  # put clang source into the right place (http://git.io/i1GBkg)
  [[ -d tools/clang ]] && rm -rf tools/clang
  ln -s $srcdir/emscripten-fastcomp-clang tools/clang

  # reset folder for out-of-source build
  [[ -d build ]] && rm -rf build
  mkdir build
}

build() {
  cd $srcdir/emscripten-fastcomp/build
  CC=clang CXX=clang++ cmake .. -DPYTHON_EXECUTABLE=/usr/bin/python2 \
    -DCMAKE_BUILD_TYPE=Release \
    -DLLVM_TARGETS_TO_BUILD="X86;JSBackend" \
    -DLLVM_BUILD_RUNTIME=OFF \
    -DLLVM_INCLUDE_EXAMPLES=OFF \
    -DLLVM_INCLUDE_TESTS=OFF
  RPATH="" make
}

package() {
  # exported variables
  install -Dm755 "$srcdir"/emscripten.sh "$pkgdir"/etc/profile.d/emscripten.sh
  install -d $pkgdir/usr/lib/emscripten-fastcomp
  install -d $pkgdir/usr/lib/emscripten
  install -d $pkgdir/usr/bin

  cp -R $srcdir/emscripten-fastcomp/build/bin/* \
     $pkgdir/usr/lib/emscripten-fastcomp
  install -m 0755 $srcdir/emscripten-fastcomp/emscripten-version.txt \
	  $pkgdir/usr/lib/emscripten-fastcomp

  cd "$srcdir/emscripten"/src
  for i in em++ emar emcc em-config emconfigure emmake emranlib \
		emrun emscons
  do
    ln -s /usr/lib/emscripten/$i "$pkgdir/usr/bin/$i"
  done
  cd ..
  cp -R em* cmake/ site/ src/ system/ third_party/ tools/ \
     $pkgdir/usr/lib/emscripten
  install -m 0755 $srcdir/emscripten.config \
	  $pkgdir/usr/lib/emscripten/tools/settings_template_readonly.py
  install -Dm0644 LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
  
  # copy structure
  cd "$srcdir"/emscripten
  cp -rup em* cmake site src system third_party tools "$pkgdir"/usr/lib/emscripten

  # remove clutter
  rm "$pkgdir"/usr/lib/emscripten-fastcomp/{*-test,llvm-lit}
  rm "$pkgdir"/usr/lib/emscripten/*.bat

  # docs
  install -d "$pkgdir"/usr/share/doc
  ln -s /usr/lib/emscripten/site/source/docs "$pkgdir"/usr/share/doc/$pkgname

  # delete stray link
  rm "$pkgdir"/usr/lib/emscripten/system/include/libc/bits
}
