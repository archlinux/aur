# Maintainer: Alexis Polti <ArchSegger at gmail dot com>
# Maintainer: pzl <alsoelp at gmail dot com>

pkgname=jlink-debugger
pkgver=2.10d
pkgrel=4
pkgdesc="Segger JLink debugger for Linux"
arch=('i686' 'x86_64')
license=('custom')
groups=('jlink')
depends=('qt4' 'jlink-software-and-documentation')
source_x86_64=("JLinkDebugger_Linux_V${pkgver/./}_x86_64.tgz::https://download.segger.com/J-Link/J-LinkDebugger/JLinkDebugger_Linux_V${pkgver/./}_x86_64.tgz")
source_i686=("JLinkDebugger_Linux_V${pkgver/./}_i686.tgz::https://download.segger.com/J-Link/J-LinkDebugger/JLinkDebugger_Linux_V${pkgver/./}_i386.tgz")
md5sums_x86_64=('7eb6b0d443af2bd37b1858f7f63b72f9')
md5sums_i686=('acf78018dbf2c66510d058bfbeb91be8')
url=("https://www.segger.com/jlink-software.html")


package(){
    if [ ${CARCH} = "i686" ]; then
        mv JLinkDebugger_Linux_V${pkgver/./}_i386 JLinkDebugger
    else
        mv JLinkDebugger_Linux_V${pkgver/./}_x86_64 JLinkDebugger
    fi

    # Match package placement from their .deb, in /opt
    install -dm755 "${pkgdir}/opt/SEGGER/JLinkDebugger" \
            "${pkgdir}/usr/share/licenses/${pkgname}" \
            "${pkgdir}/usr/lib/" \
            "${pkgdir}/usr/bin/" \
            "${pkgdir}/usr/share/doc/${pkgname}/"

    cd ${srcdir}/JLinkDebugger*

    # Remove un-needed files
    find . -name ".svn" | xargs rm -rf

    # Bulk copy everything
    cp --preserve=mode -r JLinkDebugger Plugins Doc Config "${pkgdir}/opt/SEGGER/JLinkDebugger"

    # Create links where needed
    ln -s /opt/SEGGER/JLinkDebugger/Doc/License.txt "${pkgdir}/usr/share/licenses/${pkgname}/"
    ln -s /opt/SEGGER/JLinkDebugger/JLinkDebugger "${pkgdir}/usr/bin"

    for f in Doc/*; do
        ln -s /opt/SEGGER/JLinkDebugger/"$f" "${pkgdir}/usr/share/doc/${pkgname}"
    done

    # Ensure we have the latest jlinkarm library
    ln -s "/usr/lib/libjlinkarm.so.5" "${pkgdir}/usr/lib/libjlinkarm.so.4"
}
