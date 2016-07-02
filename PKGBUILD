# Contributor: Patrick Kelly <kameo76890 at gmail dot com>
# Contributor: Georgios  Tsalikis <aliverius somewhere near tsalikis and a net>
# Contributor: Rod Kay <charlie5 on #ada at freenode.net>

pkgname=xmlada
pkgver=2016
pkgrel=1
pkgdesc="A full XML suite for Ada"

arch=('i686' 'x86_64')
url="http://libre.adacore.com/libre/tools/xmlada/"
license=('GPL')

depends=("gcc-ada")

source=(http://mirrors.cdn.adacore.com/art/57399978c7a447658e0affc0
        Makefile.archy
        generic_gpr.in)

md5sums=('631957d2f55277f1d58a68186fbf5022'
         '6f4761c7b3374c27828ba573f0463069'
         'cde06f485e180f4cc82bcdb450d36153')


GREP=grep
AWK=gawk
ECHO=echo
SORT=sort
MKDIR=mkdir
INSTALL_DATA=install
INSTALL_SCRIPT=install
RM=rm
FIND=find
PRINTF=printf
SED=sed
REINPLACE_CMD=sed


prepare()
{
  WRKSRC=$srcdir/$pkgname-gpl-$pkgver-src
  FILESDIR=$srcdir

  DUNICODE=$WRKSRC/unicode/dummy_unicode.adb
  DINPSRC=${WRKSRC}/input_sources/dummy_input_sources.adb
  DSAX=${WRKSRC}/sax/dummy_sax.adb
  DDOM=${WRKSRC}/dom/dummy_dom.adb
  DSCHEMA=${WRKSRC}/schema/dummy_schema.adb

  cd $srcdir/$pkgname-gpl-$pkgver-src

  # dummy-unicode:
	${GREP}  --no-filename  ^package ${WRKSRC}/unicode/unicode-*.ads | \
		${AWK} '{print "with " $$2 ";"}' | ${SORT} > ${DUNICODE}
	${ECHO} 'procedure dummy_unicode is' >> ${DUNICODE}
	${ECHO} 'begin' >> ${DUNICODE}
	${ECHO} '   null;' >> ${DUNICODE}
	${ECHO} 'end dummy_unicode;' >> ${DUNICODE}

    sed 's/ is;/;/g' ${DUNICODE} > tmp
    sed 's/with package/with/g' tmp > ${DUNICODE}

  # dummy-input_sources:
	${GREP}  --no-filename   ^package ${WRKSRC}/input_sources/input_sources-*.ads | \
		${AWK} '{print "with " $$2 ";"}' | ${SORT} > ${DINPSRC}
	${ECHO} 'procedure dummy_input_sources is' >> ${DINPSRC}
	${ECHO} 'begin' >> ${DINPSRC}
	${ECHO} '   null;' >> ${DINPSRC}
	${ECHO} 'end dummy_input_sources;' >> ${DINPSRC}

    sed 's/ is;/;/g' ${DINPSRC} > tmp
    sed 's/with package/with/g' tmp > ${DINPSRC}

  # dummy-sax:
	${GREP}  --no-filename   ^package ${WRKSRC}/sax/sax-*.ads | \
		${AWK} '{print "with " $$2 ";"}' | ${SORT} > ${DSAX}
	${ECHO} 'procedure dummy_sax is' >> ${DSAX}
	${ECHO} 'begin' >> ${DSAX}
	${ECHO} '   null;' >> ${DSAX}
	${ECHO} 'end dummy_sax;' >> ${DSAX}

    sed 's/ is;/;/g' ${DSAX} > tmp
    sed 's/with package/with/g' tmp > ${DSAX}

  # dummy-dom:
	${GREP}  --no-filename   ^package ${WRKSRC}/dom/dom-*.ads | \
		${AWK} '{print "with " $$2 ";"}' | ${SORT} > ${DDOM}
	${ECHO} 'procedure dummy_dom is' >> ${DDOM}
	${ECHO} 'begin' >> ${DDOM}
	${ECHO} '   null;' >> ${DDOM}
	${ECHO} 'end dummy_dom;' >> ${DDOM}

    sed 's/ is;/;/g' ${DDOM} > tmp
    sed 's/with package/with/g' tmp > ${DDOM}

  # dummy-schema:
	${GREP}  --no-filename   ^package ${WRKSRC}/schema/schema-*.ads | \
		${AWK} '{print "with " $$2 ";"}' | ${SORT} > ${DSCHEMA}
	${ECHO} 'procedure dummy_schema is' >> ${DSCHEMA}
	${ECHO} 'begin' >> ${DSCHEMA}
	${ECHO} '   null;' >> ${DSCHEMA}
	${ECHO} 'end dummy_schema;' >> ${DSCHEMA}

    sed 's/ is;/;/g' ${DSCHEMA} > tmp
    sed 's/with package/with/g' tmp > ${DSCHEMA}
 

	# vital gpr files are missing from GPL 2015, recreate them
    #

    PORTVERSION="2016"

    FIND1=$(cd ${WRKSRC}/unicode       &&  find * -maxdepth 0  \( -name "unicode*.ads"   -o -name "unicode*.adb"      \) -exec printf ', "%s"' {} \; )
    FIND2=$(cd ${WRKSRC}/input_sources &&  find * -maxdepth 0  \( -name "input*.ad[bs]"  -o -name "input_sources.ads" \) -exec printf ', "%s"' {} \; )
    FIND3=$(cd ${WRKSRC}/sax           &&  find * -maxdepth 0     -name "sax-*.ad[bs]"                                  -exec printf ', "%s"' {} \; )
    FIND4=$(cd ${WRKSRC}/dom           &&  find * -maxdepth 0     -name "dom-*.ad[bs]"                                  -exec printf ', "%s"' {} \; )
    FIND5=$(cd ${WRKSRC}/schema        &&  find * -maxdepth 0  \( -name "schema*.ad[bs]" -o -name "schema.ads"        \)  -exec printf ', "%s"' {} \; )


	${SED} -e '/^with/d' -e 's|@ZONE@|unicode|' \
		-e "s|@FILES@|${FIND1}|" \
		-e 's|@VERSION@|2016|' ${FILESDIR}/generic_gpr.in \
		> ${WRKSRC}/distrib/xmlada_unicode.gpr

	${SED} -e 's|@DEPENDS@|unicode|' -e 's|@ZONE@|input_sources|' \
		-e "s|@FILES@|${FIND2}|" \
		-e 's|@VERSION@|2016|' ${FILESDIR}/generic_gpr.in \
		> ${WRKSRC}/distrib/xmlada_input_sources.gpr

	${SED} -e 's|@DEPENDS@|input_sources|' -e 's|@ZONE@|sax|' \
		-e "s|@FILES@|${FIND3}|" \
		-e 's|@VERSION@|2016|' ${FILESDIR}/generic_gpr.in \
		> ${WRKSRC}/distrib/xmlada_sax.gpr

	${SED} -e 's|@DEPENDS@|sax|' -e 's|@ZONE@|dom|' \
		-e "s|@FILES@|${FIND4}|" \
		-e 's|@VERSION@|2016|' ${FILESDIR}/generic_gpr.in \
		> ${WRKSRC}/distrib/xmlada_dom.gpr

	${SED} -e 's|@DEPENDS@|dom|' -e 's|@ZONE@|schema|' \
		-e "s|@FILES@|${FIND5}|" \
		-e 's|@VERSION@|2016|' ${FILESDIR}/generic_gpr.in \
		> ${WRKSRC}/distrib/xmlada_schema.gpr

	# Since we want to pull in all 5 libs, we only need to specify schema
    #
	${REINPLACE_CMD} -i -e '/unicode/d' ${WRKSRC}/distrib/xmlada.gpr
}



build() 
{
  cd $srcdir/$pkgname-gpl-$pkgver-src

  ./configure --prefix=/usr

  PROCESSORS=5   make -f ../Makefile.archy all
}



package() 
{
  cd $srcdir/$pkgname-gpl-$pkgver-src

  STAGEDIR=$pkgdir
  PREFIX=/usr
  WRKSRC=$srcdir/$pkgname-gpl-$pkgver-src


	${MKDIR} -p \
        ${STAGEDIR}${PREFIX}/bin \
        ${STAGEDIR}${PREFIX}/include/xmlada \
		${STAGEDIR}${PREFIX}/lib/gnat \
		${STAGEDIR}${PREFIX}/lib/xmlada/relocatable \
		${STAGEDIR}${PREFIX}/lib/xmlada/static \
		${STAGEDIR}${PREFIX}/share/gps/plug-ins
#		${STAGEDIR}${DOCSDIR}

	${INSTALL_DATA} ${WRKSRC}/dom/*.ad[bs] \
		${WRKSRC}/input_sources/*.ad[bs] \
		${WRKSRC}/sax/*.ad[bs] \
		${WRKSRC}/schema/*.ad[bs] \
		${WRKSRC}/unicode/*.ad[bs] \
		${STAGEDIR}${PREFIX}/include/xmlada

	${RM} ${STAGEDIR}${PREFIX}/include/xmlada/dummy_*.adb

	${INSTALL_DATA} \
        ${WRKSRC}/dom/obj/relocatable/*.ali \
		${WRKSRC}/input_sources/obj/relocatable/*.ali \
		${WRKSRC}/sax/obj/relocatable/*.ali \
		${WRKSRC}/schema/obj/relocatable/*.ali \
		${WRKSRC}/unicode/obj/relocatable/*.ali \
		${STAGEDIR}${PREFIX}/lib/xmlada/relocatable

     cp -av \
		${WRKSRC}/dom/lib/relocatable/*           \
		${WRKSRC}/input_sources/lib/relocatable/* \
		${WRKSRC}/sax/lib/relocatable/* \
		${WRKSRC}/schema/lib/relocatable/* \
		${WRKSRC}/unicode/lib/relocatable/* \
		${STAGEDIR}${PREFIX}/lib/xmlada/relocatable

	${INSTALL_DATA} ${WRKSRC}/dom/obj/static/*.ali \
		${WRKSRC}/input_sources/obj/static/*.ali \
		${WRKSRC}/sax/obj/static/*.ali \
		${WRKSRC}/schema/obj/static/*.ali \
		${WRKSRC}/unicode/obj/static/*.ali \
		${WRKSRC}/dom/lib/static/* \
		${WRKSRC}/input_sources/lib/static/* \
		${WRKSRC}/sax/lib/static/* \
		${WRKSRC}/schema/lib/static/* \
		${WRKSRC}/unicode/lib/static/* \
		${STAGEDIR}${PREFIX}/lib/xmlada/static

	${INSTALL_DATA} ${WRKSRC}/distrib/xml*.gpr \
		${STAGEDIR}${PREFIX}/lib/gnat
}
