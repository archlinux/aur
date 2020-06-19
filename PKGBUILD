# Maintainer: Poppy Schmo <poppyschmo at users dot noreply.github.com>
#
pkgname=chromebook_keyboard_backlight_driver
# This should be 0.0 instead of 0.1 but too late, now
pkgver=1.0r24.g39568fa
pkgrel=3
epoch=
pkgdesc="Keyboard backlight driver for various chromebook models"
arch=("x86_64")
url="https://github.com/corcoran/chromebook_keyboard_backlight_driver"
license=("GPL")
depends=()
provides=("$pkgname")
conflicts=("$pkgname" "$pkgname-dkms")
install=${pkgname}.install
_commit=39568facbc8440d84e4bfbd9cc380106ddc2b436
_baseurl=git+https://github.com/corcoran/chromebook_keyboard_backlight_driver.git
source=("$_baseurl#commit=$_commit")
md5sums=(SKIP)

pkgver() {
    cd "${srcdir}/${pkgname}"
    printf "1.0r%s.g%s" "$(git rev-list --count HEAD)" "$(git describe --always)"
}

build() {
    local _target_dirs _kvers
    cd "${srcdir}/${pkgname}"
    _target_dirs=$(find /usr/lib/modules -name vmlinuz -printf '%h\n')
    while read -r _kvers; do
        [[ -d "$_kvers" ]] || exit 11
        msg2 "$(gettext "Building module for $_kvers")"
        mkdir -p "_output/${_kvers##*/}"
        KDIR="$_kvers/build" make -j1
        mv -v ./*.ko "_output/${_kvers##*/}"
    done <<<"${_target_dirs%$'\n'}"
}

package() {
    local _mod _path _target_dir _mod_dir
    cd "$srcdir/$pkgname"
    echo "chromeos_keyboard_leds" > _load.conf
    install -Dm 644 _load.conf \
        "$pkgdir/etc/modules-load.d/chromebook_keyboard_backlight_driver.conf"
    for _path in _output/*; do
        _kvers=${_path#*/}
        _mod_dir=/usr/lib/modules/$_kvers
        [[ -d $_mod_dir ]] || exit 12
        _target_dir=$_mod_dir/kernel/drivers/platform/chrome
        cd "$_path"
        for _mod in *.ko; do
            xz --force --keep "$_mod"
            [[ $_mod == chromeos_keyboard_bl.ko ]] && continue
            install -Dm 644 "$_mod.xz" "$pkgdir/$_target_dir/$_mod.xz"
        done
        cd "$srcdir/$pkgname"
    done
    install -Dm 644 README.markdown "$pkgdir/usr/share/doc/$pkgname/README.markdown"
    install -Dm 6711 keyboard_brightness "$pkgdir/usr/bin/keyboard_brightness"
}

# vim:ft=sh
