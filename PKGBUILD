# Maintainer: Jack Chen <redchenjs@live.com>

pkgname=tinkerboard-bluetooth
pkgver=20.11.0
pkgrel=1
pkgdesc="Tinkerboard Bluetooth support from Armbian"
arch=('armv7h')
url="https://github.com/redchenjs/armbian-ci"
license=('GPL2')
makedepends=('findutils' 'curl' 'systemd')
depends=('bash')
options=('!strip')
_kernel=5.8.18
_ubuntu=trunk
install=$pkgname.install
source=(
    "$pkgname.install"
    "https://github.com/redchenjs/armbian-ci/releases/download/v$_kernel-rockchip/linux-$_ubuntu-root-current-tinkerboard_$pkgver-trunk_armhf.deb"
)
sha512sums=(
    'd31eb68b13a39f70368e8aa36cfd48a4d7e5fd703eb9bf78036a4307ee28f097e07cba4b60a8bfe842c24bfb46779d3e8f5c5790ef17e31bc87e5f8d2fbcfd4f'
    "$(curl -s -L https://github.com/redchenjs/armbian-ci/releases/download/v$_kernel-rockchip/linux-$_ubuntu-root-current-tinkerboard_$pkgver-trunk_armhf.deb.sha512sum)"
)
noextract=("${source[@]##*/}")

prepare() {
    cd "$srcdir"

    rm -rf $(find -mindepth 1 -maxdepth 1 -type d)
}

package() {
    cd "$srcdir"

    ar x linux-$_ubuntu-root-current-tinkerboard_$pkgver-trunk_armhf.deb
    tar -xf data.tar.xz

    install -Dm644 "lib/systemd/system/tinker-bluetooth.service" "$pkgdir/usr/lib/systemd/system/tinker-bluetooth.service"
    sed -r -i "s#local/usr/bin#usr/bin#g" "$pkgdir/usr/lib/systemd/system/tinker-bluetooth.service"

    install -Dm755 "local/usr/bin/start_bt.sh" "$pkgdir/usr/bin/start_bt.sh"
    sed -r -i "s#local/usr/bin#usr/bin#g" "$pkgdir/usr/bin/start_bt.sh"

    install -Dm755 "usr/bin/rtk_hciattach" "$pkgdir/usr/bin/rtk_hciattach"
}
