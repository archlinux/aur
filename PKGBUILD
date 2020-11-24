# Maintainer: Jack Chen <redchenjs@live.com>

pkgname=bsp-tinkerboard
pkgver=20.11.0
pkgrel=1
pkgdesc="BSP for Tinker Board / S (Bluetooth, HDMI, Audio, Udev rules...)"
arch=('armv7h')
url="https://github.com/redchenjs/armbian-ci"
license=('GPL2')
makedepends=('curl')
depends=('bash' 'bluez' 'bluez-tools' 'systemd' 'util-linux' 'wireless_tools' 'xorg-xrandr')
install=$pkgname.install
_ubuntu=focal
_kernel=5.8.18
source=(
    "$pkgname.install"
    "pulseaudio-sink.txt"
    "pulseaudio-source.txt"
    "https://github.com/redchenjs/armbian-ci/releases/download/v$_kernel-rockchip/armbian-firmware_$pkgver-trunk_all.deb"
    "https://github.com/redchenjs/armbian-ci/releases/download/v$_kernel-rockchip/linux-$_ubuntu-root-current-tinkerboard_$pkgver-trunk_armhf.deb"
)
sha512sums=(
    '2bc75567f50efbde4c96f5bf9aed742dccc4083f1a019cfbe196832a6c416b3f12fea8768797e58979bbe2b9ed72f122cab6eb82007039564612fb77e430ab7f'
    '27f4af01d2e34398c05e98ec20eceaaf98cf2d4917d2b809080bef09bf385322b23226890d4bc8585f4aa7f17cd5867e15317c7e477b7bb868e65db3924b43a3'
    '6516f28d8e0e086422d447dcac983f69c3e9d590f82d983a4b3deb8ca21d8cca2e45d9c7591ed4245dac6300ede2200b35ed9eb9387005f1483c5e6e131b2c61'
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

    mkdir -p "$pkgdir/etc"
    mv etc/modprobe.d etc/skel etc/udev "$pkgdir/etc"

    install -Dm755 "usr/local/bin/hdmi-hotplug" "$pkgdir/usr/bin/hdmi-hotplug"
    sed -r -i "s#usr/local/bin#usr/bin#g" "$pkgdir/etc/udev/rules.d/hdmi.rules"

    install -Dm644 "etc/asound.conf" "$pkgdir/etc/asound.conf"
}
