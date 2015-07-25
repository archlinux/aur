# Contributor: Patrick Kelly <kameo76890 at gmail dot com>
# Contributor: Georgios  Tsalikis <aliverius somewhere near tsalikis and a net>
# Contributor: Rod Kay <charlie5 on #ada at freenode.net>

pkgname=xmlada
pkgver=2015
pkgrel=1
pkgdesc="A full XML suite for Ada"

arch=('i686' 'x86_64')
url="http://libre.adacore.com/libre/tools/xmlada/"
license=('GPL')

depends=("gcc-ada")
source=(http://mirrors.cdn.adacore.com/art/949752df2432aed8d06c48d57cea71f38d0517cc
        Makefile.archy)
md5sums=('98c96b8c6a877617ec4da3ef6a03288a'
         '9784cefc4f5964b2469504f83957418f')


GREP=grep
AWK=gawk
ECHO=echo
SORT=sort
MKDIR=mkdir
INSTALL_DATA=cp
INSTALL_SCRIPT=cp
RM=rm


prepare()
{
  WRKSRC=$srcdir/$pkgname-gpl-$pkgver-src

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
  
}



build() 
{
  cd $srcdir/$pkgname-gpl-$pkgver-src
  ./configure --prefix=/usr
  make -f ../Makefile.archy all
}



package() 
{
  cd $srcdir/$pkgname-gpl-$pkgver-src

  STAGEDIR=$pkgdir
  PREFIX=/usr
  WRKSRC=$srcdir/$pkgname-gpl-$pkgver-src


	${MKDIR} -p ${STAGEDIR}${PREFIX}/include/xmlada \
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

	${INSTALL_DATA} ${WRKSRC}/dom/obj/relocatable/*.ali \
		${WRKSRC}/input_sources/obj/relocatable/*.ali \
		${WRKSRC}/sax/obj/relocatable/*.ali \
		${WRKSRC}/schema/obj/relocatable/*.ali \
		${WRKSRC}/unicode/obj/relocatable/*.ali \
		${WRKSRC}/dom/lib/relocatable/* \
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

	${INSTALL_DATA} ${WRKSRC}/distrib/xmlada_gps.py \
		${STAGEDIR}${PREFIX}/share/gps/plug-ins

	${INSTALL_SCRIPT} ${WRKSRC}/xmlada-config ${STAGEDIR}${PREFIX}/bin


#  make -j1 prefix=$pkgdir/usr install 
}
