# Maintainer: lambdadroid <lambdadroid@gmail.com>
pkgname=intel-ucode-byt-t-c0
pkgver=836
pkgrel=1
pkgdesc="CPU microcode update for Intel Valleyview, Bay Trail T (C0 step)"
arch=(x86_64)
license=('unknown')
makedepends=('innoextract')
options=('!strip')
source=(
    'https://download.lenovo.com/pccbbs/mobiles/gwuj26ww.exe'
)
sha256sums=('baf9e5d86805de278f94f9de91809de0cdbbce2c5f91350ea9641fc10dccd895')

build() {
    FIRMWARE_PATH='app/GWET46WW/$0AGW000.FL1'

    innoextract -I "$FIRMWARE_PATH" gwuj26ww.exe
    dd if="$FIRMWARE_PATH" of=microcode.bin bs=1 skip=5853320 count=52224
}

package() {
    install -d -m755 "$pkgdir"/boot

    mkdir -p kernel/x86/microcode
    mv microcode.bin kernel/x86/microcode/GenuineIntel.bin
    echo kernel/x86/microcode/GenuineIntel.bin | bsdcpio -o -H newc -R 0:0 > "$pkgdir"/boot/intel-ucode-byt-t-c0.img
}
