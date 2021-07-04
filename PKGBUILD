# Maintainer: Ivan Puntiy <ivan.puntiy-at-gmail>
# Contributor: Schala

pkgname=mingw-w64-wxmsw3.1
epoch=1
pkgver=3.1.5
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
sha1sums=('725455d6324baa808259b56a42199237327e0638')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

# linking 64-bit shared libraries fails for me for an unknown reason, and I'm not sure if the problem is with compiler or my environment
# uncomment the following line to skip building it, if needed
# _skip_shared_64bit=aye

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
    if [[ -z "$_skip_shared_64bit" || ! ( $_arch =~ "x86_64" ) ]]; then
      mkdir -p build-shared-${_arch} && pushd build-shared-${_arch}
      ${_arch}-configure --disable-option-checking ${_build_flags} --enable-shared --enable-monolithic
      make
      popd
    fi

    # static build
    mkdir -p build-static-${_arch} && pushd build-static-${_arch}
    ${_arch}-configure --disable-option-checking ${_build_flags} --disable-shared
    make
    popd
  done
}

package() {
  mkdir -p "${pkgdir}/usr/bin"
  for _arch in ${_architectures}; do
    for _build in "shared" "static"; do
      if [[ -z "$_skip_shared_64bit" || $_build == "static" || ! ( $_arch =~ "x86_64" ) ]]; then
        cd "${srcdir}/wxWidgets-${pkgver}/build-${_build}-${_arch}"
        make DESTDIR="${pkgdir}" install
      fi
    done

    # mv "${pkgdir}/usr/${_arch}/lib/"*.dll "${pkgdir}/usr/${_arch}/bin" # appears to already be in the correct location
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
