# NOTE: 
# 1. This PKGBUILD generate keys on-the-go. If you have your own keys at hand, please consider comment them out and sed %HELPER to the directory where you store them.
# 2. Some UEFI firmware requires the keys to be in FAT filesystem in order they can be imported, consider cp the keys to your ESP before reboot
# 3. Read the Secure Boot Archwiki (https://wiki.archlinux.org/index.php/Secure_Boot)
_sign_location="etc/secureboot/keys"
_gen_new_key="${GEN_NEW_KEY:-true}"

# Maintainer: BrLi <brli@chakralinux.org>
pkgname=secureboot-helper
pkgver=1.2.0
pkgrel=1
pkgdesc="Kernel signing helper for UEFI secure boot"
arch=('any')
url="https://wiki.archlinux.org/index.php/Secure_Boot#Signing_kernel_with_pacman_hook"
license=('GPL')
depends=(sbsigntools mkinitcpio)
makedepends=(efitools)
optdepends=(edk2-shell)
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
install=install
source=(secureboot-helper-kernel.hook
        secureboot-helper-systemd.hook
        secureboot-helper-ucode.hook
        secureboot-helper-edk2.hook
        systemd-boot-update.hook
        edk2-update.hook
        secureboot-helper.sysusers
        uki-sbsign.post)
b2sums=('e91df3a7cb2797210666d22716b9e93153d1a4571f90b0cd85f0d5e3f6a18b12f8892c40bce144859e6509107a76db20a855b1922180406f086c32d591febc0a'
        'c101d87484749a315a0f50951d6ecb46819a9ab684807f51f30eea9b7a6af2f28e4cbb8593a3983b32a7029aa75c0618b7040caca53798dae1cc6c534262b6a8'
        '6e5d318f43fab74dc8e9d8964ff8f1d2f29862da510a05da8d5c6931954b3d5e07969f94ae356f30157dc98f59544945550ad3db1dbcdfc048d6179fe4d00fcd'
        '9397cee519512c05fd61d08d732e4cf72222a6b44068a5a9de865c43da971157d8385028d18f0d060a47ce5a69b5142bb9506c0af5e536a63c705f028a7a6074'
        'acd0ba657a2707620e9dba6f798dfff9323ac35508f32954b4235876bcd9357dda81951c0115d5d3810a4497e1f527abd81539b0a5bdb864203478137716bf1f'
        '70f37c68498e027e2104a2103da2619fb68bca3f850e2b6acd75a82cd97193e6fc16c29a05e7f25f8711b9236c4528ae8ccb7434800f89ef94cad98520b00c6e'
        '4c558c19ba88f5c471076c220c767d21b4e5f6629ddf2d4fd652c1252a6de1ea236ead6f9a6674178af8c0e98afc51099a7b36a5421a581c4cb411b68ca86a7c'
        'd3c1dd19016f9bf06255d30f05929cc040e05aec51ce6178be9024506c9050de3057e993e5193dbe6043c09b466ebcb80659a1443f4f736b3f399d474c4e41da')

prepare() {
    export _gen_new_key
    sed "s,%SIGN_LOCATION%,$_sign_location,g" -i $srcdir/secureboot-helper-kernel.hook
    sed "s,%SIGN_LOCATION%,$_sign_location,g" -i $srcdir/secureboot-helper-systemd.hook
    sed "s,%SIGN_LOCATION%,$_sign_location,g" -i $srcdir/secureboot-helper-ucode.hook
    sed "s,%SIGN_LOCATION%,$_sign_location,g" -i $srcdir/secureboot-helper.sysusers
    [[ $_gen_new_key ]] || cp -r /etc/secureboot/keys "$srcdir/keys"
}
package() {
    export _gen_new_key
    install -dm500 "$pkgdir/$_sign_location/"{PK,KEK,db}
    cd $pkgdir/$_sign_location
    if [[ $_gen_new_key ]] ; then
        touch GUID.txt
        uuidgen --random > GUID.txt

        # Platform key
        msg 'Generating PK.key'
        cd $pkgdir/$_sign_location/PK
        touch PK.{crt,cer,esl,key,auth}
        touch rm_PK.auth

        # Key exchange key
        msg 'Generating KEK.key'
        cd $pkgdir/$_sign_location/KEK
        touch KEK.{key,crt,cer,esl,auth}

        # Signature Database key
        msg 'Generating DB.key'
        cd $pkgdir/$_sign_location/db
        touch db.{key,crt,cer,esl,auth}
    else
        cp -ra $srcdir/keys/* ./
    fi

    for hook in ucode kernel systemd edk2; do
        install -Dm644 "$srcdir/secureboot-helper-$hook.hook" "$pkgdir/usr/share/libalpm/hooks/95-secureboot-helper-$hook.hook"
    done
    install -Dm644 $srcdir/systemd-boot-update.hook   $pkgdir/usr/share/libalpm/hooks/96-systemd-boot-update.hook
    install -Dm644 $srcdir/edk2-update.hook           $pkgdir/usr/share/libalpm/hooks/96-edk2-update.hook
    install -Dm644 $srcdir/secureboot-helper.sysusers $pkgdir/usr/lib/sysusers.d/secureboot-helper.conf
    install -Dm644 $srcdir/uki-sbsign.post            $pkgdir/usr/lib/initcpio/post/uki-sbsign
}
