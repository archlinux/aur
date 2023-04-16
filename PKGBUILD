# Maintainer: Daniel Bermond <dbermond@archlinux.org>

pkgname=ndi-sdk
pkgver=5.5.4.r134150.20230410
pkgrel=1
_majver="${pkgver%%.*}"
pkgdesc='NewTek NDI SDK'
arch=('x86_64')
url='https://ndi.tv/sdk/'
license=('custom')
depends=('avahi' 'hicolor-icon-theme')
makedepends=('icoutils')
provides=('libndi')
conflicts=('libndi')
options=('!strip')
_srcfile="Install_NDI_SDK_v${pkgver}_Linux.tar.gz"
source=("$_srcfile"::"https://downloads.ndi.tv/SDK/NDI_SDK_Linux/Install_NDI_SDK_v${_majver}_Linux.tar.gz")
noextract=("$_srcfile")
sha256sums=('c16db57b467d06cce1455393df744f152623b48ae53d76aa6ac4b3b5f0e3bde8')

prepare() {
    mkdir -p "${pkgname}-${pkgver}"/{,icons}
    bsdtar -x -f "$_srcfile" -C "${pkgname}-${pkgver}"
    
    local _target_line
    cd "${pkgname}-${pkgver}"
    _target_line="$(sed -n '/^__NDI_ARCHIVE_BEGIN__$/=' "Install_NDI_SDK_v${_majver}_Linux.sh")"
    _target_line="$((_target_line + 1))"
    
    tail -n +"$_target_line" "Install_NDI_SDK_v${_majver}_Linux.sh" | tar -zxvf -
    
    local _icon
    while read -r -d '' _icon
    do
        icotool -x "$_icon" -o "${srcdir}/${pkgname}-${pkgver}/icons" 2>/dev/null
    done < <(find "${srcdir}/${pkgname}-${pkgver}/NDI SDK for Linux/logos" -type f -name '*.ico' -print0)
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
    install -D -m644 "${_sdkdir}/documentation/"* -t "${pkgdir}/usr/share/doc/${pkgname}"
    
    #icons
    local _icon
    local _name
    local _res
    while read -r -d '' _icon
    do
        _name="$(sed 's|^.*/||;s/_[0-9]*_[0-9]*x[0-9]*x[0-9]*\.png//' <<< "$_icon")"
        _res="$(sed 's/\.png$//;s/^.*_//;s/x.*$//' <<< "$_icon")"
        install -D -m644 "$_icon" "${pkgdir}/usr/share/icons/hicolor/${_res}x${_res}/apps/${_name}.png"
    done < <(find "${srcdir}/${pkgname}-${pkgver}/icons" -type f -name "*x32.png" -print0)
    
    # license
    install -D -m644 "${_sdkdir}/NDI SDK License Agreement.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -D -m644 "${_sdkdir}/licenses/libndi_licenses.txt" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
