# Maintainer: Facundo Tuesca <facutuesca at gmail dot com>

_mupdf_version=1.10a
_tesseract_version=3.05.00
_gocr_version=0.50
_openjpeg_version=2.1.0
_leptonica_version=1.74.1

pkgname=k2pdfopt
pkgver=2.42
pkgrel=1
pkgdesc="A tool that optimizes PDF files for viewing on mobile readers"
arch=('i686' 'x86_64')
url="http://www.willus.com/k2pdfopt/"
license=('GPL3')
makedepends=('cmake')
depends=('mupdf>=1.10'
	'djvulibre>=3.5.25.3'
	'netpbm>=10.61.02'
	'leptonica>=1.74.1')
source=("http://www.willus.com/k2pdfopt/src/${pkgname}_v${pkgver}_src.zip"
    "http://www.mupdf.com/downloads/archive/mupdf-${_mupdf_version}-source.tar.gz"
	"https://github.com/tesseract-ocr/tesseract/archive/${_tesseract_version}.tar.gz"
	"http://www-e.uni-magdeburg.de/jschulen/ocr/gocr-${_gocr_version}.tar.gz"
    "http://downloads.sourceforge.net/project/openjpeg.mirror/${_openjpeg_version}/openjpeg-${_openjpeg_version}.tar.gz"
    "leptonica-${_leptonica_version}.tar.gz::https://github.com/DanBloomberg/leptonica/archive/${_leptonica_version}.tar.gz"
	"k2pdfopt.patch"
	"tesseract.patch")
md5sums=('e3a62a25d9ab310f8b7ab218df8dd8df'
         'f80fbba2524d1d52f6ed09237d382411'
         '478ba26e8e7ea8f6f466d4dfc2332d34'
         '553ea40c2b3a1a0b03a30675d0e0aba1'
         'f6419fcc233df84f9a81eb36633c6db6'
         'b3de9ae35976fd4fc3f6dae5a4368bca'
         '1c34ef8378dc52f29d9d97714c899e90'
         '3db9d9cd3b7745af036c968dfe0ba376')

prepare() {
	cd "${srcdir}/${pkgname}_v${pkgver}"
	rm -f "include_mod/gocr.h"
	cp mupdf_mod/font.c mupdf_mod/font-win32.c mupdf_mod/string.c mupdf_mod/stext-device.c "${srcdir}/mupdf-${_mupdf_version}-source/source/fitz/"
	cp mupdf_mod/pdf-* "${srcdir}/mupdf-${_mupdf_version}-source/source/pdf/"
    cp "${srcdir}/mupdf-${_mupdf_version}-source/source/fitz/font-imp.h" "${srcdir}/mupdf-${_mupdf_version}-source/source/pdf/"
    cp "${srcdir}/mupdf-${_mupdf_version}-source/source/fitz/colorspace-imp.h" "${srcdir}/mupdf-${_mupdf_version}-source/source/pdf/"
    cp "${srcdir}/mupdf-${_mupdf_version}-source/source/fitz/colorspace-imp.h" "${srcdir}/mupdf-${_mupdf_version}-source/source/pdf/"
	rm -rf ${srcdir}/mupdf-${_mupdf_version}-source/thirdparty/{curl,freetype,harfbuzz,jpeg,zlib,openjpeg}
    # this does not build with openssl 1.1.0, so disable checks
    sed -i 's/pkg-config --exists \(libcrypto\|openssl\)/false/' "${srcdir}/mupdf-${_mupdf_version}-source/Makerules"
	cp tesseract_mod/dawg.cpp "${srcdir}/tesseract-${_tesseract_version}/dict/"
	cp tesseract_mod/tessdatamanager.cpp tesseract_mod/ambigs.cpp tesseract_mod/ccutil.cpp tesseract_mod/ccutil.h "${srcdir}/tesseract-${_tesseract_version}/ccutil/"
	cp tesseract_mod/tessedit.cpp tesseract_mod/thresholder.cpp "${srcdir}/tesseract-${_tesseract_version}/ccmain/"
	cp tesseract_mod/imagedata.cpp "${srcdir}/tesseract-${_tesseract_version}/ccstruct/"
	cp tesseract_mod/openclwrapper.h "${srcdir}/tesseract-${_tesseract_version}/opencl/"
	cp tesseract_mod/tess_lang_mod_edge.h "${srcdir}/tesseract-${_tesseract_version}/cube/"
	cp include_mod/tesseract.h include_mod/leptonica.h tesseract_mod/tesscapi.cpp "${srcdir}/tesseract-${_tesseract_version}/api/"
	cp tesseract_mod/config_auto.h "${srcdir}/tesseract-${_tesseract_version}/"
	cp leptonica_mod/allheaders.h leptonica_mod/dewarp2.c "${srcdir}/leptonica-${_leptonica_version}/src/"
	cd "${srcdir}"
	patch -p0 -i "${srcdir}/tesseract.patch"
	patch -p1 -i "${srcdir}/k2pdfopt.patch"
	mkdir -p "patched_libraries/lib"
}

build() {
    cd "${srcdir}/openjpeg-${_openjpeg_version}/"
    cmake -D BUILD_SHARED_LIBS:bool=off .
    make openjp2
    cp bin/libopenjp2.a "${srcdir}/patched_libraries/lib/"
    mkdir -p "${srcdir}/patched_libraries/include/openjpeg-2.1/"
    cp src/lib/openjp2/{opj_stdint.h,opj_config.h,openjpeg.h} "${srcdir}/patched_libraries/include/openjpeg-2.1/"

	cd "${srcdir}/mupdf-${_mupdf_version}-source/"
#Use the same openjpeg2 libraries as mupdf
	make SYS_OPENJPEG_LIBS=-L/${srcdir}/patched_libraries/lib\ -lopenjp2 prefix="${srcdir}/patched_libraries" generate
	make SYS_OPENJPEG_LIBS=-L/${srcdir}/patched_libraries/lib\ -lopenjp2 prefix="${srcdir}/patched_libraries" install

	cd "${srcdir}/leptonica-${_leptonica_version}/"
    ./autobuild
    ./configure --without-libopenjpeg --prefix="${srcdir}/patched_libraries" --disable-shared
    make install

	cd "${srcdir}/tesseract-${_tesseract_version}/"
	./autogen.sh
	./configure --prefix="${srcdir}/patched_libraries" --disable-shared
	make install
	cd "${srcdir}/gocr-${_gocr_version}/"
	./configure 
	cp src/{gocr.h,pnm.h,unicode.h,list.h} "${srcdir}/patched_libraries/include"
	cp include/config.h "${srcdir}/patched_libraries/include"
	make libs
	cp src/libPgm2asc.a "${srcdir}/patched_libraries/lib"

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
		-ljbig2dec -ljpeg -lopenjp2 -lpng -lfreetype -lpthread \
		-lPgm2asc -llept -ltesseract -lcrypto -lharfbuzz -ltiff -lgif -lwebp
	
}

package() {
	cd "${srcdir}/${pkgname}_v${pkgver}"
	mkdir -p "${pkgdir}/usr/bin/"
	cp ${pkgname} "${pkgdir}/usr/bin/"
}
