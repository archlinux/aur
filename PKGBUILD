# Maintainer: dakataca <🐬danieldakataca@gmail.com>
# Contributor: Omar Pakker <archlinux@opakker.nl>

pkgname=spflashtool5
_pkgname="${pkgname%5}"
pkgver=5.2228
pkgrel=1
arch=('x86_64')
pkgdesc='Application to flash your MediaTek (MTK) SmartPhone.'
url="https://${_pkgname}s.com/category/linux"
_url="${url%/*/*}"
license=('unknown')
conflicts=("$pkgname-bin")
makedepends=('gendesk' 'unzip')
source=("$_url/wp-content/uploads/SP_Flash_Tool_v${pkgver}_Linux.zip")
sha256sums=('18b11eed341fd57feb7fbc58a7b8eb93429bacc7d25a993878af8a0b6e98df10')  # 'makepkg -g' to generate it.


# Función 'prepare': Prepara el entorno antes de compilar el paquete.
prepare(){
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


# Función 'package': Crea el paquete instalable.
package() {

    # Simplificar nombre del directorio de descompresión de la herramienta spflashtool5.
    local -r dirspflash="SP_Flash_Tool_v${pkgver}_Linux/"

    # Sustituir la URL en Credits.txt porque se requiere la de Linux, no la de Windows.
    sed -Ei 's|(^'"${_url}"'/category/)windows$|\1linux\n|g' "$dirspflash/Credits.txt"


    # Permisos de ejecución.
    chmod +x $dirspflash/flash_tool{,.sh}

    # Cree el directorio de destino y copia en él, el contenido de spflashtool5.
    mkdir -p "$pkgdir/opt/$pkgname"
    cp -r "$dirspflash"* "$pkgdir/opt/$pkgname/"

    # Script de ejecución.
    install -Dvm755 <(echo -e '#!/usr/bin/env bash
appname="flash_tool"
dirname="/opt/'"$pkgname"'"
LD_LIBRARY_PATH="$dirname:$dirname/lib"
export LD_LIBRARY_PATH
"$dirname/$appname" "$@"') \
    $pkgdir/usr/bin/$pkgname

    # Instalar el archivo .desktop en la ubicación (-t) adecuada.
    install -Dvm644 "$pkgname.desktop" -t "$pkgdir/usr/share/applications/"

    # Instalar el icono de spflashtool5.
    install -Dvm644 "../icon.png" "$pkgdir/usr/share/pixmaps/$pkgname.png"
}

## Test.
# rm -rf spflashtool* SP* src/ pkg/
# makepkg --printsrcinfo > .SRCINFO

## References.
# https://aur.archlinux.org/cgit/aur.git/tree/PKGBUILD?h=spflashtool-bin
# https://spflashtools.com/category/linux
# https://androidmtk.com/flash-stock-rom-using-smart-phone-flash-tool
# https://androidmtk.com/category/tutorials
