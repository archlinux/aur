# NOTE: 
# 1. This PKGBUILD generate keys on-the-go. If you have your own keys at hand, please consider comment them out and sed %HELPER to the directory where you store them.
# 2. Some UEFI firmware requires the keys to be in FAT filesystem in order they can be imported, consider cp the keys to your ESP before reboot
# 3. Read the Secure Boot Archwiki (https://wiki.archlinux.org/index.php/Secure_Boot)
_sign_location="var/lib/uefi_signatures"

# Maintainer: BrLi <brli@chakralinux.org>
pkgname=secureboot-helper
pkgver=1.0.2
pkgrel=1
pkgdesc="Kernel signing helper for UEFI secure boot"
arch=('any')
url="https://wiki.archlinux.org/index.php/Secure_Boot#Signing_kernel_with_pacman_hook"
license=('GPL')
depends=(sbsigntools)
makedepends=(efitools)
conflicts=(sbupdate)
backup=($_sign_location/db.auth
        $_sign_location/db.cer
        $_sign_location/db.crt
        $_sign_location/db.esl
        $_sign_location/db.key
        $_sign_location/KEK.auth
        $_sign_location/KEK.cer
        $_sign_location/KEK.crt
        $_sign_location/KEK.esl
        $_sign_location/KEK.key
        $_sign_location/PK.auth
        $_sign_location/PK.cer
        $_sign_location/PK.crt
        $_sign_location/PK.esl
        $_sign_location/PK.key
        $_sign_location/rm_PK.auth
        $_sign_location/GUID.txt)
source=(secureboot-helper.hook
        secureboot-helper-systemd.hook
        secureboot-helper.sysusers)
sha256sums=('0e52f034ba8576b1723e07f974ea8a7d689cc41488cee731a6e0cb510a2cd4be'
            'ef3511b8195bb02e417a6d8be455735a61df3191c4b5bb1bdb6eb1a4c443101e'
            'ff1993aff155370018deeb78a0a112e887394fe3c5d289140d17462d1c2f1cc6')

prepare() {
    sed "s,%SIGN_LOCATION%,$_sign_location,g" -i $srcdir/secureboot-helper.hook
    sed "s,%SIGN_LOCATION%,$_sign_location,g" -i $srcdir/secureboot-helper.sysusers
}
package() {
    install -dm500 $pkgdir/$_sign_location
    cd $pkgdir/$_sign_location
    uuidgen --random > GUID.txt
    
    # Platform key
    msg 'Generating PK.key'
    openssl req -newkey rsa:2048 -nodes -keyout PK.key -new -x509 -sha256 -days 3650 -subj "/CN=Self-generated Platform Key/" -out PK.crt
    openssl x509 -outform DER -in PK.crt -out PK.cer
    cert-to-efi-sig-list -g "$(< GUID.txt)" PK.crt PK.esl
    sign-efi-sig-list -g "$(< GUID.txt)" -k PK.key -c PK.crt PK PK.esl PK.auth
    sign-efi-sig-list -g "$(< GUID.txt)" -c PK.crt -k PK.key PK /dev/null rm_PK.auth

    # Key exchange key
    msg 'Generating KEK.key'
    openssl req -newkey rsa:2048 -nodes -keyout KEK.key -new -x509 -sha256 -days 3650 -subj "/CN=Self-generated Key Exchange Key/" -out KEK.crt
    openssl x509 -outform DER -in KEK.crt -out KEK.cer
    cert-to-efi-sig-list -g "$(< GUID.txt)" KEK.crt KEK.esl
    sign-efi-sig-list -g "$(< GUID.txt)" -k PK.key -c PK.crt KEK KEK.esl KEK.auth
    
    # Signature Database key
    msg 'Generating DB.key'
    openssl req -newkey rsa:2048 -nodes -keyout db.key -new -x509 -sha256 -days 3650 -subj "/CN=Self-generated Signature Database key/" -out db.crt
    openssl x509 -outform DER -in db.crt -out db.cer
    cert-to-efi-sig-list -g "$(< GUID.txt)" db.crt db.esl
    sign-efi-sig-list -g "$(< GUID.txt)" -k KEK.key -c KEK.crt db db.esl db.auth
    
    install -Dm644 $srcdir/secureboot-helper.hook $pkgdir/usr/share/libalpm/hooks/secureboot-helper-kernel.hook
    install -Dm644 $srcdir/secureboot-helper-systemd.hook $pkgdir/usr/share/libalpm/hooks/secureboot-helper-systemd.hook
    install -Dm644 $srcdir/secureboot-helper.sysusers $pkgdir/usr/lib/sysusers.d/secureboot-helper.conf
}
