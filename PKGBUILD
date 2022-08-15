# Maintainer: Aseem Athale <athaleaseem@gmail.com>
# Contributor: OramahMaalhur <oramahmaalhur@gmail.com>

_gitname=captdriver
pkgname=${_gitname}-git
pkgver=r138.a3036a4
pkgrel=1
pkgdesc='Open source CUPS driver for Canon CAPT printers (not stable, formerly foo2capt)'
arch=('any')
url='https://github.com/mounaiban/captdriver'
depends=('cups')
install=${pkgname}.install
license=('GPL')
makedepends=('automake' 'git' 'gcc')
source=("$_gitname::git+https://github.com/mounaiban/captdriver.git" "capt.rules")
md5sums=('SKIP' '58d3dc5cd1cf6b9e2e44d71885b0f9d5')

pkgver() {
    cd "$srcdir/$_gitname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"

}
build() {
    cd $_gitname
    aclocal
    autoconf
    automake --add-missing
    ./configure --prefix=/usr/
    make
    ppdc -v -d . src/canon-lbp.drv
}

package() {
    install -m 755 -d "${pkgdir}/etc/udev/rules.d/" || return 1
    install -D -m 644 "${srcdir}/capt.rules" "${pkgdir}/etc/udev/rules.d/51-capt.rules"

    install -m 755 -d "${pkgdir}/usr/lib/cups/filter/" || return 1
    install -D -m 755 "${srcdir}/${_gitname}/src/rastertocapt" "${pkgdir}/usr/lib/cups/filter/rastertocapt"

    install -m 755 -d "${pkgdir}/usr/share/cups/model/" || return 1
    install -D -m 644 "${srcdir}/${_gitname}/CanonLBP-2900-3000.ppd" "${pkgdir}/usr/share/cups/model/CanonLBP-2900-3000.ppd"
    install -D -m 644 "${srcdir}/${_gitname}/CanonLBP-3010-3018-3050.ppd" "${pkgdir}/usr/share/cups/model/CanonLBP-3010-3018-3050.ppd"



    cd "$srcdir/$_gitname"
    make PREFIX=/usr DESTDIR="${pkgdir}" install
}
