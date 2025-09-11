# Maintainer: Eduard T <edu4rdshl@protonmail.com>
# Contributor: Joel Grunbaum <joel@joelg.net>
# Contributer: Yangtse Su <i@yangtse.me>

_pkgname="xpadneo"
_dkmsname="hid-${_pkgname}"
pkgname="$_pkgname-dkms-git"
pkgver=0.9.r226.ga16acb0
pkgrel=1
pkgdesc="Advanced Linux Driver for Xbox One Wireless Gamepad"
url="https://github.com/atar-axis/xpadneo"
license=('GPL-3.0-or-later')
arch=('any')
depends=('dkms' 'bluez' 'bluez-utils')
makedepends=('git')
conflicts=("${pkgname%-git}")
provides=("${pkgname%-git}")
source=("$_pkgname"::"git+$url.git")
b2sums=('SKIP')

pkgver() (
    cd "${_pkgname}"

    git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
)

prepare() {
    cd "${_pkgname}/${_dkmsname}"

    sed -E \
      -e '/^CLEAN/d' \
      -e '/^POST_INSTALL/d' \
      -e '/^POST_REMOVE/d' \
      -e 's/@DO_NOT_CHANGE@/'"v${pkgver}"'/g' \
      dkms.conf.in > dkms.conf

    rm -f dkms.post_*
}

package() {
    cd "${_pkgname}/${_dkmsname}"

    install -d "${pkgdir}/usr/src/${_dkmsname}-v${pkgver}/src"

    # Module source
    cp -a src/* "${pkgdir}/usr/src/${_dkmsname}-v${pkgver}/src"
    # DKMS files
    install -Dm0644 -t "${pkgdir}/usr/src/${_dkmsname}-v${pkgver}" Makefile dkms.conf
    # Module dependencies
    install -Dm0644 -t "${pkgdir}/usr/lib/modprobe.d" etc-modprobe.d/*
    install -Dm0644 -t "${pkgdir}/usr/lib/udev/rules.d" etc-udev-rules.d/*
}

