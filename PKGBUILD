# Maintainer: Ivan Puntiy <ivan.puntiy-at-gmail>
# Contributor: Schala

pkgname=mingw-w64-wxmsw3.1
epoch=1
pkgver=3.1.2
_shortver=3.1
pkgrel=1
pkgdesc="Win32 implementation of wxWidgets API for GUI (development branch, mingw-w64)"
arch=(any)
url="http://wxwidgets.org"
license=("custom:wxWindows")
makedepends=(mingw-w64-configure)
depends=(mingw-w64-crt mingw-w64-expat mingw-w64-libpng mingw-w64-libjpeg-turbo mingw-w64-libtiff)
options=(staticlibs !strip !buildflags)
source=("https://github.com/wxWidgets/wxWidgets/releases/download/v${pkgver}/wxWidgets-${pkgver}.tar.bz2")
sha256sums=('4cb8d23d70f9261debf7d6cfeca667fc0a7d2b6565adb8f1c484f9b674f1f27a')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

# HACK: wxWidgets' configure script chokes at '--enable-static' from ${_arch}-configure
# this function body is equivalent to 'mingw-w64-configure=0.1-1'
_configure() {
  mingw_c_flags="-O2 -g -pipe -Wall -Wp,-D_FORTIFY_SOURCE=2 -fexceptions --param=ssp-buffer-size=4"
  LDFLAGS=""
  export CFLAGS="$mingw_c_flags $CFLAGS"
  export CXXFLAGS="$mingw_c_flags $CXXFLAGS"
  ../configure --host=${_arch} --target=${_arch} --build="$CHOST" \
    --prefix=/usr/${_arch} --libdir=/usr/${_arch}/lib --includedir=/usr/${_arch}/include \
    "$@"
}

build() {
  local _build_flags="\
        --with-msw \
        --with-opengl \
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
  # looks like this was fixed, uncomment if needed
  # _build_flags="${_build_flags} LDFLAGS=-Wl,--allow-multiple-definition"

  cd "${srcdir}/wxWidgets-${pkgver}"
  for _arch in ${_architectures}; do
    # shared build
    mkdir -p build-shared-${_arch} && pushd build-shared-${_arch}
    # ${_arch}-configure ${_build_flags} --enable-monolithic ..
    _configure ${_build_flags} --enable-shared --enable-monolithic
    make
    popd

    # static build
    mkdir -p build-static-${_arch} && pushd build-static-${_arch}
    # ${_arch}-configure ${_build_flags} --disable-shared ..
    _configure ${_build_flags} --disable-shared
    make
    popd
  done
}

package() {
  mkdir -p "${pkgdir}/usr/bin"
  for _arch in ${_architectures}; do
    for _build in "shared" "static"; do
      cd "${srcdir}/wxWidgets-${pkgver}/build-${_build}-${_arch}"
      make DESTDIR="${pkgdir}" install
    done

    mv "${pkgdir}/usr/${_arch}/lib/"*.dll "${pkgdir}/usr/${_arch}/bin"
    find "${pkgdir}/usr/${_arch}" -name '*.exe' | xargs -rtl1 rm
    find "${pkgdir}/usr/${_arch}" -name '*.dll' | xargs -rtl1 ${_arch}-strip --strip-unneeded
    find "${pkgdir}/usr/${_arch}" -name '*.a' -o -name '*.dll' | xargs -rtl1 ${_arch}-strip -g

    ln -s "/usr/${_arch}/lib/wx/config/${_arch}-msw-unicode-${_shortver}" "${pkgdir}/usr/bin/${_arch}-wx-config-${_shortver}"

    # conflicts with stable package
    mv "${pkgdir}/usr/${_arch}/bin/wx-config"{,-${_shortver}}
    rm -r "${pkgdir}/usr/${_arch}/share"

    # rm "${pkgdir}/usr/${_arch}/bin/wxrc-3.1"
  done
}
