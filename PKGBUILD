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
    "$pkgname.preset"
    "59-$pkgname-remove.hook"
    "91-$pkgname-install.hook"
    "$(cat Packages | grep 'linux-dtb-current-rockchip.*deb' | head -n 1 | sed -r 's#Filename: #https://apt.armbian.com/#')"
    "$(cat Packages | grep 'linux-image-current-rockchip.*deb' | head -n 1 | sed -r 's#Filename: #https://apt.armbian.com/#')"
    "$(cat Packages | grep 'linux-headers-current-rockchip.*deb' | head -n 1 | sed -r 's#Filename: #https://apt.armbian.com/#')"
)
sha512sums=(
    'c7a00e379d723d90c28c70069043a29800be40f120e36527b3aefe5b7acfbcd5680417c2cbf5ff2979c765456d4d5022ac10f01cfc65ab2e7cfb3a104bb670ce'
    '7f82e903345633a5f529a5e8472ba0a892de407e7fc0fa489e9652acc24301d4fa6fe5392ca271ec7f051aba2cfee8aa1d0e5134978453143ed998244b6c1459'
    '6f3ebed8b3c570e04de85dee76ef39f542e79e14994808a7a367128cd820441d506663af75bca0267288677aaf9e6566b0f338aa2ef7111398ee5766e2098eee'
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

    ln -s "vmlinuz-$pkgname" "$pkgdir/boot/zImage"

    install -Dm644 "boot/vmlinuz-$_kernver" "$pkgdir/usr/lib/modules/$_kernver/vmlinuz"
    install -Dm644 "boot/config-$_kernver" "$pkgdir/usr/lib/modules/$_kernver/build/config"
    install -Dm644 "boot/System.map-$_kernver" "$pkgdir/usr/lib/modules/$_kernver/build/System.map"

    install -Dm644 "$pkgname.preset" "$pkgdir/etc/mkinitcpio.d/$pkgname.preset"
    install -Dm644 "59-$pkgname-remove.hook" "$pkgdir/usr/share/libalpm/hooks/59-$pkgname-remove.hook"
    install -Dm644 "91-$pkgname-install.hook" "$pkgdir/usr/share/libalpm/hooks/91-$pkgname-install.hook"
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
