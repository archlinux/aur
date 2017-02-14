# Maintainer: Alexis Polti <ArchSegger at gmail dot com>
# Maintainer: pzl <alsoelp at gmail dot com>

pkgname=jlink-systemview
pkgver=2.40d
pkgrel=1
epoch=3
pkgdesc="Segger SystemView for Linux"
arch=('i686' 'x86_64')
license=('custom')
groups=('jlink')
depends=('qt4' 'jlink-software-and-documentation')
source=("cookie::https://www.segger.com/downloads/login")
source_x86_64=("SystemView_Linux_V${pkgver/./}_x86_64.tgz::https://www.segger.com/downloads/free_tools/SystemView_Linux_V${pkgver/./}_x86_64.tgz")
source_i686=("SystemView_Linux_V${pkgver/./}_i686.tgz::https://www.segger.com/downloads/free_tools/SystemView_Linux_V${pkgver/./}_i386.tgz")
md5sums=('SKIP')
md5sums_i686=('1e94fc4ace21c27e35718324a1ff12cb')
md5sums_x86_64=('eeb073711fc9baa5e941cb420a6b8725')
url="https://www.segger.com/downloads/free_tools"
DLAGENTS=("https::/usr/bin/env curl -c cookie -d name=archsegger@free.fr -d password=QfNDbvDUa7 %u -o %o")

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
            "${pkgdir}/usr/share/doc/${pkgname}/"

    cd ${srcdir}/SystemView

    # Bulk copy everything
    cp --preserve=mode -r SystemView Description Doc Sample "${pkgdir}/opt/SEGGER/SystemView"

    # Create links where needed
    ln -s /opt/SEGGER/SystemView/Doc/License_SystemView.txt "${pkgdir}/usr/share/licenses/${pkgname}/"
    ln -s /opt/SEGGER/SystemView/SystemView "${pkgdir}/usr/bin"

    for f in Doc/*; do
        ln -s /opt/SEGGER/SystemView/"$f" "${pkgdir}/usr/share/doc/${pkgname}"
    done
}
