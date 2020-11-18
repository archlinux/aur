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
    '0ec3bafb51e4476d6499e9e243501b677637a4218f2f425faa39689e999a364c1d0fda6f3f0ec392611262d086dcb9e1ee5314567e6a7746ab7d98816ce12328'
    '905c31481d2d6c5da65f58270e0c165b62d795d85bacf117faf1934007464696a2a5589f8a0d1cd3c12bf3ff13385ba43b20416f9ad2b199038fdb9208a6416b'
    'a98abd5e200089925b1d1efa7a43284960afe38b7c4b07c517fd4b7d2dc31096089d6abd55d55cb8ff0f5c0b740247e6a0a810e4b9e5509b9e15b843b9224f09'
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
    install -Dm644 "boot/config-$_kernver" "$pkgdir/usr/lib/modules/$_kernver/build/.config"
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
