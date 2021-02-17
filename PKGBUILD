# Maintainer: Hans-Nikolai Viessmann <hans AT viess DOT mn>
_pkgname=saxpsa
pkgname=latex-${_pkgname}-ok
pkgver=13.03.2007
pkgrel=7
pkgdesc="Provides Type 1 font compatible with displaying APL."
arch=('any')
url="http://olegykj.sourceforge.net/"
license=('custom')
depends=('texlive-core')
source=("http://olegykj.sourceforge.net/fonts/${_pkgname}_ok.zip"
        "http://www.snakeisland.com/aplfont.tar"
        "${_pkgname}.maps")
md5sums=('4d9fdeb829303fdcde2d9cce9a8e69d4'
         '64399e8274fbbc4d8cb3f18f5af62d8c'
         '611ca8dc62dc619604afc0be0fe13cb8')

prepare () {
    cd ${srcdir}/${_pkgname}

    # rename map file, pdftex.map is otherwise a protected name
    mv texmf/fonts/map/pdftex/${_pkgname}/{pdftex.map,${_pkgname}.map}

    # switch to actual T1 specification
    mv OT1saxpsa.fd T1saxpsa.fd
    sed -i -e 's/OT1/T1/g' T1saxpsa.fd ${_pkgname}.sty
}

package() {
    # copy over font files
    install -d ${pkgdir}/usr/share/texmf/tex/latex/${_pkgname}/
    cp -r --no-preserve=mode ${_pkgname}/texmf ${pkgdir}/usr/share/

    # copy over STY & OT1 definition
    cp --no-preserve=mode ${_pkgname}/${_pkgname}.sty ${pkgdir}/usr/share/texmf/tex/latex/${_pkgname}/
    cp --no-preserve=mode ${_pkgname}/T1saxpsa.fd ${pkgdir}/usr/share/texmf/tex/latex/${_pkgname}/

    # create dir and copy global MAPS file
    install -d ${pkgdir}/var/lib/texmf/arch/installedpkgs/
    cp --no-preserve=mode "${_pkgname}.maps" ${pkgdir}/var/lib/texmf/arch/installedpkgs/

    # set license
    install -d ${pkgdir}/usr/share/licenses/${pkgname}
    cp --no-preserve=mode ${_pkgname}/readme.txt ${pkgdir}/usr/share/licenses/${pkgname}/license.txt
}
