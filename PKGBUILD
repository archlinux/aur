# Mantainer: marmis <tiagodepalves@gmail.com>
# Contributor: vitor_hideyoshi <vitor.h.n.batista@gmail.com>
# Contributor: katt <magunasu.b97@gmail.com>
# Contributor: Yangtse Su <i@yangtse.me>

pkgname=xpadneo-dkms
pkgver=0.9.5
pkgrel=2
pkgdesc='Advanced Linux Driver for Xbox One Wireless Gamepad'
arch=(any)
url=https://github.com/atar-axis/xpadneo
license=(GPL)
depends=(dkms bluez bluez-utils)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/atar-axis/xpadneo/archive/v$pkgver.tar.gz")
b2sums=('d04a3e1b626af1f1a9ec114f0a8ed44c50ec8cde9da71483491d1afd7688611fd7548186ea68ef8a144aecec06acba816e81e9f0708c8dceb96fa1d40985bb44')

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
