# Contributor: Dirk <spam@0x7be.de>
# Maintainer: Dirk <spam@0x7be.de>

_name='menu-builder'
pkgrel=1

pkgdesc='An adaptive, half-manual, not fail-proof menu builder intended to be used in conjunction with labwc.'
url='https://git.0x7be.net/dirk/menu-builder'

arch=('any')
license=('MIT')
depends=('gcc')
makedepends=('gcc' 'marked-man')

source=("git+https://git.0x7be.net/dirk/${_name}")
sha256sums=('SKIP')

pkgname="${_name}-git"
pkgbase="${_name}"
pkgver=67c6568

pkgver() {
    cd "${srcdir}/${_name}"
    echo "$(git rev-parse --short HEAD)"
}

build() {
    cd "${srcdir}/${_name}"
    gcc -std=c99 -o ${_name} ${_name}.c
    marked-man --silent --version $pkgver --name menu-builder README.md -o menu-builder.1
    marked-man --silent --version $pkgver --name labwc-menu-printer extra/README.labwc-menu-printer.md -o labwc-menu-printer.1
    marked-man --silent --version $pkgver --name menucsv --section 5 example/README.example.md -o menu-printer-menucsv.5
}

package() {
    cd "$srcdir/${_name}"
    install -Dm 755 "${_name}" "${pkgdir}/usr/bin/${_name}"
    install -Dm 644 LICENSE.txt "${pkgdir}/usr/share/licenses/${_name}/LICENSE"

    install -Dm 755 "extra/labwc-menu-printer.sh" "${pkgdir}/usr/bin/labwc-menu-printer"
    install -Dm 644 "example/example.menucsv" "${pkgdir}/usr/share/menu-printer/example.menucsv"

    install -Dm 644 "${_name}".1 "${pkgdir}/usr/share/man/man1/${_name}.1"
    install -Dm 644 'labwc-menu-printer.1' "${pkgdir}/usr/share/man/man1/labwc-menu-printer.1"
    install -Dm 644 'menu-printer-menucsv.5' "${pkgdir}/usr/share/man/man5/menu-printer-menucsv.5"
}
