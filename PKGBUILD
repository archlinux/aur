# Maintainer: dakataca <🐬danieldakataca@gmail.com>
# Contributor: Cristophero <cristophero.alvarado@gmail.com>

_pkgname=pseint-bin
pkgname=${_pkgname%-*}
pkgver=20230517
pkgrel=1
pkgdesc="A tool for learning programming basis with a simple spanish pseudocode"
arch=('x86_64')
url='http://pseint.sourceforge.net'
license=('GPL2')
conflicts=("$pkgname")
makedepends=('gendesk')
depends=('wxwidgets-gtk3')
noextract=(creator.psz)
source=("$pkgname-$pkgver.tgz::https://cfhcable.dl.sourceforge.net/project/$pkgname/$pkgver/$pkgname-l64-$pkgver.tgz")
sha256sums=('1208bbf2247f0b5f89c0b6f85ee0ab9816a89c102a6d4ab7a041109b1425cb4d')  # 'makepkg -g' to generate it.


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
    cat version
}


# Función 'package': Empaqueta los archivos compilados en el paquete final.
package(){
    cd $pkgname

    # Crear ruta de destino transitoria.
    mkdir -p $pkgdir/opt/$pkgname

    # Copiar el contenido compilado a la ruta de destino transitoria.
    cp -rv . $pkgdir/opt/$pkgname

    # Instala el archivo .desktop en la ubicación (-t) adecuada.
    install -Dvm644 "$pkgname.desktop" -t "$pkgdir/usr/share/applications"

    # Instala el archivo de licencia en la ubicación adecuada.
    install -Dvm644 "imgs/icon.icns" "$pkgdir/usr/share/pixmaps/$pkgname.icns"

    # Crea un archivo ejecutable en la ubicación /usr/bin/$pkgname que ejecuta el programa wxPSeInt(pseint).
    install -Dvm755 <(echo -e '#!/usr/bin/env bash\n/opt/pseint/wxPSeInt') $pkgdir/usr/bin/$pkgname
}


## Test:
# rm -rf pseint-* src/ pkg/
# makepkg --printsrcinfo > .SRCINFO

## References
# https://aur.archlinux.org/cgit/aur.git/tree/PKGBUILD?h=densify
# https://wiki.archlinux.org/title/Desktop_entries#How_to_use
# https://sourceforge.net/projects/pseint/files/
# https://sourceforge.net/projects/pseint/files/20210609/pseint-l64-20210609.tgz/download
# https://www.gnu.org/software/bash/manual/html_node/Process-Substitution.html
