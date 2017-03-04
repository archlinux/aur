# Maintainer: Ivan Puntiy <ivan.puntiy-at-gmail>
# Contributor: Schala

pkgname=mingw-w64-wxmsw
epoch=1
pkgver=3.0.2
pkgrel=3
pkgdesc="Win32 implementation of wxWidgets API for GUI (mingw-w64)"
arch=(any)
url="http://wxwidgets.org"
license=("custom:wxWindows")
makedepends=(mingw-w64-configure)
depends=(mingw-w64-crt mingw-w64-expat mingw-w64-libpng mingw-w64-libjpeg-turbo mingw-w64-libtiff)
options=(staticlibs !strip !buildflags)
conflicts=(mingw-w64-wxmsw2.9 mingw-w64-wxmsw-static)
provides=(mingw-w64-wxmsw2.9 mingw-w64-wxmsw-static)
source=(
  "http://downloads.sourceforge.net/wxwindows/wxWidgets-${pkgver}.tar.bz2"
  'PR222.patch' # https://github.com/wxWidgets/wxWidgets/pull/222
)
sha256sums=('346879dc554f3ab8d6da2704f651ecb504a22e9d31c17ef5449b129ed711585d'
            'aa13c5ce05e9cadea464d09c7a49de51f66db6c3f1871edc533230a51948ee0f')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

prepare() {
  cd "${srcdir}/wxWidgets-${pkgver}/"

  # fix errors with GCC 6
  patch -p1 -i "${srcdir}/PR222.patch"
}

build() {
  local _build_flags="\
    	--with-msw \
    	--with-opengl \
    	--disable-mslu \
    	--enable-unicode \
    	--with-regex=builtin \
    	--disable-precomp-headers \
    	--enable-graphics_ctx \
    	--enable-webview \
    	--enable-mediactrl \
    	--with-libpng=sys \
    	--with-libxpm=builtin \
    	--with-libjpeg=sys \
    	--with-libtiff=sys"

  # Fix for current libuuid.a issues
  # see: https://github.com/Alexpux/MINGW-packages/issues/1761
  _build_flags="${_build_flags} LDFLAGS=-Wl,--allow-multiple-definition"

  cd "${srcdir}/wxWidgets-${pkgver}"
  for _arch in ${_architectures}; do
    # shared build
    mkdir -p build-shared-${_arch} && pushd build-shared-${_arch}
    ${_arch}-configure ${_build_flags} --enable-monolithic ..
    make
    popd

    # static build
    mkdir -p build-static-${_arch} && pushd build-static-${_arch}
    ${_arch}-configure ${_build_flags} --disable-shared ..
    make
    popd
  done
}

package() {
  mkdir -p "${pkgdir}/usr/bin"
  for _arch in ${_architectures}; do
    for _build in shared static; do
      cd "${srcdir}/wxWidgets-${pkgver}/build-${_build}-${_arch}"
      make DESTDIR="${pkgdir}" install
    done

    mv "${pkgdir}/usr/${_arch}/lib/"*.dll "${pkgdir}/usr/${_arch}/bin/"
    ${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/bin/*.dll
    ${_arch}-strip -g "$pkgdir"/usr/${_arch}/lib/*.a

    ln -s "/usr/${_arch}/lib/wx/config/${_arch}-msw-unicode-${pkgver%.*}" \
       "$pkgdir/usr/bin/${_arch}-wx-config"
    
    # rm "${pkgdir}/usr/${_arch}/bin/"*.exe
    # rm "$pkgdir/usr/${_arch}/bin/wxrc-3.0"
    # rm -r "$pkgdir/usr/${_arch}/share"
  done
}
