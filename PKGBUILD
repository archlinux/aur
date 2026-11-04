# Maintainer: Fermín Olaiz <fermin@olaiz.net>

# Bootloader for the raspberry pi SBCs (fw between the GPU ROM-kernel).
# Split package by board lineup to avoid clutter.
# Installed by a libalpm hook.
# For the Pi5 see https://github.com/raspberrypi/rpi-eeprom
# Versioning follows Arch Linux ARM.

pkgbase=raspberrypi-bootloader
pkgname=(
    raspberrypi-bootloader-common
    raspberrypi-bootloader-legacy
    raspberrypi-bootloader-rpi4
)
pkgver=20260915
pkgrel=1
pkgdesc="Bootloader files for Raspberry Pi"
arch=(any)
url="https://github.com/raspberrypi/firmware"
license=(LicenseRef-Broadcom)
options=(!strip)
source=(
    raspberrypi-bootloader-install
    raspberrypi-bootloader-install.hook.in
    "https://raw.githubusercontent.com/raspberrypi/firmware/1.$pkgver/boot/LICENCE.broadcom"
    # legacy: Pi 1/2/3, Zero & Zero 2 (boot ROM loads bootcode.bin -> start*.elf)
    "https://raw.githubusercontent.com/raspberrypi/firmware/1.$pkgver/boot/bootcode.bin"
    "https://raw.githubusercontent.com/raspberrypi/firmware/1.$pkgver/boot/start.elf"
    "https://raw.githubusercontent.com/raspberrypi/firmware/1.$pkgver/boot/start_cd.elf"
    "https://raw.githubusercontent.com/raspberrypi/firmware/1.$pkgver/boot/start_x.elf"
    "https://raw.githubusercontent.com/raspberrypi/firmware/1.$pkgver/boot/start_db.elf"
    "https://raw.githubusercontent.com/raspberrypi/firmware/1.$pkgver/boot/fixup.dat"
    "https://raw.githubusercontent.com/raspberrypi/firmware/1.$pkgver/boot/fixup_cd.dat"
    "https://raw.githubusercontent.com/raspberrypi/firmware/1.$pkgver/boot/fixup_x.dat"
    "https://raw.githubusercontent.com/raspberrypi/firmware/1.$pkgver/boot/fixup_db.dat"
    # Pi 4: bootloader lives in EEPROM, start4*.elf is the SD-card fallback
    "https://raw.githubusercontent.com/raspberrypi/firmware/1.$pkgver/boot/start4.elf"
    "https://raw.githubusercontent.com/raspberrypi/firmware/1.$pkgver/boot/start4cd.elf"
    "https://raw.githubusercontent.com/raspberrypi/firmware/1.$pkgver/boot/start4db.elf"
    "https://raw.githubusercontent.com/raspberrypi/firmware/1.$pkgver/boot/start4x.elf"
    "https://raw.githubusercontent.com/raspberrypi/firmware/1.$pkgver/boot/fixup4.dat"
    "https://raw.githubusercontent.com/raspberrypi/firmware/1.$pkgver/boot/fixup4cd.dat"
    "https://raw.githubusercontent.com/raspberrypi/firmware/1.$pkgver/boot/fixup4db.dat"
    "https://raw.githubusercontent.com/raspberrypi/firmware/1.$pkgver/boot/fixup4x.dat"
)
sha256sums=('0ba7644ff014ebb61f242c6757c977dedd65fbad8e0b870e4a06dda9b0297b72'
            '428026db5507f95dfb92b8d1e3b0cc6dd6c92ed9989106461b03a157a1a7c004'
            'c7283ff51f863d93a275c66e3b4cb08021a5dd4d8c1e7acc47d872fbe52d3d6b'
            '4245ec23b58158dc3e55f3e065eb4ecc0c0705d76c8db506e9f824941feee32e'
            '32f990801e7765bae6fe5cb940ba5eeff02dd0dac8dc5474db5b3fd345281790'
            'ba2e8d34524bcac1ffdc138d981fd4ce4f9498c4e01dc9c1ef701a473a08791e'
            'd7be97dc6bfdab1e7155777b63f84a23a9b2b15698cc74111882a0c463249b38'
            '777eadd294b75401ad7f352b1aaeb817a523a547a2446de9bf059ebf7eb2e256'
            '7853f2b51e4489f8b3ce6f9c52fd0afdda38c7383961524e0883d34afcb4827b'
            '64e1d7100658b0316b0b984eef8e21d863425b71605b2a5b6e48672d9c9ab6ac'
            '536a7e73ef37947be651eae2aa74ba2eb183b83ae5cf30b1a833dae0ad980258'
            '6781f509ca1354d69d26197e7065414be2aa560268124323f74691acf6fb5f2d'
            '560ead37044d849325755d3684ac1f74654b3ce6450604a42df6dd832cda9ede'
            '90783426d3db41214b4d1e3f8743f978c6e502405d593e2e44b87d59d7ea6622'
            'edd810452c8ebbd07d80a46ec3367309a92be804d2ddd8901e35d0ac77a8d35c'
            'd1ac878307cf3db79988d1b8e9848866c6a3dc64108e3e1bd98598a6c76d9b8b'
            'd181d5055daebac22513d6904fa9ce21d1e99b852cc391af095ade6f0b45c400'
            '64e1d7100658b0316b0b984eef8e21d863425b71605b2a5b6e48672d9c9ab6ac'
            'ad323aa1d40ef96da282e5f273d95b0290793566df55c4d9178cba2fb20d072b'
            '6a22e27e27ded29aff354c1aeb6cda9388daaf80b992efbd958190349f9b9a80')

package_raspberrypi-bootloader-common() {
    pkgdesc+=" (shared installer script)"
    license=(0BSD)
    depends=(bash)
    install -Dm755 -t "$pkgdir/usr/share/libalpm/scripts/" "$srcdir/raspberrypi-bootloader-install"
}

package_raspberrypi-bootloader-legacy() {
    pkgdesc+=" (1/2/3, Zero & Zero 2)"
    depends=(raspberrypi-bootloader-common)
    provides=(raspberrypi-bootloader)

    install -Dm644 "$srcdir/LICENCE.broadcom" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    for file in start{,_cd,_x,_db}.elf fixup{,_cd,_x,_db}.dat bootcode.bin; do
        install -Dm644 "$srcdir/$file" "$pkgdir/usr/lib/raspberrypi/legacy/boot/$file"
    done

    sed "s/@lineup@/legacy/g" "$srcdir/raspberrypi-bootloader-install.hook.in" \
        | install -Dm644 /dev/stdin "$pkgdir/usr/share/libalpm/hooks/raspberrypi-bootloader-install-legacy.hook"
}

package_raspberrypi-bootloader-rpi4() {
    pkgdesc+=" (4 only)"
    depends=(raspberrypi-bootloader-common)
    provides=(raspberrypi-bootloader)

    install -Dm644 "$srcdir/LICENCE.broadcom" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    for file in start4{,cd,db,x}.elf fixup4{,cd,db,x}.dat; do
        install -Dm644 "$srcdir/$file" "$pkgdir/usr/lib/raspberrypi/rpi4/boot/$file"
    done

    sed "s/@lineup@/rpi4/g" "$srcdir/raspberrypi-bootloader-install.hook.in" \
        | install -Dm644 /dev/stdin "$pkgdir/usr/share/libalpm/hooks/raspberrypi-bootloader-install-rpi4.hook"
}
