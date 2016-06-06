# Maintainer: Martchus <martchus@gmx.net>

# All my PKGBUILDs are managed at https://github.com/Martchus/PKGBUILDs where
# you also find the URL of a binary repository.

_name=libfilezilla
pkgname=mingw-w64-libfilezilla
pkgver=0.5.2
pkgrel=1
pkgdesc="Library used by FileZilla (mingw-w64)"
arch=('any')
url="https://filezilla-project.org/"
license=('GPL')
depends=('mingw-w64-crt')
makedepends=('mingw-w64-configure')
options=(staticlibs !strip !buildflags)
install=
source=("http://downloads.sourceforge.net/project/filezilla/libfilezilla/${pkgver}/${_name}-${pkgver}.tar.bz2")
md5sums=('be50726969cabda0f1b1c9ee432c1f4e')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

prepare() {
  cd "${srcdir}/${_name}-${pkgver}"
  autoreconf -i
}

build() {
  for _arch in ${_architectures}; do
    mkdir -p "${srcdir}/${_name}-${pkgver}/build-${_arch}" && cd "${srcdir}/${_name}-${pkgver}/build-${_arch}"
    ${_arch}-configure
    make
  done
}

package() {
  for _arch in ${_architectures}; do
    cd "${srcdir}/${_name}-${pkgver}/build-${_arch}"
    make DESTDIR="${pkgdir}" install
    ${_arch}-strip -g "${pkgdir}/usr/${_arch}/lib/"*.a
    ${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/bin/*.dll
  done
}
