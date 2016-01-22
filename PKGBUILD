# Maintainer: Alexis Polti <ArchSegger at gmail dot com>
# Maintainer: pzl <alsoelp at gmail dot com>

pkgname=jlink-debugger
pkgver=2.10d
pkgrel=2
pkgdesc="Official Segger JLink debugger for Linux"
arch=('i686' 'x86_64')
license=('custom')
groups=('jlink-tools')
depends=('qt4' 'jlink-software-and-documentation')
source_x86_64=("JLinkDebugger_Linux_V${pkgver/./}_x86_64.tgz::https://download.segger.com/J-Link/J-LinkDebugger/JLinkDebugger_Linux_V${pkgver/./}_x86_64.tgz")
source_i686=("JLinkDebugger_Linux_V${pkgver/./}_i686.tgz::https://download.segger.com/J-Link/J-LinkDebugger/JLinkDebugger_Linux_V${pkgver/./}_i386.tgz")
md5sums_x86_64=('7eb6b0d443af2bd37b1858f7f63b72f9')
md5sums_i686=('acf78018dbf2c66510d058bfbeb91be8')
url=("https://www.segger.com/jlink-software.html")
_carch=${CARCH}
if [ ${CARCH} = "i686" ]; then
    _carch="i386"
fi

_jlinkdir=JLinkDebugger_Linux_V${pkgver/./}_${_carch}

package(){
    # Match package placement from their .deb, in /opt
    install -dm755 "${pkgdir}/opt/SEGGER/${_jlinkdir}" \
            "${pkgdir}/usr/share/licenses/${pkgname}" \
            "${pkgdir}/usr/lib/" \
            "${pkgdir}/usr/bin/" \
            "${pkgdir}/usr/share/doc/${pkgname}/"

    cd ${srcdir}/JLinkDebugger*

    # Remove un-needed files
    find . -name ".svn" | xargs rm -rf

    # Bulk copy everything
    cp --preserve=mode -r JLinkDebugger Plugins Doc Config "${pkgdir}/opt/SEGGER/${_jlinkdir}"

    # Create links where needed
    ln -s /opt/SEGGER/${_jlinkdir}/Doc/License.txt "${pkgdir}/usr/share/licenses/${pkgname}/"
    ln -s /opt/SEGGER/${_jlinkdir}/JLinkDebugger "${pkgdir}/usr/bin"
    ln -s "/usr/lib/libjlinkarm.so.5" "${pkgdir}/usr/lib/libjlinkarm.so.4"

    for f in Doc/*; do
        ln -s /opt/SEGGER/${_jlinkdir}/"$f" "${pkgdir}/usr/share/doc/${pkgname}"
    done
}
