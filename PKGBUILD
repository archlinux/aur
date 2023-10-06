# Maintainer: dakataca <🐬danieldakataca@gmail.com>
# Contributor: Cristophero <cristophero.alvarado@gmail.com>

pkgname='pseint'
pkgver=20230517
pkgrel=1
pkgdesc='A tool for learning programming basis with a simple spanish pseudocode.'
arch=('x86_64')
url='https://sourceforge.net/projects/pseint'
license=('GPL2')
conflicts=("$pkgname-bin")
makedepends=('gendesk')
depends=('wxwidgets-gtk3' 'rsync')
noextract=(creator.psz)
source=("https://netactuate.dl.sourceforge.net/project/$pkgname/$pkgver/$pkgname-src-$pkgver.tgz")
sha256sums=('f3373b0ad0d0f518d72c05504e282cb4fa9d0c9b11f1f7c1a29c4117354ff9e2')  # 'makepkg -g' to generate it.


# Función 'prepare': Prepara el entorno antes de compilar el paquete.
prepare(){
    cd $pkgname

    # Utilidad 'gendesk' para generar el archivo .desktop.
    gendesk -f -n \
        --pkgname="$pkgname" \
        --pkgdesc="$pkgdesc" \
        --name="$pkgname" \
        --genericname="$pkgname" \
        --comment="$pkgdesc" \
        --exec="$pkgname" \
        --path="/opt/$pkgname" \
        --icon="$pkgname" \
        --categories='Development,Education'
}


# Función 'pkgver': Devuelve la versión del paquete.
pkgver(){
    cd $pkgname
    cat "bin/version"
}


# Función 'build': Compila el paquete.
build(){
    cd $pkgname

    # Obtener la versión de wx-config.
    local -r wxconfig_version=$(wx-config --version | sed -E 's/([0-9]\.[0-9])(\.[0-9])*/\1/')

    # Reemplazar la versión de wx-config en los archivos Makefile.
    sed -Ei \
        "s/(--version=)[0-9](\.[0-9])*/\1$wxconfig_version/g ; \
        s,bin(/bin),\1," \
        $srcdir/$pkgname/ps{eval,term,draw{E,3}}/Makefile

    # Compilar el paquete con la opción ARCH=lnx, para la arquitectura linux.
    make ARCH=lnx
}


# Función 'package': Empaqueta los archivos compilados en el paquete final.
package(){
    cd "$pkgname"

    # Crear el directorio de destino y copiar en él, el contenido de pseint.
    rsync -a bin/ --mkpath "$pkgdir/opt/$pkgname/"

    # Instalar el archivo .desktop en la ubicación (-t) adecuada.
    install -Dvm644 "$pkgname.desktop" -t "$pkgdir/usr/share/applications/"

    # Instalar el archivo de licencia en la ubicación adecuada.
    install -Dvm644 license.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

    # Crear un archivo ejecutable en /usr/bin/$pkgname que ejecuta el programa wxPSeInt(pseint).
    install -Dvm755 <(echo -e '#!/usr/bin/env bash\n/opt/pseint/wxPSeInt') $pkgdir/usr/bin/$pkgname
}


## Test
# rm -rf pseint-* src/ pkg/
# makepkg --printsrcinfo > .SRCINFO

## References
# https://aur.archlinux.org/cgit/aur.git/tree/PKGBUILD?h=densify
# https://wiki.archlinux.org/title/Desktop_entries#How_to_use
# https://sourceforge.net/p/pseint/code/ci/master/tree/fuentes.txt
# https://sourceforge.net/p/pseint/code/ci/master/tree/
# https://askubuntu.com/questions/1060601/is-there-a-way-to-create-a-script-and-make-it-executable-in-less-code-than-this#comment1736560_1060642
# https://www.gnu.org/software/bash/manual/html_node/Process-Substitution.html
