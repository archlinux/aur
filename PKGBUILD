# Maintainer: maz-1 <ohmygod19993 at gmail dot com>
_pkgname=odf-converter
pkgname=${_pkgname}
pkgver=4.0.5309
pkgrel=1
pkgdesc="Convert ODF to OpenXML(docx, xlsx, pptx)"
arch=("i686" "x86_64")
url="https://sourceforge.net/p/odf-converter"
license=("BSD")
depends=('mono')
makedepends=('svn' 'dos2unix')
options=('!strip' 'emptydirs' 'libtool')
source=("http://downloads.sourceforge.net/project/odf-converter/ODF%20Translator%20CommandLine/Release%204.0/CommandLineTool_4.0.5309.zip"
        "zlib123::svn+svn://svn.code.sf.net/p/odf-converter/code/trunk/"
        zlibwapi.patch)
noextract=(CommandLineTool_4.0.5309.zip)
md5sums=('84dbd341396dacdd8dbd70d745728e3c'
         'SKIP'
         '80f91da40ed073f8ce50522189a09a33')

prepare() {
    cd "$srcdir/zlib123/source/AdditionalTools/zlib123"
    patch -p1 < "${srcdir}/zlibwapi.patch"
}

build() {
    cd "$srcdir/zlib123/source/AdditionalTools/zlib123"
    dos2unix configure
    chmod 755 ./configure
    ./configure --shared
    #make test
    cd contrib/minizip
    make
}

package() {
    mkdir -p "$pkgdir/usr/"{share/odf-converter,bin}
    cd "$pkgdir/usr/share/odf-converter"
    unzip "$srcdir/CommandLineTool_4.0.5309.zip"
    rm libzlibwapi.so zlibwapi.dll
    cp "$srcdir/zlib123/source/AdditionalTools/zlib123/contrib/minizip/libzlibwapi.so" ./
    echo '#!/bin/sh'  > "$pkgdir/usr/bin/odfconverter"
    echo 'exec mono /usr/share/odf-converter/OdfConverter.exe "$@"'  >> "$pkgdir/usr/bin/odfconverter"
    chmod +x "$pkgdir/usr/bin/odfconverter"
}
