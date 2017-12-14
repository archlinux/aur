# Contributor: Vlad Kolotvin <vlad.kolotvin@gmail.com>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=emscripten-git
pkgver=1.37.25.2.g6c5ec986f
pkgrel=1
pkgdesc="LLVM-to-JavaScript compiler"
arch=('i686' 'x86_64')
url="http://emscripten.org"
license=('custom')
depends=('nodejs' 'python2' 'python')
makedepends=('git' 'cmake' 'clang' 'libxml2' 'ocaml-ctypes')
optdepends=('java-environment: for using clojure'
	    'gcc-go: for using llvm-go, go may also work'
	    'ruby: for running some scripts')
conflicts=('emscripten')
provides=('emscripten')
source=('git://github.com/kripken/emscripten.git#branch=incoming'
        'git://github.com/kripken/emscripten-fastcomp.git#branch=incoming'
        'git://github.com/kripken/emscripten-fastcomp-clang.git#branch=incoming'
        'emscripten.sh::https://git.archlinux.org/svntogit/community.git/plain/trunk/emscripten.sh?h=packages/emscripten'
        'emscripten.config')
md5sums=('SKIP'
         'SKIP'
         'SKIP'
         '99ad755a0e9ccf5620e05e1293cdbffa'
         'c8b7db20a44edb41c8675812e17b5c42')

pkgver() {
  cd "$srcdir"/${pkgname%-git}
  git describe --tags |  sed 's+[_-]+.+g'
}

prepare() {
  # fix an upstream typo 
  sed -i 's+intinsics_gen+intrinsics_gen+' \
      "$srcdir"/${pkgname%-git}-fastcomp/lib/Bitcode/Writer/CMakeLists.txt

  cd "$srcdir"/${pkgname%-git}
  
  # adapt config file template to use our custom environment variable and path
  sed -e "s|getenv('LLVM')|getenv('EMSCRIPTEN_FASTCOMP')|" \
      -e 's|{{{ LLVM_ROOT }}}|/usr/lib/emscripten-fastcomp|' \
      -i tools/settings_template_readonly.py
  
  # python2 shebang fixes
  sed '1s|python$|python2|' -i $(find third_party tools -name \*.py) emrun emcc{,.py} em++{,.py} emconfigure emmake emcmake emar emranlib
  sed '1s|python$|python2|' -i "$srcdir"/${pkgname%-git}-fastcomp-clang/tools/scan-view/bin/scan-view 
  cd "$srcdir"/${pkgname%-git}-fastcomp
  
  # put clang source into the right place (http://git.io/i1GBkg)
  [[ -d tools/clang ]] && rm -rf tools/clang
  ln -s "$srcdir"/${pkgname%-git}-fastcomp-clang tools/clang

  # reset folder for out-of-source build
  [[ -d build ]] && rm -rf build
  mkdir build
}

build() {
  cd "$srcdir"/${pkgname%-git}-fastcomp/build
  cmake .. -DPYTHON_EXECUTABLE=/usr/bin/python2 \
    -DCMAKE_BUILD_TYPE=Release \
    -DLLVM_TARGETS_TO_BUILD="X86;JSBackend" \
    -DLLVM_BUILD_RUNTIME=OFF \
    -DLLVM_INCLUDE_EXAMPLES=OFF \
    -DLLVM_INCLUDE_TESTS=OFF
  RPATH="" make
}

package() {
  # exported variables
  install -Dm755 "$srcdir"/${pkgname%-git}.sh "$pkgdir"/etc/profile.d/${pkgname%-git}.sh
  install -d "$pkgdir"/usr/lib/${pkgname%-git}-fastcomp
  install -d "$pkgdir"/usr/lib/${pkgname%-git}
  install -d "$pkgdir"/usr/bin

  cp -R "$srcdir"/${pkgname%-git}-fastcomp/build/bin/* \
     "$pkgdir"/usr/lib/${pkgname%-git}-fastcomp
  install -m 0755 "$srcdir"/${pkgname%-git}-fastcomp/${pkgname%-git}-version.txt \
	  "$pkgdir"/usr/lib/${pkgname%-git}-fastcomp

  cd "$srcdir"/${pkgname%-git}/src
  for i in em++ emar emcc em-config emconfigure emmake emranlib \
		emrun emscons
  do
    ln -s /usr/lib/${pkgname%-git}/$i "$pkgdir/usr/bin/$i"
  done
  cd ..
  cp -R em* cmake/ site/ src/ system/ third_party/ tools/ \
     $pkgdir/usr/lib/emscripten
  install -m 0755 "$srcdir"/${pkgname%-git}.config \
	  "$pkgdir"/usr/lib/${pkgname%-git}/tools/settings_template_readonly.py
  install -Dm0644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
  
  # copy structure
  cd "$srcdir"/${pkgname%-git}
  cp -rup em* cmake site src system third_party tools "$pkgdir"/usr/lib/${pkgname%-git}

  # remove clutter
  rm "$pkgdir"/usr/lib/${pkgname%-git}-fastcomp/{*-test,llvm-lit}
  rm "$pkgdir"/usr/lib/${pkgname%-git}/*.bat

  # docs
  install -d "$pkgdir"/usr/share/doc
  ln -s /usr/lib/${pkgname%-git}/site/source/docs "$pkgdir"/usr/share/doc/$pkgname

  # delete stray link
  rm "$pkgdir"/usr/lib/${pkgname%-git}/system/include/libc/bits
}
