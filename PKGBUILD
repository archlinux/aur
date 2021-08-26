# Maintainer: xlwz <xlwzforever@outlook.com>

pkgname=mingw-w64-tk
_basever=8.6.11
_patch=.1
pkgver=${_basever}${_patch}
pkgrel=1
pkgdesc="A windowing toolkit for use with tcl (mingw-w64)"
arch=(any)
depends=(mingw-w64-crt mingw-w64-zlib mingw-w64-tcl)
makedepends=(mingw-w64-configure)
options=(staticlibs !strip !buildflags)
license=("custom")
url="http://tcl.sourceforge.io"
source=("http://downloads.sourceforge.net/sourceforge/tcl/tk${pkgver}-src.tar.gz"
        "tk-prevent-tclStubsPtr-segfault.patch"
        "tk-install-man.patch"
        "tk-fix-forbidden-colon-in-paths.patch"
        "tk-dont-link-shared-with-static-libgcc.patch")
sha256sums=('006cab171beeca6a968b6d617588538176f27be232a2b334a0e96173e89909be'
            '0029fde6782ce7635e9957412d3e36a7e76d304399d57d64a42818f93e705621'
            '8516749dd73c084ece7b9df6d1ba5708e652e8ba39cad59120c7f909f61747f0'
            '5347487af0e736dbb51425b22ed308840faf75b44c070623baa55f78dac3d053'
            'a16406e8519ab681bba0915e35b23a7f91cf978934b0a4ebdc7e949e87f0c877')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

prepare() {
  cd "${srcdir}/tk${_basever}"
  patch -Np1 -i "${srcdir}/tk-prevent-tclStubsPtr-segfault.patch"
  patch -Np1 -i "${srcdir}/tk-install-man.patch"
  patch -Np1 -i "${srcdir}/tk-fix-forbidden-colon-in-paths.patch"
  patch -Np1 -i "${srcdir}/tk-dont-link-shared-with-static-libgcc.patch"
  cd win && autoreconf -fi
}

build() {
  local enable64bit=
  [[ "${_arch}" = 'x86_64-w64-mingw32' ]] && enable64bit='--enable-64bit'
  cd "${srcdir}/tk${_basever}/win"
  for _arch in ${_architectures}; do
    mkdir -p build-${_arch} && pushd build-${_arch}
    ${_arch}-configure \
      --with-tcl=/usr/${_arch}/lib ${enable64bit}
    make
    popd
  done
}

package() {
  local debug_suffix=
  if check_option "debug" "y"; then
    debug_suffix="g"
  fi

	for _arch in ${_architectures}; do
    cd "${srcdir}/tk${_basever}/win/build-${_arch}"
    make -j1 install INSTALL_ROOT="$pkgdir"
    cp "${pkgdir}/usr/${_arch}/bin/wish86${debug_suffix}.exe" "${pkgdir}/usr/${_arch}/bin/wish.exe"
    find "${pkgdir}/usr/${_arch}" -name '*.def' -o -name '*.exp' | xargs -rtl1 rm
    find "${pkgdir}/usr/${_arch}" -name '*.sh' -o -name '*.dll' -o -name '*.exe' | xargs -rtl1 chmod 755

    ln -s "${pkgdir}/usr/${_arch}/lib/libtk86${debug_suffix}.dll.a" "${pkgdir}/usr/${_arch}/lib/libtk.dll.a"
    mkdir -p "${pkgdir}/usr/${_arch}/include/tk${_basever%.*}/tk-private/"{generic/ttk,win}

    cd ${srcdir}/tk${_basever}
    find generic win -name "*.h" -exec cp -p '{}' "${pkgdir}/usr/${_arch}"/include/tk${_basever%.*}/tk-private/'{}' ';'
    ( cd "${pkgdir}/usr/${_arch}/include"
      for header in *.h ; do
        cp -f ${header} ${pkgdir}/usr/${_arch}/include/tk${_basever%.*}/tk-private/generic/
      done
    )
    chmod a-x "${pkgdir}/usr/${_arch}/lib/"*/pkgIndex.tcl

    local _libver=${_basever%.*}
    _libver=${_libver//./}
    sed -i \
      -e "s|^\(TK_BUILD_LIB_SPEC\)='.*|\1='-Wl,/usr/${_arch}/lib/libtk${_libver}.dll.a'|" \
      -e "s|^\(TK_SRC_DIR\)='.*'|\1='/usr/${_arch}/include/tk${_basever%.*}/tk-private'|" \
      -e "s|^\(TK_BUILD_STUB_LIB_SPEC\)='.*|\1='-Wl,/usr/${_arch}/lib/libtkstub${_libver}.a'|" \
      -e "s|^\(TK_BUILD_STUB_LIB_PATH\)='.*|\1='/usr/${_arch}/lib/libtkstub${_libver}.a'|" \
      -e "s|^\(TK_STUB_LIB_SPEC\)='.*|\1='-L/usr/${_arch}/lib -ltkstub${_libver}'|" \
      ${pkgdir}/usr/${_arch}/lib/tkConfig.sh

    # Add missing entry to tkConfig.sh
    echo "# String to pass to the compiler so that an extension can" >> ${pkgdir}/usr/${_arch}/lib/tkConfig.sh
    echo "# find installed Tcl headers." >> ${pkgdir}/usr/${_arch}/lib/tkConfig.sh
    echo "TK_INCLUDE_SPEC='-I/usr/${_arch}/include/tk${_basever%.*}'" >> ${pkgdir}/usr/${_arch}/lib/tkConfig.sh

    rm "${pkgdir}/usr/${_arch}/lib/tk${_basever%.*}/tkAppInit.c"
  done

  cd ${srcdir}/tk${_basever}
  install -Dm644 license.terms "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
