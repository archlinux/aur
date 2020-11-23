# Maintainer: Jack Chen <redchenjs@live.com>

pkgbase=linux-rockchip
pkgname=('linux-rockchip' 'linux-rockchip-headers')
pkgver=5.8.18
pkgrel=1
arch=('armv7h')
url="https://github.com/redchenjs/armbian-ci"
license=('GPL2')
makedepends=('findutils' 'curl')
options=('!strip')
_armbian=20.11.0
source=(
    "mkinitcpio.preset"
    "https://github.com/redchenjs/armbian-ci/releases/download/v$pkgver-rockchip/linux-dtb-current-rockchip_$_armbian-trunk_armhf.deb"
    "https://github.com/redchenjs/armbian-ci/releases/download/v$pkgver-rockchip/linux-image-current-rockchip_$_armbian-trunk_armhf.deb"
    "https://github.com/redchenjs/armbian-ci/releases/download/v$pkgver-rockchip/linux-headers-current-rockchip_$_armbian-trunk_armhf.deb"
)
sha512sums=(
    '4e479e5c010c5cd6105b104419bbf1886a60174535d17a34ae457f2744598d0f1c4e2b24dc989c038fa2c51b3d076e0acd3210e1492a87db68b1d43840e11e8a'
    "$(curl -s -L https://github.com/redchenjs/armbian-ci/releases/download/v$pkgver-rockchip/linux-dtb-current-rockchip_$_armbian-trunk_armhf.deb.sha512sum)"
    "$(curl -s -L https://github.com/redchenjs/armbian-ci/releases/download/v$pkgver-rockchip/linux-image-current-rockchip_$_armbian-trunk_armhf.deb.sha512sum)"
    "$(curl -s -L https://github.com/redchenjs/armbian-ci/releases/download/v$pkgver-rockchip/linux-headers-current-rockchip_$_armbian-trunk_armhf.deb.sha512sum)"
)
noextract=("${source[@]##*/}")

prepare() {
    cd "$srcdir"

    rm -rf $(find -mindepth 1 -maxdepth 1 -type d)
}

package_linux-rockchip() {
    pkgdesc="Rockchip Linux kernel and modules from Armbian"
    depends=('mkinitcpio' 'grep' 'gzip' 'sed')
    provides=('linux' 'linux-rockchip')

    cd "$srcdir"

    ar x "linux-dtb-current-rockchip_$_armbian-trunk_armhf.deb"
    tar -xf data.tar.xz
    ar x "linux-image-current-rockchip_$_armbian-trunk_armhf.deb"
    tar -xf data.tar.xz

    mkdir -p "$pkgdir/usr"
    mv lib "$pkgdir/usr/lib"

    mkdir -p "$pkgdir/boot"
    mv "boot/dtb-$pkgver-rockchip" "$pkgdir/boot/dtb"

    echo "$pkgbase" > "$pkgdir/usr/lib/modules/$pkgver-rockchip/pkgbase"
    install -Dm644 "boot/vmlinuz-$pkgver-rockchip" "$pkgdir/usr/lib/modules/$pkgver-rockchip/vmlinuz"

    install -Dm644 "mkinitcpio.preset" "$pkgdir/etc/mkinitcpio.d/$pkgbase.preset"
    sed -r -i "s#\\\$pkgbase#$pkgbase#g" "$pkgdir/etc/mkinitcpio.d/$pkgbase.preset"
}

package_linux-rockchip-headers() {
    pkgdesc="Headers and scripts for building modules for the $pkgbase kernel"
    provides=('linux-headers' 'linux-headers-rockchip')

    cd "$srcdir"

    ar x "linux-image-current-rockchip_$_armbian-trunk_armhf.deb"
    tar -xf data.tar.xz
    ar x "linux-headers-current-rockchip_$_armbian-trunk_armhf.deb"
    tar -xf data.tar.xz

    mkdir -p "$pkgdir/usr/lib/modules/$pkgver-rockchip"
    mv "usr/src/linux-headers-$pkgver-rockchip" "$pkgdir/usr/lib/modules/$pkgver-rockchip/build"

    install -Dm644 "boot/config-$pkgver-rockchip" "$pkgdir/usr/lib/modules/$pkgver-rockchip/build/.config"
    install -Dm644 "boot/System.map-$pkgver-rockchip" "$pkgdir/usr/lib/modules/$pkgver-rockchip/build/System.map"

    mkdir -p "$pkgdir/usr/src"
    ln -s "../lib/modules/$pkgver-rockchip/build" "$pkgdir/usr/src/$pkgbase"
}
