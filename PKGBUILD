# Maintainer: Poppy Schmo <poppyschmo at users dot noreply.github.com>
pkgname=chromebook_keyboard_backlight_driver-dkms
_pkgbase=${pkgname%-*}
# XXX as noted on the wiki page for VCS_package_guidelines, "if there are no
# public releases and no repository tags then zero could be used as a release
# number or you can drop RELEASE completely." Rather than doing either, the
# above acknowledgement (that 1.0 is totally wrong) will have to suffice.
pkgver=1.0r24.g39568fa
pkgrel=3
epoch=
pkgdesc="Keyboard backlight driver for various chromebook models"
arch=(x86_64)
url="https://github.com/corcoran/chromebook_keyboard_backlight_driver"
# The source repo does not contain a license, but its upstream is GPL2:
# https://github.com/brocktice/pixel_linux/blob/pixel/COPYING
license=(GPL)
depends=(dkms)
provides=("$pkgname")
conflicts=("$_pkgbase")
install=${pkgname}.install
_commit=39568facbc8440d84e4bfbd9cc380106ddc2b436
_baseurl=git+https://github.com/corcoran/chromebook_keyboard_backlight_driver.git
source=("$_baseurl#commit=$_commit")
md5sums=(SKIP)


pkgver() {
    cd "$srcdir/$_pkgbase"
    printf "1.0r%s.g%s" "$(git rev-list --count HEAD)" "$(git describe --always)"
}

build() {
    cd "$srcdir/$_pkgbase"
    make -j1
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
    install -Dm 644 "$_conf" "$pkgdir/etc/modules-load.d/$_conf"
    #
    make clean
    install -dm 755 "$pkgdir/usr/src/$_pkgbase-$pkgver"
    cp -r ./* "$pkgdir/usr/src/$_pkgbase-$pkgver"
    sed -e "s/^PACKAGE_NAME=.*$/PACKAGE_NAME=$_pkgbase/" \
        -e "s/^PACKAGE_VERSION=.*$/PACKAGE_VERSION=$pkgver/" \
        -i "$pkgdir/usr/src/$_pkgbase-$pkgver/dkms.conf"
}
