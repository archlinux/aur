# Maintainer: Martchus <martchus@gmx.net>

# All my PKGBUILDs are managed at https://github.com/Martchus/PKGBUILDs where
# you also find the URL of a binary repository.

_name=libfilezilla
pkgname=mingw-w64-libfilezilla
pkgver=0.12.2
pkgrel=1
pkgdesc='Small and modern C++ library, offering some basic functionality to build high-performing, platform-independent programs (mingw-w64)'
arch=('any')
url='https://filezilla-project.org/'
license=('GPL')
depends=('mingw-w64-crt')
makedepends=('mingw-w64-configure')
options=(staticlibs !strip !buildflags !makeflags)
install=
source=("http://download.filezilla-project.org/libfilezilla/libfilezilla-$pkgver.tar.bz2")
md5sums=('79c95ee58bc8db2fa3690a36ece25a6d')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

prepare() {
  cd "${srcdir}/${_name}-${pkgver}"
  autoreconf -i
}

build() {
  export CXXFLAGS='-O0'
  for _arch in ${_architectures}; do
    mkdir -p "${srcdir}/${_name}-${pkgver}/build-${_arch}" && cd "${srcdir}/${_name}-${pkgver}/build-${_arch}"
    ${_arch}-configure --disable-shared
    # shared build doesn't work because 'fz::simple_event<fz::timer_event_type, unsigned long long>::type()'
    # is not exportet correctly
    make
  done
}

package() {
  for _arch in ${_architectures}; do
    cd "${srcdir}/${_name}-${pkgver}/build-${_arch}"
    make DESTDIR="${pkgdir}" install
    find "${pkgdir}/usr/${_arch}" -name '*.exe' -exec ${_arch}-strip --strip-all {} \;
    find "${pkgdir}/usr/${_arch}" -name '*.dll' -exec ${_arch}-strip --strip-unneeded {} \;
    find "${pkgdir}/usr/${_arch}" -name '*.a'   -exec ${_arch}-strip -g {} \;
  done
}
