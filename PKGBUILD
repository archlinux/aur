pkgname=mingw-w64-hqp
pkgver=1.9.8
pkgrel=1
pkgdesc="A solver for sparse nonlinear optimization (mingw-w64)"
arch=('any')
url="http://omuses.github.io/hqp"
license=('LGPL2')
depends=('mingw-w64-tcl')
makedepends=('mingw-w64-gcc')
options=('!buildflags' 'staticlibs' '!strip')
source=("https://github.com/omuses/hqp/archive/v${pkgver}.tar.gz"
        theinterp.patch)
sha256sums=('46a0fe3721ec1192279594c321e8d33a72e0ff5cf9a1c868aa199e8ea743d103'
            SKIP)

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"


prepare() {
  cd "${srcdir}/hqp-${pkgver}"
  sed -i 's|SHLIB_SUFFIX=".so"|SHLIB_SUFFIX=".dll"|g' configure

  sed -i 's|MES_DEFS=""|MES_DEFS="-DMESCH_API=__declspec\\(dllexport\\)"|g' configure
  sed -i 's|IF_DEFS=""|IF_DEFS="-DIF_API=__declspec\\(dllexport\\)"|g' configure
  sed -i 's|HQP_DEFS=""|HQP_DEFS="-DHQP_API=__declspec\\(dllexport\\)"|g' configure
  sed -i 's|OMU_DEFS=""|OMU_DEFS="-DOMU_API=__declspec\\(dllexport\\)"|g' configure
  sed -i 's|ODC_DEFS=""|ODC_DEFS="-DMESCH_API=__declspec\\(dllexport\\) -DIF_API=__declspec\\(dllexport\\) -DHQP_API=__declspec\\(dllexport\\) -DOMU_API=__declspec\\(dllexport\\)"|g' configure

  # fix undefined references to theInterp
  patch -p1 -i "${srcdir}"/theinterp.patch

  # generate import libs
  sed -i "s|\$(MKLIB_SUFFIX) \$(OBJS)|\$(MKLIB_SUFFIX) \$(OBJS) -Wl,--out-implib,\$(LIB_PREFIX)\$(LIBRARY).dll.a|g" omu/Makefile hqp/Makefile
}

build() {
#   cd "${srcdir}/hqp-${pkgver}"
  for _arch in ${_architectures}; do
    # does not support out-of-source builds
    rm -rf "${srcdir}"/hqp-${pkgver}-build-${_arch}
    cp -r "${srcdir}"/hqp-${pkgver} "${srcdir}"/hqp-${pkgver}-build-${_arch}
    pushd "${srcdir}"/hqp-${pkgver}-build-${_arch}

    # cannot use mingw-w64-configure
    export CFLAGS="-O2 -g -pipe -Wall -Wp,-D_FORTIFY_SOURCE=2 -fexceptions --param=ssp-buffer-size=4"
    export CXXFLAGS=${CFLAGS}
    ./configure --host=${_arch} --prefix=/usr/${_arch}-mingw32 --enable-shared --with-tcl=/usr/${_arch}/lib --with-tclinclude=/usr/${_arch}/include --target=MINGW64 --disable-gmalloc

    # run through wine
    sed -i "s|./tpc -ts 80|${_arch}-wine ./tpc -ts 80|g" hqp/Makefile
    sed -i "s|../hqp/tpc -ts 80|${_arch}-wine ../hqp/tpc -ts 80|g" omu/Makefile

    make TCL_STUB_LIB=/usr/${_arch}/lib/libtclstub86.a CC=${_arch}-gcc SHLIB_SUFFIX='.dll'
    popd
  done
}

package() {
  for _arch in ${_architectures}; do
    cd "${srcdir}/hqp-${pkgver}-build-${_arch}"
    make INSTALL_PREFIX="${pkgdir}"/usr/${_arch} install
    install -d "$pkgdir"/usr/${_arch}/bin/
    mv "$pkgdir"/usr/${_arch}/lib/*.dll "$pkgdir"/usr/${_arch}/bin/
    cp lib/*.dll.a "$pkgdir"/usr/${_arch}/lib/
    ${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/bin/*.dll
    ${_arch}-strip -g "$pkgdir"/usr/${_arch}/lib/*.a
  done
}
