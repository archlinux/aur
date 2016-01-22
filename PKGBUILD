# Maintainer: Alexis Polti <ArchSegger at gmail dot com>

pkgname=jlink-software-and-documentation
pkgver=5.10g
pkgrel=1
pkgdesc="Official Segger JLink software & documentation pack for Linux"
arch=('i686' 'x86_64')
license=('custom')
groups=('jlink-tools')
depends=('glibc')
source_x86_64=("JLink_Linux_${pkgver/./}_x86_64.tgz::https://www.segger.com/jlink-software.html?step=1&file=JLinkLinuxTGZ64_${pkgver/./}")
source_i686=("JLink_Linux_${pkgver/./}_i686.tgz::https://www.segger.com/jlink-software.html?step=1&file=JLinkLinuxTGZ32_${pkgver/./}")
source=('99-jlink.rules.patch')
md5sums=('9250383b1a8ba81d06e7479c48b571ac')
md5sums_i686=('5969ff903263c2efbc43cae11a1bd8e7')
md5sums_x86_64=('387771245e86d8e5462c993c2065948e')
install=$pkgname.install
url=("https://www.segger.com/jlink-software.html")
conflicts=("j-link-software-and-documentation" "jlink")
replaces=("j-link-software-and-documentation" "jlink")
DLAGENTS=("https::/usr/bin/env curl -o %o -d agree=1 -d confirm=yes ")
_carch=${CARCH}
if [ ${CARCH} = "i686" ]; then
    _carch="i386"
fi

_jlinkdir=JLink_Linux_V${pkgver/./}_${_carch}

prepare() {
    # Remove `BUS!="usb"` from udev rules. BUS isn't valid anymore
    cd ${srcdir}/${_jlinkdir}
    patch -uN 99-jlink.rules ../99-jlink.rules.patch
}

package(){
    # Match package placement from their .deb, in /opt
    install -dm755 "${pkgdir}/opt/SEGGER/${_jlinkdir}" \
            "${pkgdir}/usr/share/licenses/${pkgname}" \
            "${pkgdir}/usr/lib/" \
            "${pkgdir}/usr/bin/" \
            "${pkgdir}/etc/udev/rules.d/" \
            "${pkgdir}/usr/share/doc/${pkgname}/"

    cd ${srcdir}/${_jlinkdir}

    # Bulk copy everything
    cp --preserve=mode -r J* Doc Samples README.txt "${pkgdir}/opt/SEGGER/${_jlinkdir}"

    # Create links where needed
    ln -s /opt/SEGGER/${_jlinkdir}/Doc/License.txt "${pkgdir}/usr/share/licenses/${pkgname}/"
    install -Dm644 99-jlink.rules "${pkgdir}/etc/udev/rules.d/"
    install -Dm755 libjlinkarm.so.*.* "${pkgdir}/usr/lib/"
    ln -s "/usr/lib/libjlinkarm.so.*.*" "${pkgdir}/usr/lib/libjlinkarm.so.${pkgver:0:1}"

    for f in J*; do
        ln -s /opt/SEGGER/${_jlinkdir}/"$f" "${pkgdir}/usr/bin"
    done

    for f in Doc/*; do
        ln -s /opt/SEGGER/${_jlinkdir}/"$f" "${pkgdir}/usr/share/doc/${pkgname}"
    done
}
