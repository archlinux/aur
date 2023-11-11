# Maintainer: dakataca <🐬danieldakataca@gmail.com>

pkgname=bypass_utility
pkgver=1.4.2
pkgrel=1
pkgdesc='Small utility to disable bootrom protection (SLA and DAA) to smartphones with supported mediatek processors.'
url='https://github.com/MTK-bypass'
arch=(x86_64)
license=(MIT)
makedepends=('rsync')
depends=('python-pyusb' 'python-json5' 'python-pyserial' 'linux-kamakiri' 'translate-shell')
pkgname_provides=exploits_collection
pkgver_provides=1.6
provides=("$pkgname_provides=$pkgver_provides")
source=(
    $url/$pkgname/archive/refs/tags/v.$pkgver.tar.gz
    v.$pkgver.tar.gz.sig
    $url/$pkgname_provides/archive/refs/tags/v$pkgver_provides.tar.gz
    v$pkgver_provides.tar.gz.sig
)
sha256sums=('61606367f706a07277636488890b9a3622324223b50ca9f21e49b4cb5c409eb0'
            'SKIP'
            '3195c8df2539a6ec3c25bd64aad732b2291070454f45f86df5a675796cbae731'
            'SKIP')
#validpgpkeys=(4BA1F928CBA7CA219A14741B24FB14CFDD5D0319)  # dakataca

# Preparar fuentes. 
prepare() {
    cp -r $pkgname_provides-$pkgver_provides/* $pkgname-v.$pkgver/
}

# Alistar ficheros en el directorio de instalación.
package() {
    local -r dirbypass=$pkgname-v.$pkgver/
    cat $dirbypass/README.md 
    
    # Cree el directorio de destino y copia en él, el contenido de bypass_utility/.
    rsync -a "$dirbypass/" --mkpath "$pkgdir/opt/$pkgname/"

    # Instalar fichero de licencia.
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

    # Script de ejecución bypass_utility.
    install -Dvm755 <(cat <<'EOF'
#!/usr/bin/env bash

translate_str() {
   local -r lang=${LANG%_[A-Z][A-Z].UTF-8}
   local str=""
   if [[ $lang == en ]]; then
       str=$1
   elif [[ $lang == es ]]; then
       str=$2
   else
       str=`trans -b :$lang "$str"`
   fi
   echo "$str"
}

# Comprobar si el usuario es root.
if [ "$EUID" -ne 0 ]; then
    translate_str "Error: You can't perform this operation unless you're superuser."\
    "Error: No puede realizar esta operación, a menos que sea superusuario."
else
    # kernel actual.
    declare -r current_kernel=`uname -r` kernel=linux-kamakiri

    # Expresión regular o patrón.
    declare -r pattern="^[0-9]+\.[0-9]+\.[0-9]+-arch[0-9]+-[0-9]+-kamakiri$"

    # Comprueba si la versión del kernel coincide con el patrón.
    if [[ $current_kernel =~ $pattern ]]; then
        translate_str "Kernel $kernel validated correctly..."\
        "Kernel $kernel validado correctamente..."
        cd /opt/bypass_utility/
        ./main.py
        cd -
    else
        declare -r installed_kernel_kamakiri=`pacman -Qs linux-kamakiri*`

        # Comprueba si está instalado el kernel linux-kamakiri.
        if [[ $installed_kernel_kamakiri ]]; then
            translate_str "'"$kernel"' kernel installed, manually initialize it in your bootloader and re-run bypass_utility."\
            "Kernel '"$kernel"' instalado, inicialízelo manualmente en su bootloader y vuelva a ejecutar bypass_utility."
        else
            translate_str "Currently incompatible kernel '"$current_kernel"', you need to install the \"linux-kamakiri\" variant provided by \"linux-kamakiri-bin\" or \"linux-kamakiri\":" "Kernel actual '"$current_kernel"' incompatible, necesita instalar la variante \"linux-kamakiri\" provista por \"linux-kamakiri-bin\" ó \"linux-kamakiri\":"
            echo ">> paru -S linux-kamakiri-bin
>> yay -S linux-kamakiri-bin"
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
