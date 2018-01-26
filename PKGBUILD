# Maintainer: Poppy Schmo <poppyschmo at users dot noreply.github.com>
pkgname=chromebook_keyboard_backlight_driver-dkms
_pkgbase=${pkgname%-*}
pkgver=1.0r24.g39568fa
pkgrel=1
epoch=
pkgdesc="Keyboard backlight driver for various chromebook models"
arch=(i686 x86_64)
url="https://github.com/corcoran/chromebook_keyboard_backlight_driver"
license=(GPL)
depends=(dkms)
makedepends=(linux-headers)
provides=("$pkgname")
conflicts=("$_pkgbase")
install=${pkgname}.install
source=("git://github.com/corcoran/chromebook_keyboard_backlight_driver.git")
md5sums=(SKIP)


pkgver() {
    cd "$srcdir/$_pkgbase"
    printf "1.0r%s.g%s" "$(git rev-list --count HEAD)" "$(git describe --always)"
}

build() {
    cd "$srcdir/$_pkgbase"
    make
}

package() {
    msg2 "Use non-dkms package for the chromeos_keyboard_bl.ko variant"
    #
    cd "$_pkgbase"
    #
    local _modules=(chromebook_kb_backlight chromeos_keyboard_leds)
    #
    # The Makefile does not install this stuff
    local _docd=$pkgdir/usr/share/doc/$pkgname
    install -Dm 644 README.markdown "$_docd/README.markdown"
    install -Dm 6711 keyboard_brightness "$pkgdir/usr/bin/keyboard_brightness"
    #
    local _conf=chromebook_keyboard_backlight_driver.conf
    { echo "# Modules for $pkgname"
        printf '%s\n' "${_modules[@]}"; } > "$_conf"
    install -Dm 644  "$_conf" "$pkgdir/etc/modules-load.d/$_conf"
    #
    make clean
    install -dm 755 "$pkgdir/usr/src/$_pkgbase-$pkgver"
    cp -r ./* "$pkgdir/usr/src/$_pkgbase-$pkgver"
    sed -e "s/^PACKAGE_NAME=.*$/PACKAGE_NAME=$_pkgbase/" \
        -e "s/^PACKAGE_VERSION=.*$/PACKAGE_VERSION=$pkgver/" \
        -i "$pkgdir/usr/src/$_pkgbase-$pkgver/dkms.conf"
    #
}
