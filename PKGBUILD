# Contributor: Dirk <spam@0x7be.de>
# Maintainer: Dirk <spam@0x7be.de>

pkgbase='menu-builder'
pkgname="${pkgbase}-git"
pkgver=623fce2
pkgrel=3

pkgdesc='An adaptive, half-manual, menu builder intended to be used in conjunction with labwc or Openbox.'
url="https://git.0x7be.net/dirk/${pkgbase}"

arch=('any')
license=('MIT')
makedepends=('gcc' 'marked-man')

source=("git+https://git.0x7be.net/dirk/${pkgbase}")
sha256sums=('SKIP')

pkgver() {
    cd "${srcdir}/${pkgbase}"
    echo "$(git rev-parse --short HEAD)"
}

build() {
    cd "${srcdir}/${pkgbase}"
    gcc -std=c99 -o ${pkgbase} ${pkgbase}.c
    marked-man --silent --version $pkgver --name ${pkgbase} README.md -o ${pkgbase}.1
    marked-man --silent --version $pkgver --name menu-printer extra/README.menu-printer.md -o menu-printer.1
    marked-man --silent --version $pkgver --name menucsv --section 5 example/README.example.md -o ${pkgbase}-menucsv.5
    sed -i "s/# See README.md for details/# See manpage “menu-builder-menucsv” for details/g" "example/example.menucsv"
}

package() {
    cd "$srcdir/${pkgbase}"

    install -Dm 755 "${pkgbase}" "${pkgdir}/usr/bin/${pkgbase}"
    install -Dm 644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgbase}/LICENSE"

    install -Dm 644 "example/example.menucsv" "${pkgdir}/usr/share/${pkgbase}/example.menucsv"
    install -Dm 644 "${pkgbase}-menucsv.5" "${pkgdir}/usr/share/man/man5/${pkgbase}-menucsv.5"
    install -Dm 644 "${pkgbase}".1 "${pkgdir}/usr/share/man/man1/${pkgbase}.1"

    install -Dm 755 "extra/menu-printer.sh" "${pkgdir}/usr/bin/menu-printer"
    install -Dm 644 'menu-printer.1' "${pkgdir}/usr/share/man/man1/menu-printer.1"
}
