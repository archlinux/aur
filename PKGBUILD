# Maintainer: Alexis Polti <ArchSegger at gmail dot com>
# Maintainer: pzl <alsoelp at gmail dot com>

pkgname=jlink-debugger
pkgver=2.12a
pkgrel=2
pkgdesc="Segger JLink debugger for Linux"
arch=('i686' 'x86_64')
license=('custom')
groups=('jlink')
depends=('qt4' 'jlink-software-and-documentation')
source_x86_64=("JLinkDebugger_Linux_V${pkgver/./}_x86_64.tgz::https://download.segger.com/J-Link/J-LinkDebugger/JLinkDebugger_Linux_V${pkgver/./}_x86_64.tgz")
source_i686=("JLinkDebugger_Linux_V${pkgver/./}_i686.tgz::https://download.segger.com/J-Link/J-LinkDebugger/JLinkDebugger_Linux_V${pkgver/./}_i386.tgz")
md5sums_x86_64=('ee2aa405fdd9274fb6fbf256c937174a')
md5sums_i686=('3799578b61df97c26e1294587e19193f')
url="https://www.segger.com/jlink-software.html"


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
}
