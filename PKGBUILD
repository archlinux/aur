# Maintainer: Didrole <Didrole@gmail.com>

pkgname=bixolon-label-cups
pkgver=1.3.6
pkgrel=1
pkgdesc="CUPS drivers for Bixolon label printers"
arch=('i686' 'x86_64' 'armv7h' 'aarch64')
url="https://bixolon.com/support.php?kind=download#product-lilstlabel"
license=('custom')
depends=('glibc' 'libcups')
source=("${pkgname}-${pkgver}.zip::https://www.bixolon.com/_lib/download_single.php?FILE_INFO=driver|driver_file|driver_idx|113|driver")
sha256sums=('3d853f8fa2a00d493589dbb8d0038a1b06ef2e55acfee317f754f7b6c1b240c1')

prepare() {
    cd "Software_Linux_Label_CUPS_Driver_V${pkgver}"
    tar -xf Software_BxlLabelCupsDrv_Linux_v${pkgver}.tar.xz
}

package() {
    local -rA filters=(
        ["i686"]="rastertoBxlLabel_v${pkgver}_x86"
        ["x86_64"]="rastertoBxlLabel_v${pkgver}_x64"
        ["armv7h"]="rastertoBxlLabel_v${pkgver}_RaspberryPi_x86"
        ["aarch64"]="rastertoBxlLabel_v${pkgver}_RaspberryPi_x64"
    )
    local filter="${filters[$CARCH]}"

    if [[ -z "${filter}" ]]; then
        echo "Error: No cups filter available for $CARCH architecture." >&2
        return 1
    fi

    cd "Software_Linux_Label_CUPS_Driver_V${pkgver}/Software_BxlLabelCupsDrv_Linux_v${pkgver}"

    install -D "filters/${filter}" "${pkgdir}/usr/lib/cups/filter/rastertoBxlLabel"
    install --mode=644 -D --target-directory="${pkgdir}/usr/share/cups/model/Bixolon/" Bixolon/*.ppd
    install --mode=644 -D SoftwareLicense.txt "${pkgdir}/usr/share/licenses/${pkgname}/SoftwareLicense.txt"
}

