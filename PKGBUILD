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
    "$pkgbase.preset"
    "59-$pkgbase-remove.hook"
    "91-$pkgbase-install.hook"
    "$(cat Packages | grep 'linux-dtb-current-rockchip.*deb' | head -n 1 | sed -r 's#Filename: #https://apt.armbian.com/#')"
    "$(cat Packages | grep 'linux-image-current-rockchip.*deb' | head -n 1 | sed -r 's#Filename: #https://apt.armbian.com/#')"
    "$(cat Packages | grep 'linux-headers-current-rockchip.*deb' | head -n 1 | sed -r 's#Filename: #https://apt.armbian.com/#')"
)
sha512sums=(
    'c7a00e379d723d90c28c70069043a29800be40f120e36527b3aefe5b7acfbcd5680417c2cbf5ff2979c765456d4d5022ac10f01cfc65ab2e7cfb3a104bb670ce'
    '91becd9ab8763914fb9b4e3eeb1fe2493535baa144f763dd59dd5f8e84a5151ed75548113ae31db86c38c60d8c81ac4d9a55162c6f35b3ca886747834fadc86d'
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
    ln -s "vmlinuz-$pkgbase" "$pkgdir/boot/zImage"

    echo "$pkgbase" > "$pkgdir/usr/lib/modules/$_kernver/pkgbase"
    install -Dm644 "boot/vmlinuz-$_kernver" "$pkgdir/usr/lib/modules/$_kernver/vmlinuz"
    install -Dm644 "boot/config-$_kernver" "$pkgdir/usr/lib/modules/$_kernver/build/config"
    install -Dm644 "boot/System.map-$_kernver" "$pkgdir/usr/lib/modules/$_kernver/build/System.map"

    install -Dm644 "$pkgbase.preset" "$pkgdir/etc/mkinitcpio.d/$pkgbase.preset"
    install -Dm644 "59-$pkgbase-remove.hook" "$pkgdir/usr/share/libalpm/hooks/59-$pkgbase-remove.hook"
    install -Dm644 "91-$pkgbase-install.hook" "$pkgdir/usr/share/libalpm/hooks/91-$pkgbase-install.hook"
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
