# Maintainer : Daniel Bermond < gmail-com: danielbermond >

pkgname=ndi-sdk
pkgver=3.20181217.r99822
pkgrel=1
pkgdesc='NewTek NDI SDK'
arch=('i686' 'x86_64')
url='https://www.newtek.com/ndi/sdk/'
license=('custom')
depends=('avahi')
options=('!strip')
_srcfile="InstallNDISDK_v${pkgver}_Linux.sh"
source=("$_srcfile"::"http://514f211588de67e4fdcf-437b8dd50f60b69cf0974b538e50585b.r63.cf1.rackcdn.com/Utilities/SDK/NDI_SDK_Linux_v2/InstallNDISDK_v${pkgver%%.*}_Linux.sh")
noextract=("$_srcfile")
sha256sums=('3088c7d03fd92ec5094bbe6c596a32498d06c39d00e1df6f20d089076f48f559')

prepare() {
    mkdir -p "${pkgname}-${pkgver}"
    
    local _target_line
    _target_line="$(sed -n '/^__NDI_ARCHIVE_BEGIN__$/=' "$_srcfile")"
    _target_line="$((_target_line + 1))"
    
    tail -n +"$_target_line" "$_srcfile" | tar -zxvf - -C "${pkgname}-${pkgver}"
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
    install -D -m644 'NDI SDK License Agreement.txt' "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
