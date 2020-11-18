# Maintainer: Jack Chen <redchenjs@live.com>

pkgbase=linux-rockchip
pkgname=('linux-rockchip' 'linux-rockchip-headers')
pkgver=20.08.14
pkgrel=1
arch=('armv7h')
url="https://apt.armbian.com"
license=('GPL2')
depends=('coreutils' 'kmod' 'mkinitcpio' 'uboot-tools')
provides=('linux' 'linux-rockchip')
options=('!strip')

_pkgfile=$(curl -s -L https://apt.armbian.com/dists/focal/main/binary-armhf/Packages -o Packages)
_kernver=$(cat Packages | grep 'linux-dtb-current-rockchip.*deb' | head -n 1 | sed -r 's#.*l/linux-(.*)/l.*#\1#')

source=(
    "linux-rockchip.preset"
    "59-linux-rockchip-remove.hook"
    "91-linux-rockchip-install.hook"
    "$(cat Packages | grep 'linux-dtb-current-rockchip.*deb' | head -n 1 | sed -r 's#Filename: #https://apt.armbian.com/#')"
    "$(cat Packages | grep 'linux-image-current-rockchip.*deb' | head -n 1 | sed -r 's#Filename: #https://apt.armbian.com/#')"
    "$(cat Packages | grep 'linux-headers-current-rockchip.*deb' | head -n 1 | sed -r 's#Filename: #https://apt.armbian.com/#')"
)
sha512sums=(
    'c7a00e379d723d90c28c70069043a29800be40f120e36527b3aefe5b7acfbcd5680417c2cbf5ff2979c765456d4d5022ac10f01cfc65ab2e7cfb3a104bb670ce'
    'eb861063fa1fa8565651ee8e317a9d19f110380fe5a9e338c7975967d292dda973ef68350db40ddff93f8c2b0a5e719704a83bee3f9d8e806787f469c850ffa2'
    '61120b67b38adfe0588d948cbc0b765795a5201daa47145d7f1088626dad82e6dbb207f9279397d4935175689dbf075da6f01d0d89aafaccc4d3ca68bf1d3b7f'
    "$(cat Packages | grep 'linux-dtb-current-rockchip.*deb' -A 5 | grep SHA512 | head -n 1 | sed -r 's#SHA512: ##')"
    "$(cat Packages | grep 'linux-image-current-rockchip.*deb' -A 5 | grep SHA512 | head -n 1 | sed -r 's#SHA512: ##')"
    "$(cat Packages | grep 'linux-headers-current-rockchip.*deb' -A 5 | grep SHA512 | head -n 1 | sed -r 's#SHA512: ##')"
)
noextract=("${source[@]##*/}")

pkgver() {
    cat ../Packages | grep 'linux-image-current-rockchip.*deb' | head -n 1 | sed -r 's#.*_(.*)_armhf.*#\1#'
}

prepare() {
    cd "$srcdir"

    rm -rf boot etc lib usr
}

package_linux-rockchip() {
    pkgdesc="Rockchip Linux kernel and modules from Armbian"
    depends=('coreutils' 'kmod' 'mkinitcpio' 'uboot-tools')
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

    install -Dm644 "boot/vmlinuz-$_kernver" "$pkgdir/boot/zImage"
    install -Dm644 "boot/config-$_kernver" "$pkgdir/usr/lib/modules/$_kernver/build/config"
    install -Dm644 "boot/System.map-$_kernver" "$pkgdir/usr/lib/modules/$_kernver/build/System.map"

    install -Dm644 linux-rockchip.preset "$pkgdir/etc/mkinitcpio.d/linux-rockchip.preset"
    install -Dm644 59-linux-rockchip-remove.hook "$pkgdir/usr/share/libalpm/hooks/59-linux-rockchip-remove.hook"
    install -Dm644 91-linux-rockchip-install.hook "$pkgdir/usr/share/libalpm/hooks/91-linux-rockchip-install.hook"

    install -Dm644 /dev/null "$pkgdir/usr/lib/initcpio/hooks/$pkgname"
}

package_linux-rockchip-headers() {
    pkgdesc="Headers and scripts for building modules for the $pkgbase kernel"
    depends=('linux-rockchip')
    provides=('linux-headers' 'linux-headers-rockchip')

    cd "$srcdir"

    ar x linux-headers-current-rockchip_*.deb
    tar -xf data.tar.xz

    mkdir -p "$pkgdir/usr/lib/modules/$_kernver"
    mv "usr/src/linux-headers-$_kernver" "$pkgdir/usr/lib/modules/$_kernver/build"

    mkdir -p "$pkgdir/usr/src"
    ln -s "../lib/modules/$_kernver/build" "$pkgdir/usr/src/$pkgbase"
}
