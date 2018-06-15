pkgname=mingw-w64-tcl
pkgver=8.6.8
pkgrel=1
pkgdesc="The Tcl scripting language (mingw-w64)"
arch=(any)
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
        "009-fix-using-gnu-print.patch"
        "010-dont-link-shared-with--static-libgcc.patch")
sha256sums=('c43cb0c1518ce42b00e7c8f6eaddd5195c53a98f94adc717234a65cbcfd3f96a'
            'cfcf9b3816f8bb063b514ac7f63a5ba73108f27e16fdf8e8312dc5f0683083f6'
            '70bf0d8e84985f4e8ee63447ad37d5e50376eaf35ace51112761cacbbd596c4c'
            '931485d71969096c1d03c8bed24fae3922d143fe50820d913e2567492ad6ac41'
            '2b0f41f6704aa964dbfafa0a65dd5ce0ab97e82ff5cbbe2a95a2e8d644cc5550'
            '5c0162fbb018c03b3e4b907bd0098ab5282314bc212e3929a0416126637e1350'
            'f1833c3164229b017417d2ab2ce4cb066252fc1ad256de2313f0239481c7cc37'
            '3ec2702efb1be6873d6ffd2ffb357637588f835f8817ae65cf0373020fcc7359'
            '9c66ffe2de1d543f5291367d562ed5ee94e7e67345b281605788d7d9e02b8e7b'
            '2cd861f04321622722c87f7247a0586e547e4daf95a7dfe94ecd2cbfe45c37fd')


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
  patch -Np1 -i "${srcdir}/010-dont-link-shared-with--static-libgcc.patch"
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
		sed -e "s#${srcdir}/tcl${pkgver}/win/pkgs/tdbc1.0.6#/usr/${_arch}/lib/tdbc1.0.6#" \
				-e "s#${srcdir}/tcl${pkgver}/pkgs/tdbc1.0.6/generic#/usr/${_arch}/include#" \
				-e "s#${srcdir}/tcl${pkgver}/pkgs/tdbc1.0.6/library#/usr/${_arch}/lib/tcl${pkgver%.*}#" \
				-e "s#${srcdir}/tcl${pkgver}/pkgs/tdbc1.0.6#/usr/${_arch}/include#" \
				-i "${pkgdir}/usr/${_arch}/lib/tdbc1.0.6/tdbcConfig.sh"
		sed -e "s#${srcdir}/tcl${pkgver}/win/pkgs/itcl4.1.1#/usr/${_arch}/lib/itcl4.1.1#" \
				-e "s#${srcdir}/tcl${pkgver}/pkgs/itcl4.1.1/generic#/usr/${_arch}/include/tcl-private#" \
				-e "s#${srcdir}/tcl${pkgver}/pkgs/itcl4.1.1#/usr/${_arch}/include/tcl-private#" \
				-i "${pkgdir}/usr/${_arch}/lib/itcl4.1.1/itclConfig.sh"
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
