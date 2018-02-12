# Maintainer : Daniel Bermond < yahoo-com: danielbermond >

pkgname=ndi-sdk
pkgver=3.20171009.r82134
pkgrel=2
pkgdesc='NewTek NDI SDK'
arch=('i686' 'x86_64')
url='https://www.newtek.com/ndi/sdk/'
license=('custom')
depends=('gcc-libs')
makedepends=('poppler')
provides=('libndi' 'libndi.so')
conflicts=('libndi')
options=('!strip')
source=("http://514f211588de67e4fdcf-437b8dd50f60b69cf0974b538e50585b.r63.cf1.rackcdn.com/Utilities/SDK/NDI_SDK_Linux_v2/InstallNDISDK_v${pkgver%%.*}_Linux.sh")
sha256sums=('6fc5d3c3f2d10837187b0db8fb332a88ef7bca311214d7b05e87497789e97a16')

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
    cp -a "libndi.so.${pkgver%%.*}".* "${pkgdir}/usr/lib"
    cd "${pkgdir}/usr/lib"
    ln -s "libndi.so.${pkgver%%.*}".* "libndi.so.${pkgver%%.*}"
    ln -s "libndi.so.${pkgver%%.*}".*  libndi.so
    
    # docs
    cd "${srcdir}/${pkgname}-${pkgver}/NDI SDK for Linux/documentation"
    install -D -m644 * "${pkgdir}/usr/share/doc/${pkgname}"
    
    # license
    cd "${srcdir}/${pkgname}-${pkgver}/NDI SDK for Linux"
    pdftotext -layout -q 'NDI License Agreement.pdf'
    install -D -m644 'NDI License Agreement.txt' "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
