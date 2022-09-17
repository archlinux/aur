# Mantainer: marmis <tiagodepalves@gmail.com>
# Contributor: vitor_hideyoshi <vitor.h.n.batista@gmail.com>
# Contributor: katt <magunasu.b97@gmail.com>
# Contributor: Yangtse Su <i@yangtse.me>

pkgname=xpadneo-dkms
pkgver=0.9.5
pkgrel=1
pkgdesc='Advanced Linux Driver for Xbox One Wireless Gamepad'
arch=(any)
url=https://github.com/atar-axis/xpadneo
license=(GPL)
depends=(dkms bluez bluez-utils)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/atar-axis/xpadneo/archive/v$pkgver.tar.gz")
b2sums=('82c5bd4e9d68e0b9465047d446a1ffe0c95b9590d76f1c6cec2d6e1c770a6c3f7c6c47cffef5ce27c449f1ada854dd9b6e6413791360c0d8eee8a697718bb320')

package() {
    cd "xpadneo-${pkgver}/hid-xpadneo"

    ## DKMS source files
    install -D -m0644 Makefile -t "${pkgdir}"/usr/src/"hid-xpadneo-${pkgver}"
    install -D -m0644 src/* -t "${pkgdir}"/usr/src/"hid-xpadneo-${pkgver}"/src

    ## DKMS config file
    sed "s/\"@DO_NOT_CHANGE@\"/\"${pkgver}\"/g" dkms.conf.in |\
        install -D -m0644 /dev/stdin "${pkgdir}"/usr/src/"hid-xpadneo-${pkgver}"/dkms.conf

    ## DKMS post scripts
    #
    # The last 10 lines are removed since they are responsible for copying modprobe and udev files
    # at DKMS install time. In Arch Linux, it makes more sense to let pacman handle these files.
    head -n -10 dkms.post_install |\
        install -D -m0755 /dev/stdin "${pkgdir}"/usr/src/"hid-xpadneo-${pkgver}"/dkms.post_install
    head -n -10 dkms.post_remove |\
        install -D -m0755 /dev/stdin "${pkgdir}"/usr/src/"hid-xpadneo-${pkgver}"/dkms.post_remove

    ## Modprobe and udev rules
    #
    # No need to reaload rules manually, as pacman already has a hook for that.
    install -D -m0644 etc-modprobe.d/*.conf -t "${pkgdir}"/usr/lib/modprobe.d
    install -D -m0644 etc-udev-rules.d/*.rules -t "${pkgdir}"/usr/lib/udev/rules.d
}
