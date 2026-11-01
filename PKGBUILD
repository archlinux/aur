# Bootloader for the raspberry pi SBCs (fw between the GPU ROM-kernel).
# Split package by board lineup to avoid clutter.
# Installed by a libalpm hook.
# For the Pi5 see https://github.com/raspberrypi/rpi-eeprom

pkgbase=raspberrypi-bootloader
pkgname=(
    raspberrypi-bootloader-common
    raspberrypi-bootloader-legacy
    raspberrypi-bootloader-rpi4
)
pkgver=1.20260915
pkgrel=2
pkgdesc="Bootloader files for Raspberry Pi"
arch=(any)
url="https://github.com/raspberrypi/firmware"
license=(custom)
conflicts=(raspberrypi-bootloader)
options=(!strip)
source=(
    "https://github.com/raspberrypi/firmware/archive/refs/tags/$pkgver.tar.gz"
    raspberrypi-bootloader-install
    raspberrypi-bootloader-install.hook.in
)
sha256sums=('58751354e5c8289d3660511958e8c7869de010f6719d8e1859820391058a337c'
            '0ba7644ff014ebb61f242c6757c977dedd65fbad8e0b870e4a06dda9b0297b72'
            '428026db5507f95dfb92b8d1e3b0cc6dd6c92ed9989106461b03a157a1a7c004')

package_raspberrypi-bootloader-common() {
    pkgdesc+=" (shared installer script)"
    install -Dm755 -t "$pkgdir/usr/share/libalpm/scripts/" "$srcdir/raspberrypi-bootloader-install"
}

package_raspberrypi-bootloader-legacy() {
    pkgdesc+=" (1/2/3, Zero & Zero 2)"
    depends=(raspberrypi-bootloader-common)
    cd "$srcdir/firmware-$pkgver"

    install -Dm644 boot/LICENCE.broadcom "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    for file in start{,_cd,_x,_db}.elf fixup{,_cd,_x,_db}.dat bootcode.bin; do
        install -Dm644 -t "$pkgdir/usr/lib/raspberrypi/legacy/boot" "boot/$file"
    done

    sed "s/@lineup@/legacy/g" "$srcdir/raspberrypi-bootloader-install.hook.in" \
        | install -Dm644 /dev/stdin "$pkgdir/usr/share/libalpm/hooks/raspberrypi-bootloader-install-legacy.hook"
}

package_raspberrypi-bootloader-rpi4() {
    pkgdesc+=" (4 only)"
    depends=(raspberrypi-bootloader-common)
    cd "$srcdir/firmware-$pkgver"

    install -Dm644 boot/LICENCE.broadcom "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    for file in start4{,cd,db,x}.elf fixup4{,cd,db,x}.dat; do
        install -Dm644 -t "$pkgdir/usr/lib/raspberrypi/rpi4/boot" "boot/$file"
    done

    sed "s/@lineup@/rpi4/g" "$srcdir/raspberrypi-bootloader-install.hook.in" \
        | install -Dm644 /dev/stdin "$pkgdir/usr/share/libalpm/hooks/raspberrypi-bootloader-install-rpi4.hook"
}
