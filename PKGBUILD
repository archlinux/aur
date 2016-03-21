# Maintainer: Facundo Tuesca <facutuesca at gmail dot com>

pkgname=k2pdfopt
pkgver=2.34a
pkgrel=1
pkgdesc="A tool that optimizes PDF files for viewing on mobile readers"
arch=('i686' 'x86_64')
url="http://www.willus.com/k2pdfopt/"
license=('GPL3')
makedepends=('cmake')
depends=('mupdf>=1.8'
	'djvulibre>=3.5.25.3'
	'netpbm>=10.61.02'
	'leptonica>=1.72')
source=("http://www.willus.com/k2pdfopt/src/${pkgname}_v${pkgver}_src.zip"
    "http://www.willus.com/k2pdfopt/src/${pkgname}_v2.34_src.zip"
    "http://www.mupdf.com/downloads/archive/mupdf-1.8-source.tar.gz"
	"https://github.com/tesseract-ocr/tesseract/archive/3.04.01.tar.gz"
	"http://www-e.uni-magdeburg.de/jschulen/ocr/gocr-0.49.tar.gz"
    "http://downloads.sourceforge.net/project/openjpeg.mirror/2.1.0/openjpeg-2.1.0.tar.gz"
	"k2pdfopt.patch"
	"tesseract.patch")
md5sums=('907484805a16d4961be58f06f49bc0c7'
         'bdca1b23bb81d23e515faf5260c44599'
         '3205256d78d8524d67dd2a47c7a345fa'
         '645a21effcf2825a3473849d72a7fd90'
         '4e527bc4bdd97c2be15fdd818857507f'
         'f6419fcc233df84f9a81eb36633c6db6'
         '75dcbbac103eafe5374e14120ff591aa'
         '3442e31f2f6302cf17dcc3a4a8cef40a')

prepare() {
    cp -r ${srcdir}/${pkgname}_v2.34/* "${srcdir}/${pkgname}_v${pkgver}"
	cd "${srcdir}/${pkgname}_v${pkgver}"
	rm -f "include_mod/gocr.h"
	cp mupdf_mod/font.c mupdf_mod/string.c mupdf_mod/filter-dct.c mupdf_mod/load-* "${srcdir}/mupdf-1.8-source/source/fitz/"
	cp mupdf_mod/pdf-* "${srcdir}/mupdf-1.8-source/source/pdf/"
	rm -rf ${srcdir}/mupdf-1.8-source/thirdparty/{curl,freetype,jpeg,zlib,openjpeg}
	cp tesseract_mod/dawg.cpp "${srcdir}/tesseract-3.04.01/dict/"
	cp tesseract_mod/tessdatamanager.cpp "${srcdir}/tesseract-3.04.01/ccutil/"
	cp tesseract_mod/tessedit.cpp "${srcdir}/tesseract-3.04.01/ccmain/"
	cp tesseract_mod/tesscapi.cpp "${srcdir}/tesseract-3.04.01/api"
	cp include_mod/tesseract.h include_mod/leptonica.h "${srcdir}/tesseract-3.04.01/api/"
	cd "${srcdir}"
	patch -p0 -i "${srcdir}/tesseract.patch"
	patch -p1 -i "${srcdir}/k2pdfopt.patch"
	mkdir -p "patched_libraries"
}

build() {
	cd "${srcdir}/mupdf-1.8-source/"
	make prefix="${srcdir}/patched_libraries" install
        install -Dm644 build/debug/libmujs.a "${srcdir}/patched_libraries/lib/"
	cd "${srcdir}/tesseract-3.04.01/"
	./autogen.sh
	./configure --prefix="${srcdir}/patched_libraries" --disable-shared
	make install
	cd "${srcdir}/gocr-0.49/"
	./configure 
	cp src/{gocr.h,pnm.h,unicode.h,list.h} "${srcdir}/patched_libraries/include"
	cp include/config.h "${srcdir}/patched_libraries/include"
	make libs
	cp src/libPgm2asc.a "${srcdir}/patched_libraries/lib"
    cd "${srcdir}/openjpeg-2.1.0/"
    cmake -D BUILD_SHARED_LIBS:bool=off .
    make openjp2
    cp bin/libopenjp2.a "${srcdir}/patched_libraries/lib"

	cd "${srcdir}/${pkgname}_v${pkgver}/k2pdfoptlib"
	gcc -Ofast -Wall -c *.c -I ../include_mod/ -I ${srcdir}/patched_libraries/include \
		-I . -I ../willuslib
	ar rcs libk2pdfopt.a *.o
	cd "${srcdir}/${pkgname}_v${pkgver}/willuslib"
	gcc -Ofast -Wall -c *.c -I ../include_mod/ -I ${srcdir}/patched_libraries/include
	ar rcs libwillus.a *.o
	cd "${srcdir}/${pkgname}_v${pkgver}"
	gcc -Wall -Ofast -o k2pdfopt.o -c k2pdfopt.c -I k2pdfoptlib/ -I willuslib/ \
		-I include_mod/ -I ${srcdir}/patched_libraries/include
	g++ -Ofast k2pdfopt.o -o k2pdfopt -I willuslib/ -I k2pdfoptlib/ -I include_mod/ \
		-I ${srcdir}/patched_libraries/include -L ${srcdir}/patched_libraries/lib/ \
		-L willuslib/ -L k2pdfoptlib/ -lk2pdfopt -lwillus -ldjvulibre -lz -lmupdf  \
		-ljbig2dec -ljpeg -lopenjp2 -lpng -lfreetype -lpthread -lmujs \
		-lPgm2asc -llept -ltesseract -lcrypto
	
}

package() {
	cd "${srcdir}/${pkgname}_v${pkgver}"
	mkdir -p "${pkgdir}/usr/bin/"
	cp ${pkgname} "${pkgdir}/usr/bin/"
}
