# Maintainer: Jack Chen <redchenjs@live.com>

pkgname=tinkerboard-bluetooth
pkgver=20.11.0
pkgrel=1
pkgdesc="Tinkerboard Bluetooth support from Armbian"
arch=('armv7h')
url="https://github.com/redchenjs/armbian-ci"
license=('GPL2')
makedepends=('findutils' 'curl')
depends=('bash' 'systemd')
options=('!strip')
install=$pkgname.install
_ubuntu=trunk
_kernel=5.8.18
source=(
    "$pkgname.install"
    "https://github.com/redchenjs/armbian-ci/releases/download/v$_kernel-rockchip/linux-$_ubuntu-root-current-tinkerboard_$pkgver-trunk_armhf.deb"
)
sha512sums=(
    'ae127fb7c2c8e49347d6cf0e959da28c8ac2c7d3971005b5b66eb84ddaa594196194a126d8e9a088f04138102208e9575f22f2ceccd959f69572ef77c98b65e0'
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
    sed -r -i "s#usr/local/bin#usr/bin#g" "$pkgdir/usr/lib/systemd/system/tinker-bluetooth.service"

    install -Dm755 "usr/local/bin/start_bt.sh" "$pkgdir/usr/bin/start_bt.sh"
    sed -r -i "s#usr/local/bin#usr/bin#g" "$pkgdir/usr/bin/start_bt.sh"

    install -Dm755 "usr/bin/rtk_hciattach" "$pkgdir/usr/bin/rtk_hciattach"
}
