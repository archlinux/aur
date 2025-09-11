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
conflicts=("$_pkgname")
provides=("$_pkgname")
source=("$_pkgname"::"git+$url.git"
        '0001-drop-etc-files.patch')
b2sums=('SKIP'
        '72d59fc99c8fdd66b3b6bfa45a302114e54e7d1621addde8086723a7c18a6ecc080da7497ac7d43de19c460424a05bba35c51ea0d92cf86498fe9223aceba453')

prepare() {
    cd "${_pkgname}/${_dkmsname}"

    # Upstream uses dkms.post_install to create modprobe and udev files in
    # /etc. In Arch, it makes more sense to create these files in /usr/lib
    # and let pacman take care of them.
    patch -i "${srcdir}/0001-drop-etc-files.patch"

    # Set the current version in DKMS config file.
    sed "s/@DO_NOT_CHANGE@/v${pkgver}/" dkms.conf.in > dkms.conf
}

pkgver() (
  cd "${_pkgname}"

  git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
)

package() {
    cd "${_pkgname}/${_dkmsname}"

    install -d "${pkgdir}/usr/src/${_dkmsname}-v${pkgver}/src"

    # Module source
    cp -a src/* "${pkgdir}/usr/src/${_dkmsname}-v${pkgver}/src"

    # DKMS files
    install -Dm0644 -t "${pkgdir}/usr/src/${_dkmsname}-v${pkgver}" Makefile dkms.conf
    install -Dm0755 -t "${pkgdir}/usr/src/${_dkmsname}-v${pkgver}" dkms.post_install dkms.post_remove

    # Module dependencies
    install -Dm0644 -t "${pkgdir}/usr/lib/modprobe.d" etc-modprobe.d/*
    install -Dm0644 -t "${pkgdir}/usr/lib/udev/rules.d" etc-udev-rules.d/*
}

