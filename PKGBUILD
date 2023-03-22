# NOTE: 
# 1. This PKGBUILD generate keys on-the-go. If you have your own keys at hand, please consider comment them out and sed %HELPER to the directory where you store them.
# 2. Some UEFI firmware requires the keys to be in FAT filesystem in order they can be imported, consider cp the keys to your ESP before reboot
# 3. Read the Secure Boot Archwiki (https://wiki.archlinux.org/index.php/Secure_Boot)
_sign_location="etc/secureboot/keys"

# Maintainer: BrLi <brli@chakralinux.org>
pkgname=secureboot-helper
pkgver=1.1.2
pkgrel=1
pkgdesc="Kernel signing helper for UEFI secure boot"
arch=('any')
url="https://wiki.archlinux.org/index.php/Secure_Boot#Signing_kernel_with_pacman_hook"
license=('GPL')
depends=(sbsigntools)
makedepends=(efitools)
conflicts=(sbupdate)
backup=($_sign_location/db/db.auth
        $_sign_location/db/db.cer
        $_sign_location/db/db.crt
        $_sign_location/db/db.esl
        $_sign_location/db/db.key
        $_sign_location/KEK/KEK.auth
        $_sign_location/KEK/KEK.cer
        $_sign_location/KEK/KEK.crt
        $_sign_location/KEK/KEK.esl
        $_sign_location/KEK/KEK.key
        $_sign_location/PK/PK.auth
        $_sign_location/PK/PK.cer
        $_sign_location/PK/PK.crt
        $_sign_location/PK/PK.esl
        $_sign_location/PK/PK.key
        $_sign_location/PK/rm_PK.auth
        $_sign_location/GUID.txt)
source=(secureboot-helper-kernel.hook
        secureboot-helper-systemd.hook
        secureboot-helper-ucode.hook
        systemd-boot-update.hook
        secureboot-helper.sysusers)
sha256sums=('431c8804e41f42ef71e461c322e53908474982f011a19c69dc6776a5fefe2371'
            'fa56188cb7d1175283ad7bbdc06a540ba8c1a2fc1b5ea55011a3a2cca0f7ac4c'
            'badc4c0a167af7606df2076929d3ccede9da971b9e6c7bc24e9dfb22ea29cd3a'
            '3f7f448987c82b9475182cc2bf5b861780e9da2a121b3607c5d24bc836846e86'
            'ff1993aff155370018deeb78a0a112e887394fe3c5d289140d17462d1c2f1cc6')

prepare() {
    sed "s,%SIGN_LOCATION%,$_sign_location,g" -i $srcdir/secureboot-helper-kernel.hook
    sed "s,%SIGN_LOCATION%,$_sign_location,g" -i $srcdir/secureboot-helper-systemd.hook
    sed "s,%SIGN_LOCATION%,$_sign_location,g" -i $srcdir/secureboot-helper-ucode.hook
    sed "s,%SIGN_LOCATION%,$_sign_location,g" -i $srcdir/secureboot-helper.sysusers
}
package() {
    install -dm500 "$pkgdir/$_sign_location/"{PK,KEK,db}
    cd $pkgdir/$_sign_location
    uuidgen --random > GUID.txt

    # Platform key
    msg 'Generating PK.key'
    cd $pkgdir/$_sign_location/PK
    openssl req -newkey rsa:2048 -nodes -keyout PK.key -new -x509 -sha256 -days 3650 -subj "/CN=Self-generated Platform Key/" -out PK.crt
    openssl x509 -outform DER -in PK.crt -out PK.cer
    cert-to-efi-sig-list -g "$(< ../GUID.txt)" PK.crt PK.esl
    sign-efi-sig-list -g "$(< ../GUID.txt)" -k PK.key -c PK.crt PK PK.esl PK.auth
    sign-efi-sig-list -g "$(< ../GUID.txt)" -c PK.crt -k PK.key PK /dev/null rm_PK.auth

    # Key exchange key
    msg 'Generating KEK.key'
    cd $pkgdir/$_sign_location/KEK
    openssl req -newkey rsa:2048 -nodes -keyout KEK.key -new -x509 -sha256 -days 3650 -subj "/CN=Self-generated Key Exchange Key/" -out KEK.crt
    openssl x509 -outform DER -in KEK.crt -out KEK.cer
    cert-to-efi-sig-list -g "$(< GUID.txt)" KEK.crt KEK.esl
    sign-efi-sig-list -g "$(< GUID.txt)" -k ../PK/PK.key -c ../PK/PK.crt KEK KEK.esl KEK.auth

    # Signature Database key
    msg 'Generating DB.key'
    cd $pkgdir/$_sign_location/db
    openssl req -newkey rsa:2048 -nodes -keyout db.key -new -x509 -sha256 -days 3650 -subj "/CN=Self-generated Signature Database key/" -out db.crt
    openssl x509 -outform DER -in db.crt -out db.cer
    cert-to-efi-sig-list -g "$(< ../GUID.txt)" db.crt db.esl
    sign-efi-sig-list -g "$(< ../GUID.txt)" -k ../KEK/KEK.key -c ../KEK/KEK.crt db db.esl db.auth

    for hook in secureboot-helper-ucode secureboot-helper-kernel secureboot-helper-systemd; do
        install -Dm644 $srcdir/$hook.hook $pkgdir/usr/share/libalpm/hooks/95-$hook.hook
    done
    install -Dm644 $srcdir/systemd-boot-update.hook $pkgdir/usr/share/libalpm/hooks/96-systemd-boot-update.hook
    install -Dm644 $srcdir/secureboot-helper.sysusers $pkgdir/usr/lib/sysusers.d/secureboot-helper.conf
}
