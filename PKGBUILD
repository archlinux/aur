# Maintainer: Fernando Pacheco <fernando.pacheco@ingesur.com.uy>

pkgname=mingw-w64-proj
pkgver=4.8.0
pkgrel=1
arch=('any')
pkgdesc="MinGW Windows port of Proj.4 (mingw-w64)"
depends=('mingw-w64-crt')
makedepends=('mingw-w64-gcc')
options=(!strip !buildflags)
license=('BSD')
url="http://trac.osgeo.org/proj/"
source=("http://download.osgeo.org/proj/proj-${pkgver}.tar.gz")
md5sums=('d815838c92a29179298c126effbb1537')


_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

build()
{
  cd ${srcdir}/proj-${pkgver}

  for _arch in ${_architectures}; do
    mkdir -p build-${_arch} && pushd build-${_arch}
    unset LDFLAGS
    ../configure \
      --host=${_arch} \
      --prefix=/usr/${_arch} \
      --without-mutex 
    make
    popd
  done
}

package() {
  for _arch in ${_architectures}; do
    cd "$srcdir/proj-${pkgver}/build-${_arch}"
    make DESTDIR="$pkgdir/" install
    ${_arch}-strip "$pkgdir/usr/${_arch}"/bin/*.exe
    ${_arch}-strip -x -g "$pkgdir/usr/${_arch}"/bin/*.dll
    ${_arch}-strip -g "$pkgdir/usr/${_arch}/lib"/*.a
    rm -rf "$pkgdir/usr/${_arch}"/share/{doc,man}
    rm -rf "$pkgdir/usr/${_arch}"/{etc,var,libexec}
  done
}
