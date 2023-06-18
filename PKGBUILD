# Maintainer: Dmitry Razumov <asmeron@ublinux.com>

pkgbase='xerox-spl-driver'
pkgname=(
    'xerox-spl-driver-common'
    'xerox-spl-driver-printer'
    'xerox-spl-driver-scanner'
    'xerox-spl-driver'
)
pkgver=1.00.39.3
pkgrel=1

pkgdesc='Xerox SPL Linux Driver for printers and scanners. Also supports B205 B210 B215, Phaser 3020 3052 3117 3140 3155 3160 3200MFP 3250 3260 3300MFP 3320 3435 3600 6110MFP, WorkCentre 3025 3210 3215 3220 3225 3315 3325 3550 4118 PE120 PE220, FaxCentre 2218'
url='https://www.support.xerox.com'
arch=('x86_64' 'i686')
license=('custom:xerox')
options=(!strip)
source=(
    "http://download.support.xerox.com/pub/drivers/B215/drivers/linux/ar/Xerox_B215_Linux_PrintDriver_Utilities.tar.gz"
    "xerox_mfp-smfp.conf")
makedepends=('binutils' 'tar')
sha256sums=('ba510467069bf2b0bb13b0cee6f25516da490b0d2d5940846273dfe31a93eb3a'
            '2b64b114c290e9f122d9dd8b553352d32c4317d1de1cabc46cd59dc4f30974a1')

_arch=${CARCH/i686/i386}

pkgver() {
    FILE_VERSION="${srcdir}/uld/noarch/.version-printer"
    [[ -f ${FILE_VERSION} ]] && printf "%s" "$(cat ${FILE_VERSION})" || echo ${pkgver}
}

prepare(){
    chmod -R u+w "${srcdir}"/*
}

build() {
    cd "uld"
    find -type f -name '*.ppd' -execdir gzip -f {} \;
}

package_xerox-spl-driver()
{
    depends=('xerox-spl-driver-printer'
             'xerox-spl-driver-scanner')
}

package_xerox-spl-driver-common()
{
    pkgdesc='License Xerox SPL Linux Driver for printers and scanners.'
    find "${srcdir}"/uld/noarch/license -type f -name '*.txt' -execdir install -Dm0644 {} "${pkgdir}/usr/share/licenses/${pkgbase}/{}" \; -print
}

package_xerox-spl-driver-printer()
{
    depends=('xerox-spl-driver-common' 'cups' 'ghostscript')
    pkgdesc='Xerox SPL driver for printers. Also supports B205 B210 B215, Phaser 3020 3052 3117 3140 3155 3160 3200MFP 3250 3260 3300MFP 3320 3435 3600 6110MFP, WorkCentre 3025 3210 3215 3220 3225 3315 3325 3550 4118 PE120 PE220, FaxCentre 2218'

    find "${srcdir}/uld/noarch/share/ppd" -type f \( -name '*.ppd' -o -name '*.ppd.gz' \) -execdir install -Dm0644 {} "${pkgdir}/usr/share/ppd/xerox/{}" \;
    find "${srcdir}/uld/noarch/share/ppd/cms" -type f -name '*.cts' -execdir install -Dm644 {} "${pkgdir}/usr/share/ppd/xerox/cms/{}" \;
    install -Dm0755 "${srcdir}/uld/${_arch}/libscmssc.so" "${pkgdir}/usr/lib/libscmssc.so"
    install -Dm0755 "${srcdir}/uld/${_arch}/smfpnetdiscovery" "${pkgdir}/usr/lib/cups/backend/smfpnetdiscovery"
    install -Dm0755 "${srcdir}/uld/${_arch}/pstosecps" "${pkgdir}/usr/lib/cups/filter/pstosecps"
    install -Dm0755 "${srcdir}/uld/${_arch}/rastertospl" "${pkgdir}/usr/lib/cups/filter/rastertospl"
    ln -s rastertospl "${pkgdir}/usr/lib/cups/filter/rastertosplc"
}

package_xerox-spl-driver-scanner()
{
    depends=('xerox-spl-driver-common' 'libxml2' 'libusb-compat' 'sane')
    pkgdesc='Xerox driver for scanners. Also supports Phaser 6110MFP, WorkCentre 3210 3220 4118 PE120 PE220'

    while read LOCALE_I; do
	find "${srcdir}/uld/noarch/share/locale/${LOCALE_I}/LC_MESSAGES/" -type f -name 'sane-smfp.mo' -execdir install -Dm0644 {} "${pkgdir}/usr/share/locale/${LOCALE_I}/LC_MESSAGES/{}" \;
    done < <(ls "${srcdir}/uld/noarch/share/locale" 2>/dev/null)
    install -Dm0644 "${srcdir}/uld/${_arch}/libsane-smfp.so.1.0.1" "${pkgdir}/usr/lib/sane/libsane-smfp.so.1.0.1"
    ln -s libsane-smfp.so.1.0.1 "${pkgdir}/usr/lib/sane/libsane-smfp.so.1"
    ln -s libsane-smfp.so.1.0.1 "${pkgdir}/usr/lib/sane/libsane-smfp.so"
    # Игнорируем: pagesize.xml
    # Игнорируем: libsane-smfp.cfg

    find "${srcdir}/uld/noarch/etc" -type f -name 'smfp.conf' -execdir install -Dm0644 {} "${pkgdir}/etc/sane.d/{}" \;
    find "${srcdir}" -type l -name 'xerox_mfp-smfp.conf' -execdir install -Dm0644 {} "${pkgdir}/etc/sane.d/{}" \;

    install -dm0755 "${pkgdir}/etc/sane.d/dll.d"
    echo smfp > "${pkgdir}/etc/sane.d/dll.d/smfp-scanner"
    echo xerox_mfp-smfp > "${pkgdir}/etc/sane.d/dll.d/smfp-scanner-fix"

    install -dm0755 "${pkgdir}/usr/lib/udev/rules.d"
    (
        OEM_FILE="${srcdir}/uld/noarch/oem.conf"
        INSTALL_LOG_FILE=/dev/null
        source "${srcdir}/uld/noarch/scripting_utils"
        source "${srcdir}/uld/noarch/package_utils"
        source "${srcdir}/uld/noarch/scanner-script.pkg"
        fill_full_template "${srcdir}/uld/noarch/etc/smfp.rules.in" "${pkgdir}/usr/lib/udev/rules.d/60-smfp-xerox.rules"
        # Так как hal устарел и более не используется, то игнорируем: smfp.fdi.in
        chmod 644 "${pkgdir}/usr/lib/udev/rules.d/60-smfp-xerox.rules"
    )
    install -Dm0644 "${srcdir}/uld/noarch/oem.conf" "${pkgdir}/opt/xerox/scanner/share/oem.conf"
}
