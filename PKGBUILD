# Maintainer: Andrew Simmons <agsimmons0 at gmail dot com>

_pkgbase=vendor-reset
pkgname=vendor-reset-dkms-git
pkgver=r117.084881c
pkgrel=2
pkgdesc="Kernel module for vendor-specific hardware reset routines."
arch=('any')
url="https://github.com/gnif/vendor-reset"
license=('GPL-2.0-or-later')
depends=('dkms')
makedepends=('git')
conflicts=('vendor-reset-git' 'vendor-reset-lowell80-dkms-git')
source=('git+https://github.com/gnif/vendor-reset.git')
md5sums=('SKIP')

pkgver() {
    cd "${_pkgbase}"
    (
        set -o pipefail
        git describe --long --abbrev=7 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
        printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
    )
}

package() {
    cd "$srcdir/$_pkgbase"

    install -d "${pkgdir}/usr/src/${_pkgbase}-${pkgver}"/
    cp -r "${srcdir}/${_pkgbase}"/* "${pkgdir}/usr/src/${_pkgbase}-${pkgver}"/

    install -d "${pkgdir}/etc/udev/rules.d"/
    cp "${srcdir}/${_pkgbase}/udev/99-vendor-reset.rules" "${pkgdir}/etc/udev/rules.d"/
}
