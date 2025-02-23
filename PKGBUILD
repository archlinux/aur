_pkgname=pcre2
pkgname=mingw-w64-$_pkgname
pkgver=10.45
pkgrel=1
pkgdesc='A library that implements Perl 5-style regular expressions. 2nd version (mingw-w64)'
arch=('any')
url='https://github.com/PCRE2Project/pcre2'
license=(
  BSD-2-Clause
  'BSD-3-Clause WITH PCRE2-exception'
)
makedepends=(mingw-w64-configure mingw-w64-readline mingw-w64-bzip2 mingw-w64-zlib git)
depends=(mingw-w64-crt)
options=(staticlibs !strip !buildflags)
optdepends=(mingw-w64-readline mingw-w64-bzip2 mingw-w64-zlib)
source=(
  $_pkgname::git+$url?signed#tag=$_pkgname-$pkgver
  sljit::git+https://github.com/zherczeg/sljit.git
)
sha512sums=('02e1b9972c00e3eae7d07ddf0519f19b5291c979fa316453d24fea41adce3e3213f484049091df448765b799b66556901c24a6238fd48a1eef79614319a1c68e'
            'SKIP')
b2sums=('196dfcbf6f096b91cb2b72cd1eab53e42a72435f27224fb02fb846f52939d2ae44f1d3ef6d59c024919be9dc00774e13e1bf3c82bec2acb1ac1cf64d66a721cc'
        'SKIP')
validpgpkeys=(
  45F68D54BBE23FB3039B46E59766E084FB0F43D8  # Philip Hazel <ph10@hermes.cam.ac.uk>
  A95536204A3BB489715231282A98E77EB6F24CA8  # Nicholas Wilson <nicholas@nicholaswilson.me.uk>
)

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

prepare() {
  cd $_pkgname

  git submodule init
  git config submodule."deps/sljit".url ../sljit
  git -c protocol.file.allow=always submodule update

  # extract licenses
  cp -v deps/sljit/LICENSE ../BSD-2-Clause.txt
  sed -n '70,94p' LICENCE.md > ../BSD-3-Clause.txt
  sed -n '100,104p' LICENCE.md > ../PCRE2-exception.txt
}

build() {
  cd $_pkgname

  for _arch in ${_architectures}; do
    mkdir -p build-${_arch} && pushd build-${_arch}
    ${_arch}-configure \
      --enable-jit \
      --enable-pcre2-16 \
      --enable-pcre2-32 \
      --enable-pcre2grep-libz \
      --enable-pcre2grep-libbz2 \
      --enable-pcre2test-libreadline
    make
    popd
  done
}

package() {
  cd $_pkgname
  install -Dm644 ./*.txt -t "$pkgdir/usr/share/licenses/$pkgname/"

  for _arch in ${_architectures}; do
    cd "${srcdir}/$_pkgname/build-${_arch}"
    make DESTDIR="$pkgdir" install
    rm -r "$pkgdir/usr/${_arch}/share/"{man,doc}
    find "$pkgdir/usr/${_arch}" -name '*.exe' -exec ${_arch}-strip {} \;
    find "$pkgdir/usr/${_arch}" -name '*.dll' -exec ${_arch}-strip --strip-unneeded {} \;
    find "$pkgdir/usr/${_arch}" -name '*.a' -o -name '*.dll' | xargs ${_arch}-strip -g
  done
}
