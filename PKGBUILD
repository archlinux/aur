# Maintainer : Daniel Bermond < yahoo-com: danielbermond >

pkgname=ndi-sdk
pkgver=3.20181005.r97672
pkgrel=1
pkgdesc='NewTek NDI SDK'
arch=('i686' 'x86_64')
url='https://www.newtek.com/ndi/sdk/'
license=('custom')
depends=('glibc')
makedepends=('poppler')
provides=('libndi' 'libndi.so')
conflicts=('libndi')
options=('!strip')
_srcfile="InstallNDISDK_v${pkgver}_Linux.sh"
source=("$_srcfile"::"http://514f211588de67e4fdcf-437b8dd50f60b69cf0974b538e50585b.r63.cf1.rackcdn.com/Utilities/SDK/NDI_SDK_Linux_v2/InstallNDISDK_v${pkgver%%.*}_Linux.sh")
noextract=("$_srcfile")
sha256sums=('f4669d40724af4de2cfe5d0054e8feed5a1c7c308a5266c3280e946daaa38294')

prepare() {
    ! [ -d "${pkgname}-${pkgver}" ] && mkdir -p "${pkgname}-${pkgver}"
    
    local _target_line="$(sed -n '/^__NDI_ARCHIVE_BEGIN__$/=' "$_srcfile")"
    _target_line="$((_target_line + 1))"
    
    tail -n +"$_target_line" "$_srcfile" | tar -zxvf - -C "${pkgname}-${pkgver}"
    
    cd "${pkgname}-${pkgver}/NDI SDK for Linux"
    pdftotext -layout -q 'NDI License Agreement.pdf'
}

package() {
    # headers
    cd "${pkgname}-${pkgver}/NDI SDK for Linux/include"
    install -D -m644 * -t "${pkgdir}/usr/include"
    
    # library
    cd "${srcdir}/${pkgname}-${pkgver}/NDI SDK for Linux/lib/${CARCH}-linux-gnu"
    install -D -m755 "libndi.so.${pkgver%%.*}".* -t "${pkgdir}/usr/lib"
    cd "${pkgdir}/usr/lib"
    ln -s "libndi.so.${pkgver%%.*}".* "libndi.so.${pkgver%%.*}"
    ln -s "libndi.so.${pkgver%%.*}".*  libndi.so
    
    # docs
    cd "${srcdir}/${pkgname}-${pkgver}/NDI SDK for Linux/documentation"
    install -D -m644 * -t "${pkgdir}/usr/share/doc/${pkgname}"
    
    # license
    cd "${srcdir}/${pkgname}-${pkgver}/NDI SDK for Linux"
    install -D -m644 'NDI License Agreement.txt' "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
