_pkgname=pcre2
pkgname=mingw-w64-$_pkgname
pkgver=10.49
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
sha512sums=('3112ecb32bcbb8840c70e263915d0a690ae2cbc6b5160ff05d96419353290d5e2740a9dd4f7d59fff697bab58695751fedd3b665a7649e2b7c3af417d7f74698'
            'SKIP')
b2sums=('120754ca82467149bfb02c6b3f778a25c7a65b968ac358e01b1cdbb9114805a1e75585e049c8a25e0f6723a314798e39f6caa97a55aef3ce9d84e60566859592'
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
