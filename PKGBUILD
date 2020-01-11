# Maintainer : Daniel Bermond < gmail-com: danielbermond >

pkgname=ndi-sdk
pkgver=4.1.20191112.r109059
pkgrel=1
_majver="${pkgver%%.*}"
pkgdesc='NewTek NDI SDK'
arch=('x86_64')
url='https://www.newtek.com/ndi/sdk/'
license=('custom')
depends=('avahi')
options=('!strip')
_srcfile="InstallNDISDK_v${pkgver}_Linux.tar.gz"
source=("$_srcfile"::"http://514f211588de67e4fdcf-437b8dd50f60b69cf0974b538e50585b.r63.cf1.rackcdn.com/Utilities/SDK/NDI_SDK_Linux_v2/InstallNDISDK_v${_majver}_Linux.tar.gz")
noextract=("$_srcfile")
sha256sums=('57a024a4e83256683f82238e4ece41ddcb0fecbc64c81b9376d1a2e7af2d4cc1')

prepare() {
    mkdir -p "${pkgname}-${pkgver}"
    
    bsdtar -x -f "$_srcfile" -C "${pkgname}-${pkgver}"
    
    local _target_line
    cd "${pkgname}-${pkgver}"
    _target_line="$(sed -n '/^__NDI_ARCHIVE_BEGIN__$/=' "InstallNDISDK_v${_majver}_Linux.sh")"
    _target_line="$((_target_line + 1))"
    
    tail -n +"$_target_line" "InstallNDISDK_v${_majver}_Linux.sh" | tar -zxvf -
}

package() {
    # headers
    cd "${pkgname}-${pkgver}/NDI SDK for Linux/include"
    install -D -m644 * -t "${pkgdir}/usr/include"
    
    # library
    cd "${srcdir}/${pkgname}-${pkgver}/NDI SDK for Linux/lib/${CARCH}-linux-gnu"
    install -D -m755 "libndi.so.${_majver}".* -t "${pkgdir}/usr/lib"
    cd "${pkgdir}/usr/lib"
    ln -s "libndi.so.${_majver}".*.* "libndi.so.${_majver}"
    ln -s "libndi.so.${_majver}".*.*  libndi.so
    
    # docs
    cd "${srcdir}/${pkgname}-${pkgver}/NDI SDK for Linux/documentation"
    install -D -m644 * -t "${pkgdir}/usr/share/doc/${pkgname}"
    
    # license
    cd "${srcdir}/${pkgname}-${pkgver}/NDI SDK for Linux"
    install -D -m644 'NDI SDK License Agreement.txt' "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
