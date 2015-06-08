# Maintainer: pingplug <pingplug@foxmail.com>
# Contributor: Andreas B. Wagner <AndreasBWagner@pointfree.net>
# Contributor: Sebastien Binet <binet@farnsworth>

pkgname=mingw-w64-cblas
_pkgname=cblas
pkgver=3.5.0
pkgrel=1
pkgdesc="C interface to the BLAS. (mingw-w64)"
arch=('any')
url="http://www.netlib.org/blas"
license=('custom')
depends=('mingw-w64-crt' 'mingw-w64-blas')
makedepends=('mingw-w64-gcc')
options=('!buildflags' '!strip' 'staticlibs')
source=(
  'http://www.netlib.org/blas/blast-forum/cblas.tgz' 
  'cblas.patch' 
  'Makefile.in'
  'LICENSE'
)
md5sums=('1e8830f622d2112239a4a8a83b84209a'
         '0c60051f82c02d2d2e4744b906ad5417'
         '5a6fcfc51b57e432b6bbfaf9038e03d3'
         '38b6acb8ed5691d25863319d30a8b365')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

prepare() {
    cd ${srcdir}/CBLAS
    cp ${srcdir}/Makefile.in .
    patch -Np0 -i ${srcdir}/cblas.patch
}

build() {
    #Makefile ignore these flags :(
    #export CPPFLAGS=""
    #export CFLAGS="-O2 -pipe -static"
    #export CXXFLAGS="-O2 -pipe -static"
    #export LDFLAGS="-Wl,-O1"

    for _arch in ${_architectures}; do
        cp -a ${srcdir}/CBLAS "${srcdir}/${_pkgname}-build-${_arch}"
        cd "${srcdir}/${_pkgname}-build-${_arch}"
        mkdir -p src/lib

        make HOST=${_arch} alllib || return 1
    done
}

package() {
    # no rule to install :(
    for _arch in ${_architectures}; do
        install -Dm755 -d "${pkgdir}/usr/${_arch}/bin"
        install -Dm755 -d "${pkgdir}/usr/${_arch}/lib"
        install -Dm755 -d "${pkgdir}/usr/${_arch}/include"

        cd "${srcdir}/${_pkgname}-build-${_arch}"
        install -Dm755 src/lib/*.dll "${pkgdir}/usr/${_arch}/bin"
        install -Dm644 src/lib/*.a "${pkgdir}/usr/${_arch}/lib"
        install -Dm644 include/cblas.h "${pkgdir}/usr/${_arch}/include"

        ${_arch}-strip --strip-unneeded "${pkgdir}/usr/${_arch}/bin/"*.dll
        ${_arch}-strip -g "${pkgdir}/usr/${_arch}/lib/"*.a
    done

  install -Dm755 -d ${pkgdir}/usr/share/licenses/mingw-w64-cblas
  install -Dm644 ${srcdir}/LICENSE ${pkgdir}/usr/share/licenses/mingw-w64-cblas
}
