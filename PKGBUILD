# Maintainer: lambdadroid <lambdadroid@gmail.com>
pkgname=me176c-firmware
pkgver=12.10.1.36
pkgrel=4
pkgdesc="Additional firmware files for ASUS MeMO Pad 7 (ME176C(X))"
arch=(x86_64)
url="https://github.com/me176c-dev/archlinux-me176c"
license=('unknown')
makedepends=('python' 'mkinitcpio')
options=('!strip')
source=(
    "https://dlcdnets.asus.com/pub/ASUS/EeePAD/ME176C/UL-K013-WW-$pkgver-user.zip"
    'unpackbootimg.py'
)
sha256sums=('b19a2901bd5920b58bd3693243a9edf433656bcee8f454637ee401e28c096469'
            '3eab49bb9c4e1bb890b77a1b2a6762ecb7b628278789caa2efb82f287635503d')

build() {
    # Extract boot image ramdisk
    ./unpackbootimg.py boot.img
    lsinitcpio -x ramdisk

    # Replace /config with /me176c, /config is sometimes used for ConfigFS
    sed -i 's@/config/@/me176c/@g' sbin/upi_ug31xx
}

package() {
    # Battery daemon
    install -Dm755 sbin/upi_ug31xx "$pkgdir/opt/asus/me176c/upi_ug31xx"

    # WiFi NVRAM file
    install -Dm644 system/etc/nvram.txt "$pkgdir/usr/lib/firmware/brcm/brcmfmac43362-sdio.txt"

    # Bluetooth firmware
    install -Dm644 system/etc/firmware/BCM2076B1_002.002.004.0132.0141_reduced_2dB.hcd \
        "$pkgdir/usr/lib/firmware/brcm/BCM2076B1.hcd"
}
