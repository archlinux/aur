# Maintainer: dakataca <🐬danieldakataca@gmail.com>
# Contributor: Omar Pakker <archlinux@opakker.nl>

pkgname=spflashtool5
_pkgname="${pkgname%5}"
pkgver=5.2228
pkgrel=1
arch=('x86_64')
pkgdesc='Application to flash your MediaTek (MTK) SmartPhone.'
url='http://spflashtools.com/category/linux'
_url="${url%/*/*}"
license=('unknown')
conflicts=("$_pkgname" "$pkgname")
makedepends=('gendesk' 'unzip')
#depends=('')
noextract=()
source=("$_pkgname-$pkgver.zip::$_url/wp-content/uploads/SP_Flash_Tool_v${pkgver}_Linux.zip")
sha256sums=('18b11eed341fd57feb7fbc58a7b8eb93429bacc7d25a993878af8a0b6e98df10')  # 'makepkg -g' to generate it.


# Función 'prepare': Prepara el entorno antes de compilar el paquete.
prepare(){
    # Utilidad 'gendesk' para generar el archivo .desktop.
    gendesk -f -n \
        --pkgname="$_pkgname" \
        --pkgdesc="$pkgdesc" \
        --name="$_pkgname" \
        --genericname="$_pkgname" \
        --comment="$pkgdesc" \
        --exec="$_pkgname" \
        --path="/opt/$_pkgname" \
        --icon="$_pkgname" \
        --categories='Development,Education'
}


# Función 'package': Crea el paquete instalable.
package() {
    # Crear el directorio de destino si no existe.
    install -d "$pkgdir/opt/$pkgname/"

    # Extraer solo el contenido del ZIP "-j" y sobreescríbalo "-o" en el directorio de destino "-d".
    unzip -oj "$_pkgname-$pkgver.zip" -d "$pkgdir/opt/$pkgname/"  

    # Permisos de ejecución.
    chmod +x $pkgdir/opt/$pkgname/flash_tool{,.sh}

    # Sustituir la URL en Credits.txt porque se requiere la de Linux, no la de Windows.
    sed -Ei 's|(https://spflashtools.com/category/)windows|\1linux|g' "$pkgdir/opt/$pkgname/Credits.txt"

    # Script de ejecución.
    install -Dvm755 <(echo -e '#!/usr/bin/env bash
appname="flash_tool"
dirname="/opt/'"$pkgname"'"
LD_LIBRARY_PATH="$dirname:$dirname/lib"
export LD_LIBRARY_PATH
"$dirname/$appname" "$@"') \
    $pkgdir/usr/bin/$pkgname
}

## Test.
# rm -rf spflashtool* src/
# makepkg --printsrcinfo > .SRCINFO

## References.
# https://aur.archlinux.org/cgit/aur.git/tree/PKGBUILD?h=spflashtool-bin
# https://spflashtools.com/category/linux
# https://androidmtk.com/flash-stock-rom-using-smart-phone-flash-tool
# https://androidmtk.com/category/tutorials
