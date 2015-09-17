# Maintainer: MadPhysicist <jfoxrabinovitz at gmail dot com>
pkgname=kyocera-cups
pkgver=8.1404
pkgrel=2
pkgdesc='PPD drivers for Kyocera and UTAX TaskAlfa (TA) printers'
arch=('i686' 'x86_64')
url='http://usa.kyoceradocumentsolutions.com/americas/jsp/Kyocera/resource_details.jsp?pid=25595&rid=27560'
license=('custom')
groups=()
depends=('cups')
makedepends=('unzip')
optdepends=()
provides=()
conflicts=('kyocera-fs-c2x26mfp' 'kyocera-fs1128mfp' 'kyocera-fs1370dn' 'kyocera-ta266ci-cups')
replaces=()
backup=()
options=()
install=kyocera-cups.install
changelog=
source=('http://usa.kyoceradocumentsolutions.com/americas/jsp/upload/resource/27560/0/Kyocera%20Linux%20PPD%20Ver%208.1404.tar.gz')
noextract=
sha1sums=('bb6a30802f3b945e023a3f1fcdf69e1b6f5fd92d')

prepare() {
    cd "${srcdir}/Kyocera Linux PPD Ver 8.1404"
    tar -xzf KyoceraLinuxPackages-20141229.tar.gz -C ..
    tar -xzf TALinuxPackages-20141229.tar.gz -C ..
}

package() {
    # Set number of bits: '32bit' or '64bit', depending on ${CARCH}
    if [ "${CARCH}" = "x86_64" ]; then
	    _bittage='64bit'
    else
	    _bittage='32bit'
    fi

    # Set language name: Default is English
    # Valid options are: English, French, German, Italian, Portuguese, Spanish
    # Options are result of `ls LinuxPackages/${_bittage}/Global`
    _language='English'

    # LICENSES.txt documents are identical, copy only one of them:
    install -dm755 ${pkgdir}/usr/share/licenses/${pkgname}
    install -m644 ${srcdir}/LinuxPackages/LICENSES.txt ${pkgdir}/usr/share/licenses/${pkgname}/LICENSES.txt

    # Install regular and TA PPDs
    install -dm755 ${pkgdir}/usr/share/cups/model/Kyocera
    install -dm755 ${pkgdir}/usr/share/cups/model/UTAX_TA
    install -m644 ${srcdir}/LinuxPackages/${_bittage}/Global/${_language}/PPDs/*.[pP][pP][dD] ${pkgdir}/usr/share/cups/model/Kyocera
    install -m644 ${srcdir}/LinuxPackagesTA/${_bittage}/Global/${_language}/PPDs/*.[pP][pP][dD] ${pkgdir}/usr/share/cups/model/UTAX_TA

    # kyofilter_C programs are identical for a given bittage, copy only one of them:
    install -dm755 ${pkgdir}/usr/lib/cups/filter
    install -m755 ${srcdir}/LinuxPackages/${_bittage}/Global/${_language}/filter/kyofilter_C ${pkgdir}/usr/lib/cups/filter
}
