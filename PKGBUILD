# Maintainer: Alexis Polti <ArchSegger at gmail dot com>
# Maintainer: pzl <alsoelp at gmail dot com>

pkgname=jlink-systemview
pkgver=2.28
pkgrel=2
pkgdesc="Segger SystemView for Linux"
arch=('i686' 'x86_64')
license=('custom')
groups=('jlink-tools')
depends=('qt4' 'jlink-software-and-documentation')
source=("cookie::https://www.segger.com/downloads/login")
source_x86_64=("SystemView_Linux_V${pkgver/./}_x86_64.tgz::https://www.segger.com/downloads/free_tools/SystemView_Linux_V${pkgver/./}_x86_64.tgz")
source_i686=("SystemView_Linux_V${pkgver/./}_i686.tgz::https://www.segger.com/downloads/free_tools/SystemView_Linux_V${pkgver/./}_i386.tgz")
md5sums=('SKIP')
md5sums_i686=('f3f79e24bfa17f67d4d7089a47c80bc1')
md5sums_x86_64=('aeb2d2dcfa052acd7b783aea3f80fd5b')
url=("https://www.segger.com/downloads/free_tools")
DLAGENTS=("https::/usr/bin/env curl -c cookie -d name=archsegger@free.fr -d password=QfNDbvDUa7 %u -o %o")
_carch=${CARCH}
if [ ${CARCH} = "i686" ]; then
    _carch="i386"
fi

_jlinkdir=SystemView_Linux_V${pkgver/./}_${_carch}

package(){
    # Cleanup
    rm -f cookie

    # Match package placement from their .deb, in /opt
    install -dm755 "${pkgdir}/opt/SEGGER/${_jlinkdir}" \
            "${pkgdir}/usr/share/licenses/${pkgname}" \
            "${pkgdir}/usr/bin/" \
            "${pkgdir}/usr/share/doc/${pkgname}/"

    cd ${srcdir}/SystemView*

    # Bulk copy everything
    cp --preserve=mode -r SystemViewer description Doc SampleTraces "${pkgdir}/opt/SEGGER/${_jlinkdir}"

    # Create links where needed
    ln -s /opt/SEGGER/${_jlinkdir}/Doc/License_SystemView.txt "${pkgdir}/usr/share/licenses/${pkgname}/"
    ln -s /opt/SEGGER/${_jlinkdir}/SystemViewer "${pkgdir}/usr/bin"

    for f in Doc/*; do
        ln -s /opt/SEGGER/${_jlinkdir}/"$f" "${pkgdir}/usr/share/doc/${pkgname}"
    done
}
