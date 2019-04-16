# Maintainer: David Hill <davidph55@verizon.net>

pkgname=mingw-w64-gdcc
pkgver=0.16.1
pkgrel=1
pkgdesc="Game Data Compiler Collection (mingw-w64)"
arch=(any)
url="http://github.com/DavidPH/GDCC"
license=('GPL2')
depends=('mingw-w64-gmp')
makedepends=('git' 'cmake' 'mingw-w64-cmake')
options=('!strip' '!buildflags' '!staticlibs')
source=("${pkgname}"::git+https://github.com/DavidPH/GDCC.git#tag=v"${pkgver}")
sha256sums=('SKIP')

_arches="i686-w64-mingw32 x86_64-w64-mingw32"

build()
{
   for _arch in ${_arches}
   do
      mkdir -p build-"${_arch}" && pushd build-"${_arch}"

      "${_arch}"-cmake ../"${pkgname}"

      make

      popd
   done
}

package()
{
   for _arch in ${_arches}
   do
      pushd build-"${_arch}"
      make PREFIX=/usr DESTDIR="${pkgdir}" install
      "${_arch}"-strip -g "${pkgdir}"/usr/"${_arch}"/lib/*.a
      "${_arch}"-strip --strip-unneeded "${pkgdir}"/usr/"${_arch}"/bin/*.dll
      "${_arch}"-strip --strip-unneeded "${pkgdir}"/usr/"${_arch}"/bin/*.exe
      popd
   done
}

# EOF

