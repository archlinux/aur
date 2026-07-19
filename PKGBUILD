# Maintainer: crux <a1956681558 at outlook dot com>
# Contributor: yjun <jerrysteve1101 at gmail dot com>


# depends comments
#
## java-runtime>=7 :
# The application requires the Java Runtime Environment 7u51 (or more recent) being installed.
## libusb :
# On Linux, the application relies on libusb-1.0, which must be installed separately.
## stlink (provides stlink udev rules) :
# On Linux, users must be granted with rights for accessing the ST-Link USB devices. To do that, it might be necessary to add rules into /etc/udev/rules.d.
# ---------------------------------------------
# src/stsw-link007/readme.txt


pkgname=stsw-link007
pkgver=3.17.11
pkgrel=1
pkgdesc="The firmware upgrade application for ST-LINK, ST-LINK/V2, ST-LINK/V2-1, and STLINK-V3 boards through the USB port"
arch=('x86_64')
url="https://www.st.com/en/development-tools/stsw-link007.html"
license=('LicenseRef-SLA0048')
depends=('java-runtime>=7' 'libusb' 'stlink')

_exec_file=STLinkUpgrade
_license_file="${license:11}_${pkgname^^}.pdf"
_pkg_file="${pkgname}-v${pkgver//./-}.zip"

source=(
    "$_pkg_file::$url"
    "$pkgname.sh"
    "$pkgname.png"
    "${_exec_file,,}.desktop"
    "https://www.st.com/resource/en/license/$_license_file"
)

sha256sums=(
    '51b76fcbf6b417d03c7cbfc9f029a2d1f463bd0200ee8f3d80764d45d735ee1c'
    '45e42bdedd3b2c1a312388e77c86e743a5ed2bf71a1b4678acc760380c853784'
    'a692a0956462419ba10a149c06e8be0f2e1a3e16dfb4b1ce06f9c612bf852d3c'
    '87693fd2356ba5aa912bf58fdfa0af00a527591cf616cff19cd694f69eba4a9c'
    'SKIP'
)


prepare() {
    if [ ! -f "${srcdir}/$_pkg_file" ]; then
        warning "-----------------------------------------------"
        warning "Please manually download $_pkg_file from:"
        warning "    $url"
        warning "Place it alongside the PKGBUILD and re-install."
        warning "-----------------------------------------------"
        exit 1
    fi
}


package() {
    # wrapper
    install -Dm755 ${srcdir}/$pkgname.sh ${pkgdir}/usr/bin/${_exec_file,,}

    # icon
    install -Dm644 ${srcdir}/$pkgname.png -t ${pkgdir}/usr/share/pixmaps/

    # license
    install -Dm644 ${srcdir}/$_license_file -t ${pkgdir}/usr/share/licenses/$pkgname

    # doc
    install -Dm644 ${srcdir}/$pkgname/readme.txt -t ${pkgdir}/usr/share/doc/$pkgname

    # desktop entry
    install -Dm644 "${srcdir}/${_exec_file,,}.desktop" "${pkgdir}/usr/share/applications/${_exec_file,,}.desktop"

    # ST-link upgrade
    install -Dm644 ${srcdir}/$pkgname/AllPlatforms/$_exec_file.jar -t ${pkgdir}/usr/share/java/$pkgname/
    install -Dm644 ${srcdir}/$pkgname/AllPlatforms/native/linux_x64/libSTLinkUSBDriver.so -t ${pkgdir}/usr/share/java/$pkgname/native/linux_x64/
}
