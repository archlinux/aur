# Maintainer: Andrew Sun <adsun701@gmail.com>

pkgname=mingw-w64-ntldd-git
pkgver=r17.3a08ea2
pkgrel=1
pkgdesc="Tracks dependencides in Windows PE binaries (mingw-w64)"
arch=('any')
license=('GPL3')
depends=("mingw-w64-crt" "wine")
makedepends=("mingw-w64-gcc" "git")
url="https://github.com/LRN/ntldd"
provides=("mingw-w64-ntldd")
conflicts=("mingw-w64-ntldd")
source=("git+https://github.com/LRN/ntldd.git")
md5sums=('SKIP')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

pkgver() {
  cd "${srcdir}/ntldd"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  for _arch in ${_architectures}; do
    rm -rf "${srcdir}/build-${_arch}"
  	cp -R ${srcdir}/ntldd/. "${srcdir}/build-${_arch}"
  	cd "${srcdir}/build-${_arch}"
  	CC=${_arch}-gcc \
    AR=${_arch}-ar \
    RANLIB=${_arch}-ranlib \
    make
  done
}

package () {
  for _arch in ${_architectures}; do
    cd "${srcdir}/build-${_arch}"
    install -d "${pkgdir}/usr/${_arch}/"{bin,include,lib}
    install -m644 -t "${pkgdir}/usr/${_arch}/include" libntldd.h
    install -m644 -t "${pkgdir}/usr/${_arch}/lib" libntldd.a
    install -m755 -t "${pkgdir}/usr/${_arch}/bin" ntldd.exe
    install -m644 -D README "${pkgdir}/usr/${_arch}/share/doc/ntldd/README"
  done
}
