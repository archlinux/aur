# Maintainer: Carl Kittelberger <icedream@icedream.pw>
# Based on the PKGBUILD for AUR package `ndi-sdk` by Daniel Bermond <dbermond@archlinux.org>

pkgname=ndi-advanced-sdk
pkgver=5.5.3.20230202.r133274
pkgrel=1
_majver="${pkgver%%.*}"
pkgdesc='NewTek NDI Advanced SDK'
arch=('aarch64' 'armv6h' 'armv7h' 'x86_64' 'i686')
url='https://www.newtek.com/ndi/sdk/'
license=('custom')
depends=('avahi')
provides=('libndi' 'libndi-bin' 'ndi-sdk')
conflicts=('libndi' 'libndi-bin' 'libndi-git' 'ndi-sdk')
options=('!strip')
_srcfile="Install_NDI_Advanced_SDK_v${pkgver}_Linux.tar.gz"
source=("$_srcfile"::"https://downloads.ndi.tv/SDK/NDI_SDK_Linux/Install_NDI_Advanced_SDK_v${_majver}_Linux.tar.gz")
noextract=("$_srcfile")
sha256sums=('e9919293aae0cd8022019ca16601d0a97b3b1081cfe9dafca142fed3749bc786')

case "${CARCH}" in
armv6*)
    newtek_triplet="arm-rpi1-linux-gnueabihf"
    ;;
armv7*)
    newtek_triplet="arm-rpi2-linux-gnueabihf"
    ;;
arm*)
    newtek_triplet="arm-newtek-linux-gnueabihf"
    ;;
aarch*)
    newtek_triplet="aarch64-rpi4-linux-gnueabi"
    ;;
*)
    newtek_triplet="${CARCH}-linux-gnu"
    ;;
esac

prepare() {
    mkdir -p "${pkgname}-${pkgver}"
    bsdtar -x -f "$_srcfile" -C "${pkgname}-${pkgver}"

    local _target_line
    cd "${pkgname}-${pkgver}"
    _target_line="$(sed -n '/^__NDI_ARCHIVE_BEGIN__$/=' "Install_NDI_Advanced_SDK_v${_majver}_Linux.sh")"
    _target_line="$((_target_line + 1))"

    tail -n +"$_target_line" "Install_NDI_Advanced_SDK_v${_majver}_Linux.sh" |
        tar -zxv \
            "NDI Advanced SDK for Linux/bin/${newtek_triplet}/" \
            "NDI Advanced SDK for Linux/lib/${newtek_triplet}/" \
            "NDI Advanced SDK for Linux/documentation" \
            "NDI Advanced SDK for Linux/include" \
            "NDI Advanced SDK for Linux/licenses/libndi_licenses.txt" \
            "NDI Advanced SDK for Linux/NDI Advanced License Agreement.txt" \
            "NDI Advanced SDK for Linux/Version.txt"
}

pkgver() {
    local _sdkdir="${srcdir}/${pkgname}-${pkgver}/NDI Advanced SDK for Linux"

    read _ date rel ver < "${_sdkdir}/Version.txt"
    date="${date//-/}"
    ver="${ver#v}"
    printf '%s.%s.%s' "$ver" "$date" "$rel"
}

package() {
    local _sdkdir="${srcdir}/${pkgname}-${pkgver}/NDI Advanced SDK for Linux"

    # binary executables
    install -D -m755 "${_sdkdir}/bin/${newtek_triplet}/"* -t "${pkgdir}/usr/bin"

    # headers
    install -D -m644 "${_sdkdir}/include/"* -t "${pkgdir}/usr/include"

    # library
    install -D -m755 "${_sdkdir}/lib/${newtek_triplet}/libndi.so.${_majver}".*.* -t "${pkgdir}/usr/lib"
    cd "${pkgdir}/usr/lib"
    ln -s "libndi.so.${_majver}".*.* "libndi.so.${_majver}"
    ln -s "libndi.so.${_majver}".*.* libndi.so

    # docs
    install -D -m644 "${_sdkdir}/documentation/"* -t "${pkgdir}/usr/share/doc/${pkgname}"

    # license
    install -D -m644 "${_sdkdir}/NDI Advanced License Agreement.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -D -m644 "${_sdkdir}/licenses/libndi_licenses.txt" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
