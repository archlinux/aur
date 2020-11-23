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
_ubuntu=focal
_kernel=5.8.18
source=(
    "$pkgname.install"
    "https://github.com/redchenjs/armbian-ci/releases/download/v$_kernel-rockchip/armbian-firmware_$pkgver-trunk_all.deb"
    "https://github.com/redchenjs/armbian-ci/releases/download/v$_kernel-rockchip/linux-$_ubuntu-root-current-tinkerboard_$pkgver-trunk_armhf.deb"
)
sha512sums=(
    'f062bc692e5fbf123d22ad1aa17be2ef8659f20ab3454693a69cee487cd8093d3f9d21f411ce93117828cf1664fa7ff7481d93232d261431909db1ef7ea6c9e9'
    "$(curl -s -L https://github.com/redchenjs/armbian-ci/releases/download/v$_kernel-rockchip/armbian-firmware_$pkgver-trunk_all.deb.sha512sum)"
    "$(curl -s -L https://github.com/redchenjs/armbian-ci/releases/download/v$_kernel-rockchip/linux-$_ubuntu-root-current-tinkerboard_$pkgver-trunk_armhf.deb.sha512sum)"
)
noextract=("${source[@]##*/}")

prepare() {
    cd "$srcdir"

    rm -rf $(find -mindepth 1 -maxdepth 1 -type d)
}

package() {
    cd "$srcdir"

    ar x "armbian-firmware_$pkgver-trunk_all.deb"
    tar -xf data.tar.xz
    ar x "linux-$_ubuntu-root-current-tinkerboard_$pkgver-trunk_armhf.deb"
    tar -xf data.tar.xz

    install -Dm644 "lib/systemd/system/tinker-bluetooth.service" "$pkgdir/usr/lib/systemd/system/tinker-bluetooth.service"
    sed -r -i "s#usr/local/bin#usr/bin#g" "$pkgdir/usr/lib/systemd/system/tinker-bluetooth.service"

    install -Dm755 "usr/local/bin/start_bt.sh" "$pkgdir/usr/bin/start_bt.sh"
    sed -r -i "s#usr/local/bin#usr/bin#g" "$pkgdir/usr/bin/start_bt.sh"

    install -Dm644 "lib/firmware/rtlbt/rtl8723b_config" "$pkgdir/usr/lib/firmware/rtlbt/rtl8723b_config"
    install -Dm644 "lib/firmware/rtlbt/rtl8723b_fw" "$pkgdir/usr/lib/firmware/rtlbt/rtl8723b_fw"
    install -Dm755 "usr/bin/rtk_hciattach" "$pkgdir/usr/bin/rtk_hciattach"
}
