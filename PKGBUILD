# Maintainer: Ilja Kocken <i.j.kocken at uu dot com>
pkgname=easotope
_filename=easotope_client_linux_x86_64
pkgver=20170328
pkgrel=1
pkgdesc="Client for making isotopes easy"
arch=('x86_64')
url="http://easotope.org"
license=('GPL3')
depends=('java-runtime')
source=("${url}/release/${pkgver}/${_filename}.tar.gz"
	"${pkgname}.desktop"
	"${pkgname}"
	"logo_48.png")
noextract=("${_filename}.tar.gz")
md5sums=('551fa31f35dda2972369da6066ead6c8'
         '757ac44666b2be9b2994dae8dc099ba3'
         '857a4643a7bfdd8444055c3e6308ee71'
         '35db741960c2d1edd88d3c4f2a47d028')

package () {
    # make the lib directory and unpack there
    mkdir -p "${pkgdir}/usr/lib/"
    bsdtar -zxf "${srcdir}/${_filename}.tar.gz" -C "${pkgdir}/usr/lib"

    # correct package name
    mv "${pkgdir}/usr/lib/${pkgname}_client" "${pkgdir}/usr/lib/${pkgname}"

    # set database variable directory
    mkdir -p "${HOME}/.easotope"
    sed -i "/-clearPersistedState/a -data \n${HOME}/.easotope" "${pkgdir}/usr/lib/${pkgname}/linux.gtk.${CARCH}/eclipse/${pkgname}.ini"

    # make the binary executable
    chmod 755 "${pkgdir}/usr/lib/${pkgname}/linux.gtk.${CARCH}/eclipse/${pkgname}"

    # database/log directory
    mkdir -p "${HOME}/.easotope"
    
    # shell script for launch
    mkdir -p "${pkgdir}/usr/bin"
    mv easotope "${pkgdir}/usr/bin"
    chmod 755 "${pkgdir}/usr/bin/${pkgname}"

    # icon
    mkdir -p "${pkgdir}/usr/share/pixmaps"
    mv logo_48.png "${pkgdir}/usr/share/pixmaps/easotope.png"

    # desktop entry
    mkdir -p "${pkgdir}/usr/share/applications"
    mv easotope.desktop "${pkgdir}/usr/share/applications"
}
