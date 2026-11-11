# Maintainer: Sergey Kanafyev <sergeykanafyev@gmail.com>
# Contributor: Christian Wieden <wiedenchr@gmail.com>
# Automation: https://github.com/its-me/aur.hstr

pkgname=hstr
pkgver=3.3
pkgrel=2
pkgdesc="Bash and Zsh shell history suggest box - easily view, navigate, search and manage your command history."
arch=('x86_64')
url="https://github.com/dvorka/hstr"
license=('Apache')
makedepends=('readline' 'ncurses')
depends=('readline')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/dvorka/${pkgname}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('3ed81ff74995c5984ce0dcaec7f27afe6256632a96ada809a6c41f9b46abcdf6')

build() {
    cd "${pkgname}-${pkgver}/build/tarball"
    ./tarball-automake.sh
    cd ../..
    sed -i -e "s#<ncursesw/curses.h>#<curses.h>#g" src/include/hstr_curses.h
    sed -i -e "s#<ncursesw/curses.h>#<curses.h>#g" src/include/hstr.h
    ./configure --prefix=/usr
    make
}

package() {
    cd "${pkgname}-${pkgver}"
    make DESTDIR="${pkgdir}/" install
    install -D -p -m 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -D -p -m 644 Changelog "${pkgdir}/usr/share/doc/${pkgname}/Changelog"
    install -D -p -m 644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
