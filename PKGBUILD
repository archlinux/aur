# Maintainer: Alexis Polti <ArchSegger at gmail dot com>
# Maintainer: pzl <alsoelp at gmail dot com>

pkgname=ozone
pkgver=2.16
pkgrel=1
epoch=1
pkgdesc="Segger Ozone JLink debugger for Linux"
arch=('i686' 'x86_64')
license=('custom')
groups=('jlink')
replaces=('jlink-debugger')
depends=('qt4' 'jlink-software-and-documentation>=5.10n')
source_x86_64=("Ozone_Linux_V${pkgver/./}_x86_64.tgz::https://download.segger.com/J-Link/J-LinkDebugger/Ozone_Linux_V${pkgver/./}_x86_64.tgz")
source_i686=("Ozone_Linux_V${pkgver/./}_i686.tgz::https://download.segger.com/J-Link/J-LinkDebugger/Ozone_Linux_V${pkgver/./}_i386.tgz")
md5sums_i686=('4beea0e613e3da91f2fbdcdae43b79b3')
md5sums_x86_64=('3e2c2a4ed5199b9aa8d1e1e9204cd1c0')
url="https://www.segger.com/jlink-software.html"


package(){
    if [ ${CARCH} = "i686" ]; then
        mv Ozone_Linux_V${pkgver/./}_i386 Ozone
    else
        mv Ozone_Linux_V${pkgver/./}_x86_64 Ozone
    fi

    # Match package placement from their .deb, in /opt
    install -dm755 "${pkgdir}/opt/SEGGER/Ozone" \
            "${pkgdir}/usr/share/licenses/${pkgname}" \
            "${pkgdir}/usr/lib/" \
            "${pkgdir}/usr/bin/" \
            "${pkgdir}/usr/share/doc/${pkgname}/"

    cd ${srcdir}/Ozone*

    # Remove un-needed files
    find . -name ".svn" | xargs rm -rf

    # Bulk copy everything except libs
    cp --preserve=mode -r Ozone Plugins Doc Config Lib "${pkgdir}/opt/SEGGER/Ozone"

    # Create links where needed
    ln -s /opt/SEGGER/Ozone/Doc/License.txt "${pkgdir}/usr/share/licenses/${pkgname}/"
    ln -s /opt/SEGGER/Ozone/Ozone "${pkgdir}/usr/bin"
    ln -s /opt/SEGGER/Ozone/JLinkDebugger "${pkgdir}/usr/bin"

    for f in Doc/*; do
        ln -s /opt/SEGGER/Ozone/"$f" "${pkgdir}/usr/share/doc/${pkgname}"
    done
}
