# First commit by yw662
# Manteined by katoitalia
# Thanks to aorth for his check-firmware-version.sh

contenturl=https://cdn.download.clearlinux.org/update
manifest_file=Manifest.linux-firmware

pkgname="intel-ucode-clear"
pkgver=32900
pkgrel=0
arch=('x86_64')

prepare() {
    curl -O $contenturl/$pkgver/$manifest_file
}
build() {
    ucode=$(cat $manifest_file | sed -n -re "s/^.*[[:space:]]+([a-f0-9]+)[[:space:]]+$pkgver[[:space:]]+\/usr\/lib\/initrd.d\/00-intel-ucode.cpio$/\1/p")
    i915=$(cat $manifest_file | sed -n -re "s/^.*[[:space:]]+([a-f0-9]+)[[:space:]]+$pkgver[[:space:]]+\/usr\/lib\/initrd.d\/i915-firmware.cpio.xz$/\1/p")

    curl -O $contenturl/$pkgver/files/$ucode.tar
    curl -O $contenturl/$pkgver/files/$i915.tar
    tar -xf $ucode.tar
    tar -xf $i915.tar

    mv $ucode intel-ucode.cpio
    mv $i915 i915-firmware.cpio.xz

    rm $ucode.tar
    rm $i915.tar
}
package() {
    pkgdesc="intel cpu microcode and i915 firmware used by clear linux"
    provides=("intel-ucode")
    mkdir -p $pkgdir/boot
    cp intel-ucode.cpio $pkgdir/boot
    cp i915-firmware.cpio.xz $pkgdir/boot
}
