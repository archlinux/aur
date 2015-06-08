# Contributor: Benoit Favre <benoit.favre@gmail.com>

pkgname=mingw-w64-mman-win32-svn
pkgver=r4
pkgrel=5
pkgdesc="A light implementation of the mmap functions for MinGW (mingw-w64)"
arch=('any')
url="https://code.google.com/p/mman-win32/"
license=('MIT')
makedepends=('mingw-w64-gcc' 'subversion')
depends=('mingw-w64-crt')
options=('!strip' '!buildflags' 'staticlibs')
source=("${pkgname}::svn+http://mman-win32.googlecode.com/svn/trunk/")
md5sums=('SKIP')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

pkgver() {
  cd "$srcdir/${pkgname}"
  local ver="$(svnversion)"
  printf "r%s" "${ver//[[:alpha:]]}"
}

prepare() {
  cd "$srcdir/${pkgname}"
  sed -i "s|-Wall -O3 -fomit-frame-pointer|-O2 -g -pipe -Wall -Wp,-D_FORTIFY_SOURCE=2 -fexceptions --param=ssp-buffer-size=4|g" Makefile
}

build() {
  cd "${srcdir}"
  for _arch in ${_architectures}; do
    cp -r ${pkgname} build-${_arch} && pushd build-${_arch}
    sh configure \
       --prefix=/usr/${_arch} \
       --libdir=/usr/${_arch}/lib \
       --incdir=/usr/${_arch}/include/sys \
       --cross-prefix=${_arch}-
    make
    ${_arch}-g++ -shared -o libmman.dll mman.o -Wl,--out-implib,libmman.dll.a
    popd
  done
}

package() {
  for _arch in ${_architectures}; do
    cd "${srcdir}/build-${_arch}"
    make DESTDIR="${pkgdir}" install
    install -d "$pkgdir"/usr/${_arch}/{bin,lib}
    install -t "$pkgdir/usr/${_arch}/bin" libmman.dll
    install -t "$pkgdir/usr/${_arch}/lib" libmman.dll.a
    ${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/bin/*.dll
    ${_arch}-strip -g "$pkgdir"/usr/${_arch}/lib/*.a
  done
}

