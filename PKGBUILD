pkgname=mingw-w64-tcl
pkgver=8.6.9
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
        "006-proper-implib-name.mingw.patch"
        "007-install.mingw.patch"
        "008-tcl-8.5.14-hidden.patch"
        "009-fix-using-gnu-print.patch")
sha256sums=('ad0cd2de2c87b9ba8086b43957a0de3eb2eb565c7159d5f53ccbba3feb915f4e'
            'cfcf9b3816f8bb063b514ac7f63a5ba73108f27e16fdf8e8312dc5f0683083f6'
            '70bf0d8e84985f4e8ee63447ad37d5e50376eaf35ace51112761cacbbd596c4c'
            '01bf81675bb189314be5e024f58d20aafb3d2a35c1d2c4353045bbebd1e7a926'
            '2b0f41f6704aa964dbfafa0a65dd5ce0ab97e82ff5cbbe2a95a2e8d644cc5550'
            '5c0162fbb018c03b3e4b907bd0098ab5282314bc212e3929a0416126637e1350'
            'f1833c3164229b017417d2ab2ce4cb066252fc1ad256de2313f0239481c7cc37'
            '3ec2702efb1be6873d6ffd2ffb357637588f835f8817ae65cf0373020fcc7359'
            'e49a314ff0262e487f15fa1cb6253e22e25e8b18dad0b057d600e833efa947a7')


_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

prepare() {
  cd "${srcdir}/tcl${pkgver}"
  patch -Np1 -i "${srcdir}/001-fix-relocation.patch"
  patch -Np1 -i "${srcdir}/002-fix-forbidden-colon-in-paths.mingw.patch"
  patch -Np1 -i "${srcdir}/004-use-system-zlib.mingw.patch"
  patch -Np1 -i "${srcdir}/005-no-xc.mingw.patch"
  patch -Np1 -i "${srcdir}/006-proper-implib-name.mingw.patch"
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
        sed -e "s#${srcdir}/tcl${pkgver}/win/pkgs/tdbc1.1.0#/usr/${_arch}/lib/tdbc1.1.0#" \
      -e "s#${srcdir}/tcl${pkgver}/pkgs/tdbc1.1.0/generic#/usr/${_arch}/include#" \
        -e "s#${srcdir}/tcl${pkgver}/pkgs/tdbc1.1.0/library#/usr/${_arch}/lib/tcl${pkgver%.*}#" \
        -e "s#${srcdir}/tcl${pkgver}/pkgs/tdbc1.1.0#/usr/${_arch}/include#" \
        -i "${pkgdir}/usr/${_arch}/lib/tdbc1.1.0/tdbcConfig.sh"
    sed -e "s#${srcdir}/tcl${pkgver}/win/pkgs/itcl4.1.2#/usr/${_arch}/lib/itcl4.1.2#" \
        -e "s#${srcdir}/tcl${pkgver}/pkgs/itcl4.1.2/generic#/usr/${_arch}/include/tcl-private#" \
        -e "s#${srcdir}/tcl${pkgver}/pkgs/itcl4.1.2#/usr/${_arch}/include/tcl-private#" \
        -i "${pkgdir}/usr/${_arch}/lib/itcl4.1.2/itclConfig.sh"
    mv "$pkgdir/usr/${_arch}/lib/libtcl86.a" "$pkgdir/usr/${_arch}/lib/libtcl86.dll.a"
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
}

# vim:set ts=2 sw=2 et:
