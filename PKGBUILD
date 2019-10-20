# Contributor: Vlad Kolotvin <vlad.kolotvin@gmail.com>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=emscripten-git
epoch=2
pkgver=1.39.0.r5.gea459044a
pkgrel=1
pkgdesc="LLVM-to-JavaScript compiler"
arch=('i686' 'x86_64')
url="http://emscripten.org"
license=('custom')
depends=('nodejs' 'python2' 'python' 'libxml2')
makedepends=('git' 'cmake' 'clang' 'ocaml-ctypes')
optdepends=('java-runtime: for using clojure'
	    'gcc-go: for using llvm-go, go may also work'
	    'ruby: for running some scripts')
conflicts=('emscripten')
provides=('emscripten')
source=('git://github.com/kripken/emscripten.git#branch=incoming'
        'git://github.com/kripken/emscripten-fastcomp.git#branch=incoming'
        'git://github.com/kripken/emscripten-fastcomp-clang.git#branch=incoming'
        'emscripten.sh::https://git.archlinux.org/svntogit/community.git/plain/trunk/emscripten.sh?h=packages/emscripten'
        'emscripten.config')
sha256sums=('SKIP'
            'SKIP'
            'SKIP'
            '44d6e3df973a7e7ef0b66dbc05d2d49fe06adf711a0f51ba9f05107dfffc35c5'
            'f5c3836a05f51285c12033607ba174c72576644d59a534ebe6b0476912642d7f')

pkgver() {
  cd ${pkgname%-git}
  git describe --tags |  sed 's+-+.r+' |tr - .
}

prepare() {
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
  cd ${pkgname%-git}-fastcomp/build
  cmake .. -DPYTHON_EXECUTABLE=/usr/bin/python2 \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_SKIP_RPATH=YES \
    -DLLVM_TARGETS_TO_BUILD="X86;JSBackend" \
    -DLLVM_BUILD_RUNTIME=OFF \
    -DLLVM_INCLUDE_EXAMPLES=OFF \
    -DLLVM_INCLUDE_TESTS=OFF \
    -DCLANG_INCLUDE_TESTS=OFF 
   make
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
    ln -s /usr/lib/${pkgname%-git}/$i "$pkgdir"/usr/bin/$i
  done
  cd ..
  cp -R em* cmake/ site/ src/ system/ third_party/ tools/ \
     "$pkgdir"/usr/lib/emscripten
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
}
