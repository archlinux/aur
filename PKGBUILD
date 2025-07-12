# Maintainer: marmis <tiagodepalves@gmail.com>
# Contributor: Kudlaty
# Contributor: marmis <tiagodepalves@gmail.com>
# Contributor: vitor_hideyoshi <vitor.h.n.batista@gmail.com>
# Contributor: katt <magunasu.b97@gmail.com>
# Contributor: Yangtse Su <i@yangtse.me>

_pkgname=xpadneo
_dkmsname=hid-${_pkgname}
pkgname=${_pkgname}-dkms
pkgver=0.9.7
pkgrel=1
pkgdesc="Advanced Linux Driver for Xbox One Wireless Gamepad"
arch=('any')
url='https://github.com/atar-axis/xpadneo'
license=('GPL-3.0-or-later')
depends=('dkms' 'bluez' 'bluez-utils')
source=("${_pkgname}-v${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz"
        0001-drop-etc-files.patch)
b2sums=('6715e684d046ad3162db65196896d23f0c70046d02adbf5886d849818120fb731acb86da0a9e18e54b56b31220911ea25c296f1b8473eb0f0fca4fe96b98712b'
        '72d59fc99c8fdd66b3b6bfa45a302114e54e7d1621addde8086723a7c18a6ecc080da7497ac7d43de19c460424a05bba35c51ea0d92cf86498fe9223aceba453')

prepare() {
    cd "${_pkgname}-${pkgver}/${_dkmsname}"

    # Upstream uses dkms.post_install to create modprobe and udev files in
    # /etc. In Arch, it makes more sense to create these files in /usr/lib
    # and let pacman take care of them.
    patch -i "${srcdir}/0001-drop-etc-files.patch"

    # Set the current version in DKMS config file.
    sed "s/@DO_NOT_CHANGE@/v${pkgver}/" dkms.conf.in > dkms.conf
}

check() {
    # Warn if missing linux-headers for current `uname -r` kernel
    CURRENT_KERNEL="$(name -r)"
    if [[ ! -f "/usr/lib/modules/${CURRENT_KERNEL}/build/Makefile" ]]
    then
        _BOLDRED='\033[1;31m'
        _RED='\033[0;31m'
        _RESET='\033[0m'
        echo -e "${_BOLDRED}WARNING:${_RED} You may be missing headers for your current kernel, DKMS packages requires them."
        echo -e "Please refer to https://wiki.archlinux.org/title/Dynamic_Kernel_Module_Support for details.${_RESET}"
    fi
}

package() {
    cd "${_pkgname}-${pkgver}/${_dkmsname}"

    # Module source
    install -Dm0644 -t "${pkgdir}/usr/src/${_dkmsname}-v${pkgver}/src" src/*

    # DKMS files
    install -Dm0644 -t "${pkgdir}/usr/src/${_dkmsname}-v${pkgver}" Makefile dkms.conf
    install -Dm0755 -t "${pkgdir}/usr/src/${_dkmsname}-v${pkgver}" dkms.post_install dkms.post_remove

    # Module dependencies
    install -Dm0644 -t "${pkgdir}/usr/lib/modprobe.d" etc-modprobe.d/*
    install -Dm0644 -t "${pkgdir}/usr/lib/udev/rules.d" etc-udev-rules.d/*
}
