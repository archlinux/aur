# Maintainer: Alexis Polti <ArchSegger at gmail dot com>
# Maintainer: pzl <alsoelp at gmail dot com>

pkgname=jlink-systemview
pkgver=3.40
pkgrel=0
epoch=6
pkgdesc="Segger SystemView for Linux"
arch=('i686' 'x86_64')
license=('custom')
groups=('jlink')
depends=('jlink-software-and-documentation' 'jlink-systemview-target-src')
source_x86_64=("SystemView_Linux_V${pkgver/./}_x86_64.tgz::https://www.segger.com/downloads/systemview/systemview_linux_tgz64")
source_i686=("SystemView_Linux_V${pkgver/./}_i686.tgz::https://www.segger.com/downloads/systemview/systemview_linux_tgz32")
source=("SystemView.desktop" "SystemView.svg")
md5sums_x86_64=('f11abb07e11cf23c856a9e190ee74d88')
md5sums_i686=('d80148245d3678011e19db23aec82024')
md5sums=('89e75b3008c53de7fc22c00da5abba01' '54635efec35cdbb6f60b997a8fceee74')
url="https://www.segger.com/downloads/jlink/"

package(){
    # Cleanup
    rm -f cookie

    # Change src path name
    if [ ${CARCH} = "i686" ]; then
        mv SystemView_Linux_V${pkgver/./}_i386 SystemView
    else
        mv SystemView_Linux_V${pkgver/./}_x86_64 SystemView
    fi

    # Match package placement from their .deb, in /opt
    install -dm755 "${pkgdir}/opt/SEGGER/SystemView" \
            "${pkgdir}/usr/share/licenses/${pkgname}" \
            "${pkgdir}/usr/bin/" \
            "${pkgdir}/usr/share/doc/${pkgname}/" \
            "${pkgdir}/usr/share/pixmaps" \
            "${pkgdir}/usr/share/applications"


    # Install desktop entry
    rm -f "${pkgdir}/usr/share/applications/SystemView.desktop"
    install -Dm644 "SystemView.desktop" "${pkgdir}/usr/share/applications/JLink\ SystemView.desktop"
    install -Dm644 "SystemView.svg" "${pkgdir}/usr/share/pixmaps/SystemView.svg"


    cd ${srcdir}/SystemView

    # Bulk copy everything
    cp --preserve=mode -r SystemView Description Doc Sample lib* "${pkgdir}/opt/SEGGER/SystemView"

    # Create links where needed
    ln -s /opt/SEGGER/SystemView/Doc/License_SystemView.txt "${pkgdir}/usr/share/licenses/${pkgname}/"
    ln -s /opt/SEGGER/SystemView/SystemView "${pkgdir}/usr/bin"

    for f in Doc/*; do
        ln -s /opt/SEGGER/SystemView/"$f" "${pkgdir}/usr/share/doc/${pkgname}"
    done

}
