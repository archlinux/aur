# Maintainer: dakataca <🐬danieldakataca@gmail.com>
# Contributor: Cristophero <cristophero.alvarado@gmail.com>
pkgname='pseint'
pkgver=20230517
pkgrel=1
pkgdesc="A tool for learning programming basis with a simple spanish pseudocode."
arch=('x86_64')
url='https://sourceforge.net/projects/pseint'
license=('GPL2')
conflicts=('pseint-bin')
depends=('gendesk' 'wxwidgets-gtk3')
noextract=(creator.psz)
source=("https://netactuate.dl.sourceforge.net/project/${pkgname}/${pkgver}/${pkgname}-src-${pkgver}.tgz")
sha256sums=('f3373b0ad0d0f518d72c05504e282cb4fa9d0c9b11f1f7c1a29c4117354ff9e2')  # 'makepkg -g' to generate it.

# Función 'prepare': Prepara el entorno antes de compilar el paquete.
prepare(){
    cd ${pkgname}
    # Utilidad 'gendesk' para generar el archivo .desktop.
    gendesk -f -n \
        --pkgname="${pkgname}" \
        --pkgdesc="${pkgdesc}" \
        --name="${pkgname}" \
        --genericname="${pkgname}" \
        --comment="${pkgdesc}" \
        --exec="${pkgname}" \
        --path="/opt/${pkgname}" \
        --icon="${pkgname}" \
        --categories='Development,Education'
}

# Función 'pkgver': Devuelve la versión del paquete.
pkgver(){
    cd ${pkgname}
    cat "bin/version"
}

# Función 'build': Compila el paquete.
build(){
    cd ${pkgname}
    # Obtiene la versión de wx-config.
    local -r wxconfig_version=$(wx-config --version | sed -E 's/([0-9]\.[0-9])(\.[0-9])*/\1/')
    # Reemplaza la versión de wx-config en los archivos Makefile.
    sed -Ei \
        "s/(--version=)[0-9](\.[0-9])*/\1${wxconfig_version}/g ; \
        s,bin(/bin),\1," \
        ${srcdir}/${pkgname}/ps{eval,term,draw{E,3}}/Makefile
    # Compila el paquete con la opción ARCH=lnx, para la arquitectura linux.
    make ARCH=lnx
 }

# Función 'package': Empaqueta los archivos compilados en el paquete final.
package(){
    cd "${pkgname}"
    # Crear ruta de destino transitoria.
    mkdir -p ${pkgdir}/opt/${pkgname}
    # Copiar el contenido compilado a la ruta de destino transitoria.
    cp -rv bin/* ${pkgdir}/opt/${pkgname}
    # Instala el archivo .desktop en la ubicación (-t) adecuada.
    install -Dvm644 "${pkgname}.desktop" -t "${pkgdir}/usr/share/applications/"
    # Instala el archivo de licencia en la ubicación adecuada.
    install -Dvm644 license.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    # Crea un archivo ejecutable en la ubicación /usr/bin/${pkgname} que ejecuta el programa wxPSeInt(pseint).
    install -Dvm755 <(echo -e '#!/usr/bin/env bash\n/opt/pseint/wxPSeInt') ${pkgdir}/usr/bin/${pkgname}
}

## Test
# rm -rf pseint-* src/ pkg/

## References
# https://aur.archlinux.org/cgit/aur.git/tree/PKGBUILD?h=densify
# https://wiki.archlinux.org/title/Desktop_entries#How_to_use
# https://sourceforge.net/p/pseint/code/ci/master/tree/fuentes.txt
# https://sourceforge.net/p/pseint/code/ci/master/tree/
# https://askubuntu.com/questions/1060601/is-there-a-way-to-create-a-script-and-make-it-executable-in-less-code-than-this#comment1736560_1060642
# https://www.gnu.org/software/bash/manual/html_node/Process-Substitution.html
