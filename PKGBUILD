# Maintainer: xlwz <xlwzforever@outlook.com>

pkgname=mingw-w64-tcl
pkgver=8.6.11
pkgrel=1
pkgdesc="The Tcl scripting language (mingw-w64)"
arch=('any')
depends=(mingw-w64-crt mingw-w64-zlib)
makedepends=(mingw-w64-configure tcl)
options=(staticlibs !strip !buildflags)
license=("custom")
url="http://tcl.sourceforge.net"
source=("http://downloads.sourceforge.net/sourceforge/tcl/tcl${pkgver}-src.tar.gz"
        "001-fix-relocation.patch"
        "002-fix-forbidden-colon-in-paths.mingw.patch"
        "004-use-system-zlib.mingw.patch"
        "005-no-xc.mingw.patch"
        "007-install.mingw.patch"
        "008-tcl-8.5.14-hidden.patch"
        "009-fix-using-gnu-print.patch")
sha256sums=('8c0486668586672c5693d7d95817cb05a18c5ecca2f40e2836b9578064088258'
            'cfcf9b3816f8bb063b514ac7f63a5ba73108f27e16fdf8e8312dc5f0683083f6'
            '70bf0d8e84985f4e8ee63447ad37d5e50376eaf35ace51112761cacbbd596c4c'
            '2d7581ad118c01afcebd762051eb74fe31511e8b40505554068f126bcd8d5d9f'
            '2b0f41f6704aa964dbfafa0a65dd5ce0ab97e82ff5cbbe2a95a2e8d644cc5550'
            '61d3430f82ee60000eab28758eba9663a747b1e79082758cb59e624aead6c517'
            '3ec2702efb1be6873d6ffd2ffb357637588f835f8817ae65cf0373020fcc7359'
            '894afd1d97c25a2f7b21981810026450d44677a46ba07a32c4025783d027c6d7')


_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

prepare() {
  cd "${srcdir}/tcl${pkgver}"
  patch -Np1 -i "${srcdir}/001-fix-relocation.patch"
  patch -Np1 -i "${srcdir}/002-fix-forbidden-colon-in-paths.mingw.patch"
  patch -Np1 -i "${srcdir}/004-use-system-zlib.mingw.patch"
  patch -Np1 -i "${srcdir}/005-no-xc.mingw.patch"
  patch -Np1 -i "${srcdir}/007-install.mingw.patch"
  patch -Np1 -i "${srcdir}/008-tcl-8.5.14-hidden.patch"
  patch -Np1 -i "${srcdir}/009-fix-using-gnu-print.patch"
  
  # Using the static libgcc library is problematic when sharing
  # resources across dynamic link libraries, so we must use
  # libgcc*.dll everywhere:
  echo "Removing -static-libgcc from configure files"
  find "${srcdir}/tcl${pkgver}" -type f \( -name "tcl.m4" -o -name "configure*" \) -print0 | xargs -0 sed -i 's/-static-libgcc//g'
}

build() {
  for _arch in ${_architectures}; do
    unset LDFLAGS
    mkdir -p "${srcdir}/${pkgname}-${pkgver}-build-${_arch}"
    cp -r "$srcdir/tcl$pkgver/"* "${srcdir}/${pkgname}-${pkgver}-build-${_arch}/"
    pushd "${srcdir}/${pkgname}-${pkgver}-build-${_arch}"
    [ "${_arch}" = 'x86_64-w64-mingw32' ] && enable64bit='--enable-64bit'
    ${_arch}-configure \
      --enable-threads $enable64bit ../tcl${pkgver}/win
    make
    popd
  done
}

package() {
  local _odbc_ver=1.1.2
  local _itcl_ver=4.2.1

  for _arch in ${_architectures}; do
    cd "${srcdir}/${pkgname}-${pkgver}-build-${_arch}"
    make -j1 install INSTALL_ROOT="$pkgdir"
    find "$pkgdir/usr/${_arch}" -name '*.exe' -o -name '*.bat' -o -name '*.def' -o -name '*.exp' | xargs -rtl1 rm
    find "$pkgdir/usr/${_arch}" -name '*.dll' | xargs -rtl1 ${_arch}-strip --strip-unneeded
    find "$pkgdir/usr/${_arch}" -name '*.a' -o -name '*.dll' | xargs -rtl1 ${_arch}-strip -g
    find "$pkgdir/usr/${_arch}" -name '*.sh' | xargs -rtl1 chmod 755
    find "$pkgdir/usr/${_arch}" -name '*.sh' | xargs -rtl1 sed -i "s,libtcl86.a,libtcl86.dll.a,g"
    rm -r "$pkgdir/usr/${_arch}/"share
    sed -e "s#${srcdir}/tcl${pkgver}/win#/usr/lib#" \
      -e "s#${srcdir}/tcl${pkgver}#/usr/${_arch}/include/tcl-private#" \
      -i "${pkgdir}/usr/${_arch}/lib/tclConfig.sh"
        sed -e "s#${srcdir}/tcl${pkgver}/win/pkgs/tdbc${_odbc_ver}#/usr/${_arch}/lib/tdbc${_odbc_ver}#" \
      -e "s#${srcdir}/tcl${pkgver}/pkgs/tdbc${_odbc_ver}/generic#/usr/${_arch}/include#" \
        -e "s#${srcdir}/tcl${pkgver}/pkgs/tdbc${_odbc_ver}/library#/usr/${_arch}/lib/tcl${pkgver%.*}#" \
        -e "s#${srcdir}/tcl${pkgver}/pkgs/tdbc${_odbc_ver}#/usr/${_arch}/include#" \
        -i "${pkgdir}/usr/${_arch}/lib/tdbc${_odbc_ver}/tdbcConfig.sh"
    sed -e "s#${srcdir}/tcl${pkgver}/win/pkgs/itcl${_itcl_ver}#/usr/${_arch}/lib/itcl${_itcl_ver}#" \
        -e "s#${srcdir}/tcl${pkgver}/pkgs/itcl${_itcl_ver}/generic#/usr/${_arch}/include/tcl-private#" \
        -e "s#${srcdir}/tcl${pkgver}/pkgs/itcl${_itcl_ver}#/usr/${_arch}/include/tcl-private#" \
        -i "${pkgdir}/usr/${_arch}/lib/itcl${_itcl_ver}/itclConfig.sh"
    ln -s "/usr/${_arch}/lib/libtcl86.dll.a" "$pkgdir/usr/${_arch}/lib/libtcl.dll.a"
    ln -s /usr/${_arch}/lib/tclConfig.sh "${pkgdir}/usr/${_arch}/lib/tcl${pkgver%.*.*}/tclConfig.sh"
    mkdir -p "${pkgdir}/usr/${_arch}/include/tcl-private/"{generic,win}
    find generic win -name "*.h" -exec cp -p '{}' "${pkgdir}"/usr/${_arch}/include/tcl-private/'{}' ';'
    ( cd "${pkgdir}/usr/${_arch}/include"
      for i in *.h ; do
        [ -f "${pkgdir}/usr/${_arch}/include/tcl-private/generic/$i" ] && ln -sf ../../$i "${pkgdir}/usr/${_arch}/include/tcl-private/generic" ;
      done
    ) || true
    chmod a-x "${pkgdir}/usr/${_arch}/lib/tcl${pkgver%.*}/encoding/"*.enc
    chmod a-x "${pkgdir}/usr/${_arch}/lib/"*/pkgIndex.tcl

    install -Dm644 ${srcdir}/tcl${pkgver}/win/tcl.m4 ${pkgdir}/usr/${_arch}/share/aclocal/tcl${pkgver%.*}.m4

    mv ${pkgdir}/usr/${_arch}/bin/sqlite3_analyzer{,.sh}

  done

  cd "${srcdir}/tcl${pkgver}"
  install -Dm644 license.terms "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et:
