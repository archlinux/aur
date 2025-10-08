# Maintainer: Daniel Bermond <dbermond@archlinux.org>

pkgname=ndi-sdk
pkgver=6.2.1.r146761.20250821
pkgrel=2
_majver="${pkgver%%.*}"
pkgdesc='NewTek NDI SDK'
arch=('x86_64')
url='https://ndi.video/for-developers/ndi-sdk/'
license=('LicenseRef-custom')
depends=(
    'avahi'
    'glibc')
optdepends=(
    'ffmpeg7.1: for HX decoding support')
provides=('libndi')
conflicts=('libndi')
options=('!debug' '!strip')
_srcfile="Install_NDI_SDK_v${pkgver}_Linux.tar.gz"
source=("$_srcfile"::"https://downloads.ndi.tv/SDK/NDI_SDK_Linux/Install_NDI_SDK_v${_majver}_Linux.tar.gz")
noextract=("$_srcfile")
sha256sums=('0bdf66264527f8be37fa22eddd2b8514b9868a58a4d83f80a07dbeb479ee14d4')

prepare() {
    mkdir -p "${pkgname}-${pkgver}"
    bsdtar -x -f "$_srcfile" -C "${pkgname}-${pkgver}"
    
    local _target_line
    cd "${pkgname}-${pkgver}"
    _target_line="$(sed -n '/^__NDI_ARCHIVE_BEGIN__$/=' "Install_NDI_SDK_v${_majver}_Linux.sh")"
    _target_line="$((_target_line + 1))"
    
    tail -n +"$_target_line" "Install_NDI_SDK_v${_majver}_Linux.sh" | tar -zxvf -
}

package() {
    local _sdkdir="${srcdir}/${pkgname}-${pkgver}/NDI SDK for Linux"
    
    # binary executables
    install -D -m755 "${_sdkdir}/bin/${CARCH}-linux-gnu/"* -t "${pkgdir}/usr/bin"
    
    # headers
    cp -dr --no-preserve='ownership' "${_sdkdir}/include" "${pkgdir}/usr"
    
    # library
    install -D -m755 "${_sdkdir}/lib/${CARCH}-linux-gnu/libndi.so.${_majver}".*.* -t "${pkgdir}/usr/lib"
    cd "${pkgdir}/usr/lib"
    ln -s "libndi.so.${_majver}".*.* "libndi.so.${_majver}"
    ln -s "libndi.so.${_majver}" libndi.so
    
    # docs
    install -D -m644 "${_sdkdir}/documentation/"*.pdf -t "${pkgdir}/usr/share/doc/${pkgname}"
    
    # license
    install -D -m644 "${_sdkdir}/NDI SDK License Agreement.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -D -m644 "${_sdkdir}/licenses/libndi_licenses.txt" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
