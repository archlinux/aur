# Maintainer: dakataca <🐬danieldakataca@gmail.com>
# Contributor: Cristophero <cristophero.alvarado@gmail.com>
pkgname=pseint-bin
_pkgname=${pkgname%-*}
pkgver=20230517
pkgrel=1
pkgdesc="A tool for learning programming basis with a simple spanish pseudocode"
arch=('x86_64')
url='http://pseint.sourceforge.net'
license=('GPL2')
conflicts=('pseint')
depends=('gendesk' 'wxwidgets-gtk3')
noextract=(creator.psz)
source=("${_pkgname}-${pkgver}.tgz::https://cfhcable.dl.sourceforge.net/project/${_pkgname}/${pkgver}/${_pkgname}-l64-${pkgver}.tgz")
sha256sums=('1208bbf2247f0b5f89c0b6f85ee0ab9816a89c102a6d4ab7a041109b1425cb4d')  # 'makepkg -g' to generate it.

# Función 'prepare': Prepara el entorno antes de compilar el paquete.
prepare(){
    cd ${_pkgname}
    # Utilidad 'gendesk' para generar el archivo .desktop.
    gendesk -f -n \
        --pkgname="${_pkgname}" \
        --pkgdesc="${pkgdesc}" \
        --name="${_pkgname}" \
        --genericname="${_pkgname}" \
        --comment="${pkgdesc}" \
        --exec="${_pkgname}" \
        --path="/opt/${_pkgname}" \
        --icon="${_pkgname}" \
        --categories='Development,Education'
}

# Función 'pkgver': Devuelve la versión del paquete.
pkgver(){
    cd ${_pkgname}
    cat version
}

# Función 'package': Empaqueta los archivos compilados en el paquete final.
package(){
    cd ${_pkgname}
    # Crear ruta de destino transitoria.
    mkdir -p ${pkgdir}/opt/${_pkgname}
    # Copiar el contenido compilado a la ruta de destino transitoria.
    cp -rv . ${pkgdir}/opt/${_pkgname}
    # Instala el archivo .desktop en la ubicación (-t) adecuada.
    install -Dvm644 "${_pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
    # Instala el archivo de licencia en la ubicación adecuada.
    install -Dvm644 "imgs/icon.icns" "${pkgdir}/usr/share/pixmaps/${_pkgname}.icns"
    # Crea un archivo ejecutable en la ubicación /usr/bin/${pkgname} que ejecuta el programa wxPSeInt(pseint).
    install -Dvm755 <(echo -e '#!/usr/bin/env bash\n/opt/pseint/wxPSeInt') ${pkgdir}/usr/bin/${_pkgname}
}

## Test:
#  rm -rf pseint-* src/ pkg/

## References
# https://aur.archlinux.org/cgit/aur.git/tree/PKGBUILD?h=densify
# https://wiki.archlinux.org/title/Desktop_entries#How_to_use
# https://sourceforge.net/projects/pseint/files/
# https://sourceforge.net/projects/pseint/files/20210609/pseint-l64-20210609.tgz/download
# https://www.gnu.org/software/bash/manual/html_node/Process-Substitution.html
