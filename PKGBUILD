# Contributor: Rod Kay   <charlie5 on #ada at freenode.net>

pkgname=asis
pkgver=2015
pkgrel=2
pkgdesc="Allows Ada programs access to the syntactic and semantic structure of source code. Also provides extra tools such as gnatpp."

arch=(i686 x86_64)
url=http://libre.adacore.com/tools/$_pkgname
license=(GPL)
groups=(gcc-ada)

depends=(gcc-ada gnat_util gnat-gps)

provides=($pkgname)
conflicts=($pkgname)

source=(http://downloads.dragonlace.net/src/$pkgname-gpl-$pkgver-src.tar.gz
        asis.gpr
        patch-Makefile.stub
        patch-a4g-a_opt.ads
        patch-a4g-a_opt.adb)

md5sums=('2c5a1f382bbf644bcdd2e6417f6d1e60'
         '223d59aadef66852e7f0493bf6b01fee'
         '91e1338160c413a06031a547b4f84338'
         '4608269e4e5bdd57cf8eabb2dc5c0041'
         '210cbc83474488ebcfd9b72d1ccc3e43')


prepare()
{
    WRKSRC=$srcdir/$pkgname-gpl-$pkgver-src

    sed -i  -e 's|OPSYS|ASISOPSYS|g'              \
            -e 's|(prefix)|(DESTDIR)$$(prefix)|g' \
            ${WRKSRC}/Makefile                    \
            ${WRKSRC}/Makefile.stub               \
            ${WRKSRC}/common.gpr

    rm -rf  ${WRKSRC}/gnat

    cd $WRKSRC
    patch -p0 -i ../patch-Makefile.stub
    patch -p0 -i ../patch-a4g-a_opt.ads
    patch -p0 -i ../patch-a4g-a_opt.adb
}



build() 
{
    cd $srcdir/$pkgname-gpl-$pkgver-src

    make all
    make tools
}



package() 
{
    cd $srcdir/$pkgname-gpl-$pkgver-src

#    make install prefix=$pkgdir/usr

	# gprinstall seems to be malfunctioning, just install manually
        #
        PREFIX=/usr
        DOCSDIR=/usr/share/doc/asis/
        INSTALL_PROGRAM=install
        INSTALL_DATA=install
        WRKSRC=$srcdir/$pkgname-gpl-$pkgver-src
        FILESDIR=$srcdir/$pkgname-gpl-$pkgver-src

	mkdir -p ${pkgdir}${PREFIX}/bin \
		 ${pkgdir}${PREFIX}/include/asis \
		 ${pkgdir}${PREFIX}/lib/asis \
		 ${pkgdir}${PREFIX}/lib/gnat \
		 ${pkgdir}${PREFIX}/share/gps/plug-ins \
		 ${pkgdir}${DOCSDIR}/html \
		 ${pkgdir}${DOCSDIR}/pdf

	${INSTALL_PROGRAM} ${WRKSRC}/tools/asistant/asistant 		${pkgdir}${PREFIX}/bin
	${INSTALL_PROGRAM} ${WRKSRC}/tools/gnatpp/gnatpp 	${pkgdir}${PREFIX}/bin

	${INSTALL_DATA} ${WRKSRC}/asis/*.ad[bs] 		${pkgdir}${PREFIX}/include/asis
	${INSTALL_DATA} ${WRKSRC}/lib/*.ali                     ${pkgdir}${PREFIX}/lib/asis
	${INSTALL_DATA} ${WRKSRC}/lib/*.a                       ${pkgdir}${PREFIX}/lib/asis
	${INSTALL_DATA} ${WRKSRC}/documentation/*.html 		${pkgdir}${DOCSDIR}/html
	${INSTALL_DATA} ${WRKSRC}/documentation/*.pdf 		${pkgdir}${DOCSDIR}/pdf
	${INSTALL_DATA} ${WRKSRC}/documentation/*.txt 		${pkgdir}${DOCSDIR}
	${INSTALL_DATA} ${WRKSRC}/documentation/asis.xml        ${pkgdir}${PREFIX}/share/gps/plug-ins
	${INSTALL_DATA} $srcdir/asis.gpr                        ${pkgdir}${PREFIX}/lib/gnat
	${INSTALL_DATA} ${FILESDIR}/common.gpr                  ${pkgdir}${PREFIX}/lib/gnat
}
