# Maintainer: Martchus <martchus@gmx.net>

_name=libfilezilla
pkgname=mingw-w64-libfilezilla-svn
pkgver=r7253
pkgrel=1
pkgdesc="Library used by FileZilla (mingw-w64, svn version)"
arch=('any')
url="https://filezilla-project.org/"
license=('GPL')
depends=('mingw-w64-crt')
makedepends=('mingw-w64-configure' 'subversion')
provides=(${pkgname%-svn})
conflicts=(${pkgname%-svn})
options=(staticlibs !strip !buildflags)
install=
source=("${_name}::svn+https://svn.filezilla-project.org/svn/libfilezilla/trunk")
md5sums=('SKIP')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

pkgver() {
  cd "${srcdir}/${_name}"
  local ver="$(svnversion)"
  printf "r%s" "${ver//[[:alpha:]]}"
}

prepare() {
  cd "${srcdir}/${_name}"
  autoreconf -i
}

build() {
  for _arch in ${_architectures}; do
    mkdir -p "${srcdir}/${_name}/build-${_arch}" && cd "${srcdir}/${_name}/build-${_arch}"
    ${_arch}-configure
    make
  done
}

package() {
  for _arch in ${_architectures}; do
    cd "${srcdir}/${_name}/build-${_arch}"
    make DESTDIR="${pkgdir}" install
    ${_arch}-strip -g "${pkgdir}/usr/${_arch}/lib/"*.a
    ${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/bin/*.dll
  done
}
