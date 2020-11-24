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
    'ad22fa716c1d8ecc825c49650c39a4f7977f9670e1d09c6bc2aad636d2a9d8c0855d8065a7c0c59bceb361bdbc0ac7e0cdc9aabbbd305e790e8566b2c48942b1'
    'ba864bea8e0de5c37e9953706295b26c0a74e779310a4b43326e1d89b5ad5f34365fd0e64bdc23d58a06109c58ef697ad2a5845c4e3713d83d2a2b88e2768d90'
    'c109a8b3d2d6bfc6f90c747d7e76e50f316b542f0a38df582ea3b5ed5e7de388ee853e6d5f5f8c2f35612857fe10959cb68467440bda3bf33a335cfd78b7e024'
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
    install -Dm644 "pulseaudio-sink.txt" "$pkgdir/etc/pulse/pulseaudio-sink.txt"
    install -Dm644 "pulseaudio-source.txt" "$pkgdir/etc/pulse/pulseaudio-source.txt"
}
