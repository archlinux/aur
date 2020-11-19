# Maintainer: Jack Chen <redchenjs@live.com>

pkgbase=linux-rockchip
pkgname=('linux-rockchip' 'linux-rockchip-headers')
pkgver=5.8.16
pkgrel=1
arch=('armv7h')
url="https://apt.armbian.com"
license=('GPL2')
makedepends=('coreutils' 'findutils' 'curl' 'grep' 'sed')
options=('!strip')

_pkgfile=$(curl -s -L https://apt.armbian.com/dists/focal/main/binary-armhf/Packages -o Packages)
_kernver=$(cat Packages | grep 'linux-dtb-current-rockchip.*deb' | head -n 1 | sed -r 's#.*l/linux-(.*)/l.*#\1#')

source=(
    "mkinitcpio.preset"
    "$(cat Packages | grep 'linux-dtb-current-rockchip.*deb' | head -n 1 | sed -r 's#Filename: #https://apt.armbian.com/#')"
    "$(cat Packages | grep 'linux-image-current-rockchip.*deb' | head -n 1 | sed -r 's#Filename: #https://apt.armbian.com/#')"
    "$(cat Packages | grep 'linux-headers-current-rockchip.*deb' | head -n 1 | sed -r 's#Filename: #https://apt.armbian.com/#')"
)
sha512sums=(
    '4e479e5c010c5cd6105b104419bbf1886a60174535d17a34ae457f2744598d0f1c4e2b24dc989c038fa2c51b3d076e0acd3210e1492a87db68b1d43840e11e8a'
    "$(cat Packages | grep 'linux-dtb-current-rockchip.*deb' -A 5 | grep SHA512 | head -n 1 | sed -r 's#SHA512: ##')"
    "$(cat Packages | grep 'linux-image-current-rockchip.*deb' -A 5 | grep SHA512 | head -n 1 | sed -r 's#SHA512: ##')"
    "$(cat Packages | grep 'linux-headers-current-rockchip.*deb' -A 5 | grep SHA512 | head -n 1 | sed -r 's#SHA512: ##')"
)
noextract=("${source[@]##*/}")

pkgver() {
    echo "$_kernver" | sed -r 's#-.*##'
}

prepare() {
    cd "$srcdir"

    rm -rf $(find -mindepth 1 -maxdepth 1 -type d)
}

package_linux-rockchip() {
    pkgdesc="Rockchip Linux kernel and modules from Armbian"
    depends=('mkinitcpio' 'grep' 'gzip' 'sed')
    provides=('linux' 'linux-rockchip')

    cd "$srcdir"

    ar x linux-dtb-current-rockchip_*.deb
    tar -xf data.tar.xz
    ar x linux-image-current-rockchip_*.deb
    tar -xf data.tar.xz

    mkdir -p "$pkgdir/usr"
    mv lib "$pkgdir/usr/lib"

    mkdir -p "$pkgdir/boot"
    mv "boot/dtb-$_kernver" "$pkgdir/boot/dtb"

    echo "$pkgbase" > "$pkgdir/usr/lib/modules/$_kernver/pkgbase"
    install -Dm644 "boot/vmlinuz-$_kernver" "$pkgdir/usr/lib/modules/$_kernver/vmlinuz"

    install -Dm644 "mkinitcpio.preset" "$pkgdir/etc/mkinitcpio.d/$pkgbase.preset"
    sed -r -i "s#\\\$pkgbase#$pkgbase#g" "$pkgdir/etc/mkinitcpio.d/$pkgbase.preset"
}

package_linux-rockchip-headers() {
    pkgdesc="Headers and scripts for building modules for the $pkgbase kernel"
    provides=('linux-headers' 'linux-headers-rockchip')

    cd "$srcdir"

    ar x linux-image-current-rockchip_*.deb
    tar -xf data.tar.xz
    ar x linux-headers-current-rockchip_*.deb
    tar -xf data.tar.xz

    mkdir -p "$pkgdir/usr/lib/modules/$_kernver"
    mv "usr/src/linux-headers-$_kernver" "$pkgdir/usr/lib/modules/$_kernver/build"

    install -Dm644 "boot/config-$_kernver" "$pkgdir/usr/lib/modules/$_kernver/build/.config"
    install -Dm644 "boot/System.map-$_kernver" "$pkgdir/usr/lib/modules/$_kernver/build/System.map"

    mkdir -p "$pkgdir/usr/src"
    ln -s "../lib/modules/$_kernver/build" "$pkgdir/usr/src/$pkgbase"
}
