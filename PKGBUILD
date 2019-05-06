pkgname=scannerextract
_pkgname=scannerExtract
pkgver=0.2.601
pkgrel=1
pkgdesc="Scanned Image Extractor"
depends=('liblbfgs' 'opencv2')
license=('GPL3')
arch=('any')
url="http://www.dominik-ruess.de/scannerExtract/scannerExtract_help_en.html"
source=(
"${pkgname}-${pkgver}::https://ayera.dl.sourceforge.net/project/scannedimageextractor/Version-${pkgver}/SIE-${pkgver}.tar.bz2"
"remove-q-foreachcontainer.patch"
)

#https://downloads.sourceforge.net/project/scannedimageextractor/Version-0.2.601/SIE-0.2.601.tar.bz2.sha256?r=https%3A%2F%2Fsourceforge.net%2F&ts=1557152577
sha256sums=('f2473afef1e0cf972a60eec323fc323739aa9e0e8bb14dab639a787cec007dd8'
'9e0ebc65810700e0f52225c883035166b18ff7ab0bb51c8b400180e1d7dc7029'
)

build() {
    cd "$_pkgname-$pkgver"

# Remove strange windows line return stopping patch from … uuhm patching.
    tr -d '\r' < module_misc/translation.cpp > module_misc/translation.cpp.new
    mv module_misc/translation.cpp.new module_misc/translation.cpp
    patch --strip 0 -l -i ${srcdir}/remove-q-foreachcontainer.patch 
    mkdir -p build
    cd build
    cmake ../scannerExtract/ -DCMAKE_BUILD_TYPE=release -DOPENCV2=1
    make
}

package() {
    cd "$_pkgname-$pkgver"/build
    make DESTDIR="$pkgdir/" install
}
