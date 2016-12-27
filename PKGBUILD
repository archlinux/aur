# vim: ts=4 sts=4 sw=4 et ft=sh
# Maintainer: Atriix <aur a snilius d com>

pkgname=gvt-git
_pkgname=gvt

pkgver=r86.50d83ea
pkgrel=1
pkgdesc="gvt is a simple vendoring tool made for Go native vendoring"
url="https://github.com/FiloSottile/gvt"
license=('MIT')
arch=('x86_64')
depends=('go>=1.5')
makedepends=('pandoc')

source=(git+https://github.com/FiloSottile/gvt)
sha512sums=('SKIP')

build() {
    rm -rf "${srcdir}/src"
    mkdir -p "${srcdir}/src/github.com/FiloSottile"
    mv "${srcdir}/gvt" "${srcdir}/src/github.com/FiloSottile"
    pushd "${srcdir}/src/github.com/FiloSottile/gvt"
    GOPATH="${srcdir}" go install -v

    echo "% gvt(1) a vendoring tool made for Go native vendoring | ${pkgver}" > manpage_header.txt
    echo "% constabulary; Filippo Valsorda" >> manpage_header.txt
    echo "% $(git log -1 --format=%cd)" >> manpage_header.txt
    echo "" >> manpage_header.txt

    cat manpage_header.txt README.md > MANSRC.md
    pandoc --verbose --standalone --to man MANSRC.md  -o gvt.1
}

pkgver() {
    cd "${srcdir}/../gvt"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    install -D -m755 "${srcdir}/bin/gvt" "${pkgdir}/usr/bin/gvt"
    install -D -m644 "${srcdir}/src/github.com/FiloSottile/gvt/gvt.1" "${pkgdir}/usr/share/man/man1/gvt.1"
    install -D -m644 "${srcdir}/src/github.com/FiloSottile/gvt/LICENSE" "${pkgdir}/usr/share/licenses/gvt/LICENSE"
}
