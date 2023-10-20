# Maintainer: dakataca <🐬danieldakataca@gmail.com>

pkgname=bypass_utility
pkgver=1.4.2
pkgrel=1
pkgdesc='Small utility to disable bootrom protection (SLA and DAA) to smartphones with supported mediatek processors.'
url='https://github.com/MTK-bypass'
arch=(x86_64)
license=(MIT)
makedepends=('rsync')
depends=('python-pyusb' 'python-json5' 'python-pyserial' 'linux_kamakiri')
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
validpgpkeys=(4BA1F928CBA7CA219A14741B24FB14CFDD5D0319)  # dakataca

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

    # Script de ejecución Bypass_utility.
    install -Dvm755 <(echo -e '#!/usr/bin/env bash
# Comprobar si el usuario es root.
if [ "$EUID" -ne 0 ]; then
\techo "Error: No puede realizar esta operación, a menos que sea superusuario."
\texit 1
fi
cd /opt/bypass_utility/
./main.py
cd -') \
    $pkgdir/usr/bin/$pkgname
}


## Test
# rm -rf pkg/ src/ bypass_utility* v*.tar.gz
# makepkg --printsrcinfo > .SRCINFO
