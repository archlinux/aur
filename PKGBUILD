# Maintainer: Facundo Tuesca <facutuesca at gmail dot com>

pkgname=k2pdfopt
pkgver=2.32
pkgrel=2
pkgdesc="A tool that optimizes PDF files for viewing on mobile readers"
arch=('i686' 'x86_64')
url="http://www.willus.com/k2pdfopt/"
license=('GPL3')
makedepends=('cmake')
depends=('mupdf>=1.6'
	'djvulibre>=3.5.25.3'
	'netpbm>=10.61.02'
	'leptonica>=1.69')
source=("http://www.willus.com/${pkgname}/src/${pkgname}_v${pkgver}_src.zip"
    "http://www.mupdf.com/downloads/archive/mupdf-1.6-source.tar.gz"
	"http://tesseract-ocr.googlecode.com/files/tesseract-ocr-3.02.02.tar.gz"
	"http://www-e.uni-magdeburg.de/jschulen/ocr/gocr-0.49.tar.gz"
    "https://openjpeg.googlecode.com/files/openjpeg-2.0.0.tar.gz"
	"k2pdfopt.patch"
	"tesseract.patch")
md5sums=('facfb12519a0a0b5db63acdac37844d7'
         '8d69db41ae9e0b6807b76bb6ed70dc2f'
         '26adc8154f0e815053816825dde246e6'
         '4e527bc4bdd97c2be15fdd818857507f'
         'd9be274bddc0f47f268e484bdcaaa6c5'
         '07a0f2d3776733ccd0149845816ad4f5'
         '0e85e48aed62771dfc090787c079359d')

prepare() {
	cd "${srcdir}/${pkgname}_v${pkgver}"
	rm -f "include_mod/gocr.h"
	cp mupdf_mod/font.c mupdf_mod/string.c "${srcdir}/mupdf-1.6-source/source/fitz/"
	cp mupdf_mod/pdf-* "${srcdir}/mupdf-1.6-source/source/pdf/"
	rm -rf ${srcdir}/mupdf-1.6-source/thirdparty/{curl,freetype,jpeg,zlib}
	cp tesseract_mod/dawg.cpp "${srcdir}/tesseract-ocr/dict/"
	cp tesseract_mod/tessdatamanager.cpp "${srcdir}/tesseract-ocr/ccutil/"
	cp tesseract_mod/tessedit.cpp "${srcdir}/tesseract-ocr/ccmain/"
	cp tesseract_mod/tesscapi.cpp "${srcdir}/tesseract-ocr/api"
	cp include_mod/tesseract.h include_mod/leptonica.h "${srcdir}/tesseract-ocr/api/"
	cd "${srcdir}"
	patch -p0 -i "${srcdir}/tesseract.patch"
	patch -p1 -i "${srcdir}/k2pdfopt.patch"
	mkdir -p "patched_libraries"
}

build() {
	cd "${srcdir}/mupdf-1.6-source/"
	make prefix="${srcdir}/patched_libraries" install
        install -Dm644 build/debug/libmujs.a "${srcdir}/patched_libraries/lib/"
	cd "${srcdir}/tesseract-ocr/"
	./autogen.sh
	./configure --prefix="${srcdir}/patched_libraries" --disable-shared
	make install
	cd "${srcdir}/gocr-0.49/"
	./configure 
	cp src/{gocr.h,pnm.h,unicode.h,list.h} "${srcdir}/patched_libraries/include"
	cp include/config.h "${srcdir}/patched_libraries/include"
	make libs
	cp src/libPgm2asc.a "${srcdir}/patched_libraries/lib"
    cd "${srcdir}/openjpeg-2.0.0/"
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
