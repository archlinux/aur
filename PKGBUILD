# Maintainer: Andrew Simmons <agsimmons0 at gmail dot com>

_pkgbase=vendor-reset
pkgname=vendor-reset-lowell80-dkms-git
pkgver=r134.9ffeb25
pkgrel=1
pkgdesc="Kernel module for vendor-specific hardware reset routines - Updated fork"
arch=('any')
url="https://github.com/lowell80/vendor-reset"
license=('GPL-2.0-or-later')
depends=('dkms')
makedepends=('git')
conflicts=('vendor-reset-git')
source=('git+https://github.com/lowell80/vendor-reset.git')
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
