# Maintainer: Alexis Polti <ArchSegger at gmail dot com>
# Maintainer: pzl <alsoelp at gmail dot com>

pkgname=jlink-systemview
pkgver=3.60d
pkgrel=0
epoch=10
pkgdesc="Segger SystemView for Linux"
arch=('x86_64')
license=('custom')
groups=('jlink')
depends=('jlink-software-and-documentation' 'jlink-systemview-target-src')
source=("file://SystemView_Linux_V${pkgver/./}_x86_64.tgz" "SystemView.desktop" "SystemView.svg")
md5sums=('f2c586f748569d55b3de4e9e05bfff82' '89e75b3008c53de7fc22c00da5abba01' '54635efec35cdbb6f60b997a8fceee74')
url="https://www.segger.com/downloads/jlink/"

package(){
    # Cleanup
    rm -f cookie

    # Change src path name
    mv SystemView_Linux_V${pkgver/./}_x86_64 SystemView

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
