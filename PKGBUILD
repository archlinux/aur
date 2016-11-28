pkgname=mingw-w64-tcl
pkgver=8.6.1
pkgrel=5
pkgdesc="The Tcl scripting language (mingw-w64)"
arch=(any)
depends=(mingw-w64-crt mingw-w64-zlib)
makedepends=(mingw-w64-gcc tcl)
options=(staticlibs !strip !buildflags)
license=("custom")
url="http://tcl.sourceforge.net"
source=("http://downloads.sourceforge.net/sourceforge/tcl/tcl${pkgver}-src.tar.gz"
"tcl-8.5.14-autopath.patch"
"tcl-8.5.14-hidden.patch"
"tcl-8.6.1-mingwexcept.patch"
"tcl-mingw-w64-compatibility.patch")
sha256sums=('16ee769248e64ba1cae6b4834fcc4e4edd7470d881410e8d58f7dd1434343514'
            '3cb435f768052acabe5b1fbef5ae9a8d0967b0f86f7695fb4bae8953ee470357'
            'a809617939336a0068c5dd567f2c25489b2824ca25ad20f9cbf4e74c81396d2e'
            '77b7509f3677fe659a70994f664444c1f0e99899bd3e73cba71caa4ccb24ebd4'
            '866fe923b7d43339bea8a8484299ba71ebdb3a7213508809f2adae4eff60a382')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

prepare() {
  cd "${srcdir}/tcl${pkgver}"
  patch -Np1 -i "${srcdir}/tcl-8.5.14-autopath.patch"
  patch -Np1 -i "${srcdir}/tcl-8.5.14-hidden.patch"
  patch -Np1 -i "${srcdir}/tcl-8.6.1-mingwexcept.patch"
  patch -Np0 -i "${srcdir}/tcl-mingw-w64-compatibility.patch"
}

build() {
  for _arch in ${_architectures}; do
		unset LDFLAGS
    mkdir -p "${srcdir}/${pkgname}-${pkgver}-build-${_arch}"
    cp -r "$srcdir/tcl$pkgver/"* "${srcdir}/${pkgname}-${pkgver}-build-${_arch}/"
    cd "${srcdir}/${pkgname}-${pkgver}-build-${_arch}"
    [ "${_arch}" = 'x86_64-w64-mingw32' ] && enable64bit='--enable-64bit'
    "${srcdir}"/${pkgname#mingw-w64-}${pkgver}/win/configure \
      --prefix=/usr/${_arch} \
      --build=$CHOST \
      --host=${_arch} $enable64bit
    make
  done
}

package() {
	for _arch in ${_architectures}; do
    cd "${srcdir}/${pkgname}-${pkgver}-build-${_arch}"
    make -j1 install INSTALL_ROOT="$pkgdir"
    rm "$pkgdir/usr/${_arch}/bin/zlib1.dll"
    find "$pkgdir/usr/${_arch}" -name '*.exe' -o -name '*.bat' -o -name '*.def' -o -name '*.exp' | xargs -rtl1 rm
    find "$pkgdir/usr/${_arch}" -name '*.dll' | xargs -rtl1 ${_arch}-strip --strip-unneeded
    find "$pkgdir/usr/${_arch}" -name '*.a' -o -name '*.dll' | xargs -rtl1 ${_arch}-strip -g
    find "$pkgdir/usr/${_arch}" -name '*.sh' | xargs -rtl1 chmod 755
    find "$pkgdir/usr/${_arch}" -name '*.sh' | xargs -rtl1 sed -i "s,libtcl86.a,libtcl86.dll.a,g"
    rm -r "$pkgdir/usr/${_arch}/"{man,share}
    sed -e "s#${srcdir}/tcl${pkgver}/win#/usr/lib#" \
      -e "s#${srcdir}/tcl${pkgver}#/usr/${_arch}/include/tcl-private#" \
      -i "${pkgdir}/usr/${_arch}/lib/tclConfig.sh"
		sed -e "s#${srcdir}/tcl${pkgver}/win/pkgs/tdbc1.0.0#/usr/${_arch}/lib/tdbc1.0.0#" \
				-e "s#${srcdir}/tcl${pkgver}/pkgs/tdbc1.0.0/generic#/usr/${_arch}/include#" \
				-e "s#${srcdir}/tcl${pkgver}/pkgs/tdbc1.0.0/library#/usr/${_arch}/lib/tcl${pkgver%.*}#" \
				-e "s#${srcdir}/tcl${pkgver}/pkgs/tdbc1.0.0#/usr/${_arch}/include#" \
				-i "${pkgdir}/usr/${_arch}/lib/tdbc1.0.0/tdbcConfig.sh"
		sed -e "s#${srcdir}/tcl${pkgver}/win/pkgs/itcl4.0.0#/usr/${_arch}/lib/itcl4.0.0#" \
				-e "s#${srcdir}/tcl${pkgver}/pkgs/itcl4.0.0/generic#/usr/${_arch}/include/tcl-private#" \
				-e "s#${srcdir}/tcl${pkgver}/pkgs/itcl4.0.0#/usr/${_arch}/include/tcl-private#" \
				-i "${pkgdir}/usr/${_arch}/lib/itcl4.0.0/itclConfig.sh"
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
  done
}

# vim:set ts=2 sw=2 et:
