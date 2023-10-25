# Maintainer: dakataca <🐬danieldakataca@gmail.com>

pkgname=bypass_utility-bin
_pkgname=${pkgname%-*}
pkgver=1.4.2
pkgrel=1
pkgdesc='Small utility to disable bootrom protection (SLA and DAA) to smartphones with supported mediatek processors.'
url='https://github.com/MTK-bypass'
arch=(x86_64)
license=(MIT)
makedepends=('rsync')
depends=('python-pyusb' 'python-json5' 'python-pyserial' 'linux-kamakiri-bin')
pkgname_provides=exploits_collection
pkgver_provides=1.6
provides=("$pkgname_provides=$pkgver_provides")
source=(
    $url/$_pkgname/archive/refs/tags/v.$pkgver.tar.gz
    v.$pkgver.tar.gz.sig
    $url/$pkgname_provides/archive/refs/tags/v$pkgver_provides.tar.gz
    v$pkgver_provides.tar.gz.sig
)
sha256sums=('61606367f706a07277636488890b9a3622324223b50ca9f21e49b4cb5c409eb0'
            'SKIP'
            '3195c8df2539a6ec3c25bd64aad732b2291070454f45f86df5a675796cbae731'
            'SKIP')
validpgpkeys=(4BA1F928CBA7CA219A14741B24FB14CFDD5D0319)  # dakataca

# Preparar fuentes. 
prepare() {
    cp -r $pkgname_provides-$pkgver_provides/* $_pkgname-v.$pkgver/
}


# Alistar ficheros en el directorio de instalación.
package() {
    local -r dirbypass=$_pkgname-v.$pkgver/
    cat $dirbypass/README.md 
    
    # Cree el directorio de destino y copia en él, el contenido de bypass_utility/.
    rsync -a "$dirbypass/" --mkpath "$pkgdir/opt/$_pkgname/"
    
    # Script de ejecución bypass_utility.
    install -Dvm755 <(cat <<'EOF'
#!/usr/bin/env bash
# Comprobar si el usuario es root.
if [ "$EUID" -ne 0 ]; then
    echo "Error: No puede realizar esta operación, a menos que sea superusuario."
else
    declare -r current_kernel=`uname -r`

    # Expresión regular.
    declare -r pattern="^[0-9]+\.[0-9]+\.[0-9]+-arch[0-9]+-[0-9]+-kamakiri$"

    # Comprueba si la versión del kernel coincide con el patrón.
    if [[ $current_kernel =~ $pattern ]]; then
        echo "Kernel linux-kamakiri validado correctamente..."
        cd /opt/bypass_utility/
        ./main.py
        cd -
    else
        declare -r kernel=linux-kamakiri \
        installed_kernel=`awk -F\' '/menuentry / && /linux-kamakiri/ && !/\(fallback initramfs\)/ {print $2}' /boot/grub/grub.cfg`

        # Comprueba si está instalado el kernel linux-kamakiri.
        if [[ $installed_kernel ]]; then
            echo "Kernel compatible '"$kernel"' instalado, inicialíze el sistema usando dicho kernel en su gestor de arranque y vuelva a ejecutar la herramienta bypass_utility."
        else
	    echo "Kernel actual '"$current_kernel"' incompatible, requiere la variante linux-kamakiri provista por calquiera de los paquetes linux-kamakiri-bin ó linux-kamakiri, instálelos usando:
>> paru -S linux-kamakiri-bin
>> yay -S linux-kamakiri-bin."
        fi
    fi
fi
EOF
) $pkgdir/usr/bin/$_pkgname

}

## References:
# https://www.gnu.org/software/bash/manual/html_node/Process-Substitution.html 

## Test:
# updpkgsums
# makepkg --printsrcinfo > .SRCINFO
# git clean -dfx

# 👤 Autor: https://t.me/dakataca 💻 🐬 #
