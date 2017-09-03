# Maintainer : Daniel Bermond < yahoo-com: danielbermond >

# NOTE:
# In order to build the package, you need to manually download the source file
# from NewTek's website (registration required). Place the downloaded file
# in the PKGBUILD directory and run makepkg.
# Download website:
#   https://www.newtek.com/ndi/sdk/
# Alternative link:
#   http://pages.newtek.com/NDI-Developers.html

pkgname=ndi-sdk
pkgver=3.20170821.r80510
pkgrel=1
pkgdesc='NewTek NDI SDK (needs registration at upstream URL and manual download)'
arch=('i686' 'x86_64')
url='https://www.newtek.com/ndi/sdk/'
license=('custom')
makedepends=('poppler')
provides=('libndi' 'libndi.so')
options=('!strip')
source=("file://InstallNDISDK_v${pkgver%%.*}_Linux.sh")
sha256sums=('d1876510fe5077a609179ef2acd2cb93a5bebef640202278ca98b3b5c408430a')

prepare() {
    ! [ -d "${pkgname}-${pkgver}" ] && mkdir -p "${pkgname}-${pkgver}"
    
    local _target_line="$(sed -n '/^__NDI_ARCHIVE_BEGIN__$/=' "InstallNDISDK_v${pkgver%%.*}_Linux.sh")"
    _target_line="$((_target_line + 1))"
    
    tail -n +"$_target_line" "InstallNDISDK_v${pkgver%%.*}_Linux.sh" | tar -zxvf - -C "${pkgname}-${pkgver}"
}

package() {
    # directories creation
    mkdir -p "${pkgdir}/usr/"{include,lib,share/{doc/"$pkgname",licenses}}
    
    # includes
    cd "${pkgname}-${pkgver}/NDI SDK for Linux/include"
    install -D -m644 * "${pkgdir}/usr/include"
    
    # library
    cd "${srcdir}/${pkgname}-${pkgver}/NDI SDK for Linux/lib/${CARCH}-linux-gnu"
    cp -a * "${pkgdir}/usr/lib"
    
    # docs
    cd "${srcdir}/${pkgname}-${pkgver}/NDI SDK for Linux/documentation"
    install -D -m644 * "${pkgdir}/usr/share/doc/${pkgname}"
    
    # license
    cd "${srcdir}/${pkgname}-${pkgver}/NDI SDK for Linux"
    pdftotext -layout -q 'NDI License Agreement.pdf'
    install -D -m644 'NDI License Agreement.txt' "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
