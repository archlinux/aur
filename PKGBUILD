pkgname=mingw-w64-pangomm
pkgver=2.40.1
pkgrel=1
pkgdesc="C++ bindings for Pango (mingw-w64)"
arch=('any')
url="https://www.gtkmm.org/"
license=('LGPL')
makedepends=('mingw-w64-configure')
depends=('mingw-w64-pango' 'mingw-w64-glibmm' 'mingw-w64-cairomm')
options=('!strip' '!buildflags' 'staticlibs')
source=("https://download.gnome.org/sources/pangomm/${pkgver%.*}/pangomm-${pkgver}.tar.xz")
md5sums=('874eadd9434613dbacf0272c82c3ac23')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

prepare() {
  cd "${srcdir}/pangomm-${pkgver}"
  sed -i -e "s,AC_DISABLE_STATIC,AC_DISABLE_STATIC\nlt_cv_deplibs_check_method='pass_all'," configure.ac
  autoconf --force
}

build() {
  CPPFLAGS+=" -D_REENTRANT"
  cd "${srcdir}/pangomm-$pkgver/"
  for _arch in ${_architectures}; do
    mkdir -p build-${_arch} && pushd build-${_arch}
    ${_arch}-configure \
    --disable-documentation \
    ..
    make
    popd
  done
}

package() {
  for _arch in ${_architectures}; do
    cd "${srcdir}/pangomm-$pkgver/build-${_arch}"
    make DESTDIR="${pkgdir}" install
    ${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/bin/*.dll
    ${_arch}-strip -g "$pkgdir"/usr/${_arch}/lib/*.a
  done
}
