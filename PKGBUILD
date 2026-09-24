# Maintainer: BillyAddlers <me@riichi.my.id>
#
# Patched fork of Linuwu-Sense for Acer Nitro AN515-55/58.
# Contains the fan-speed fix (correct strscpy usage in the sysfs store
# handlers) and kernel-7.2 API compatibility, plus DKMS packaging.
# Builds against every installed kernel (gcc- or clang-built) thanks to
# per-kernel toolchain auto-detection in the upstream Makefile.

pkgname=linuwu-sense-an515-55-dkms
pkgver=25.701
pkgrel=2
pkgdesc="Patched Acer Nitro AN515-55/58 WMI driver (DKMS) with fan-speed fix and kernel 7.2 compatibility"
arch=('any')
url="https://github.com/BillyAddlers/Linuwu-Sense-AN515-55-Patch"
license=('GPL')
depends=('dkms')
optdepends=('linux-headers: build for the standard kernel'
            'linux-lts-headers: build for the LTS kernel'
            'linux-cachyos-headers: build for the CachyOS kernel'
            'linux-zen-headers: build for the zen kernel'
            'clang: build with clang/LLVM (needed if kernel was built with clang)'
            'gcc: build with gcc')
makedepends=('git')
conflicts=('linuwu-sense-dkms')
install=linuwu-sense.install

_gitrepo="https://github.com/BillyAddlers/Linuwu-Sense-AN515-55-Patch.git"
source=("git+${_gitrepo}#branch=main"
        "linuwu-sense-setup.service")
sha256sums=('SKIP'
            '2846ae5165408f3681092740c6d00f014343f0d757b2bdc605f1e066eed7ee62')

package() {
    local srcdirname="Linuwu-Sense-AN515-55-Patch"

    dkms_src="$pkgdir/usr/src/linuwu_sense-$pkgver"
    install -d "$dkms_src"
    cp -r "$srcdir/$srcdirname/"* "$dkms_src/"

    rm -f "$dkms_src"/src/*.o "$dkms_src"/src/*.ko \
          "$dkms_src"/src/*.mod* "$dkms_src"/src/.cache.mk \
          "$dkms_src"/Module.symvers "$dkms_src"/modules.order

    install -Dm644 "$srcdir/$srcdirname/linuwu_sense.service" \
        "$pkgdir/usr/lib/systemd/system/linuwu_sense.service"

    install -Dm644 "$srcdir/linuwu-sense-setup.service" \
        "$pkgdir/usr/lib/systemd/system/linuwu-sense-setup.service"

    install -Dm644 /dev/stdin "$pkgdir/usr/lib/modules-load.d/linuwu_sense.conf" <<< 'linuwu_sense'

    install -Dm644 /dev/stdin "$pkgdir/usr/lib/modprobe.d/blacklist-acer_wmi.conf" <<< 'blacklist acer_wmi'

    install -Dm644 /dev/stdin "$pkgdir/usr/lib/sysusers.d/linuwu_sense.conf" <<< 'g linuwu_sense - -'

    local base="/sys/module/linuwu_sense/drivers/platform:acer-wmi/acer-wmi"
    local nitro_fields="fan_speed battery_limiter battery_calibration usb_charging"
    local predator_fields="backlight_timeout battery_calibration battery_limiter boot_animation_sound fan_speed lcd_override usb_charging"
    {
        for f in $nitro_fields; do
            echo "m $base/nitro_sense/$f 0660 root linuwu_sense"
        done
        for f in $predator_fields; do
            echo "m $base/predator_sense/$f 0660 root linuwu_sense"
        done
        for z in four_zone_mode per_zone_mode; do
            echo "m $base/four_zoned_kb/$z 0660 root linuwu_sense"
        done
    } | install -Dm644 /dev/stdin "$pkgdir/usr/lib/tmpfiles.d/linuwu_sense.conf"
}
