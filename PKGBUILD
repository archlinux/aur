# Maintainer: Andrew Sun <adsun701@gmail.com>

pkgname=mingw-w64-check
_pkgname=check
pkgver=0.12.0
pkgrel=1
pkgdesc="A unit testing framework for C (mingw-w64)"
url="https://libcheck.github.io/check/"
arch=('any')
license=(LGPL)
makedepends=('mingw-w64-configure' 'git')
depends=('mingw-w64-crt')
options=('!strip' '!buildflags' 'staticlibs')
_commit=673dce1d61781c32b449bef0ee8711dc7e689170  # tags/0.12.0
source=("git+https://github.com/libcheck/check#commit=${_commit}")
md5sums=('SKIP')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

pkgver() {
  cd "${srcdir}/${_pkgname}"
  git describe --tags | sed 's/-/+/g'
}

prepare() {
  cd "${srcdir}/${_pkgname}"
  autoreconf -fvi
}

build() {
  cd "${srcdir}/${_pkgname}"
  for _arch in ${_architectures}; do
    mkdir -p build-${_arch} && pushd build-${_arch}
    ${_arch}-configure ..
    make
    popd
  done
}

package() {
  for _arch in ${_architectures}; do
    cd "${srcdir}/${_pkgname}/build-${_arch}"
    make DESTDIR="${pkgdir}" install
    ${_arch}-strip --strip-unneeded "${pkgdir}"/usr/${_arch}/bin/*.dll
    ${_arch}-strip -g "${pkgdir}"/usr/${_arch}/lib/*.a
    
    # get rid of the package's info directory
    rm "${pkgdir}/usr/${_arch}/share/info/dir"
    
    # svn log file is too big
    rm "${pkgdir}"/usr/${_arch}/share/doc/check/*ChangeLog*
  done
}
