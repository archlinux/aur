# Contributor: Onni R. <onnir at iki dot fi>
# Maintainer: Jose Riha <jose 1711 gmail com>

pkgname=cursetag-git
_pkgname=cursetag
pkgver=r41.d016c13
pkgrel=1
license=('None')
pkgdesc="an ncurses based audio metadata (tag) editor"
arch=('i686' 'x86_64')
url="https://github.com/lotuskip/cursetag"
depends=('taglib' 'ncurses')
source=("git+$url")
provides=(cursetag)
conflicts=(cursetag)
md5sums=('SKIP')

pkgver() {
    cd "$_pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  sed -i "s|VERSION=.*$|VERSION=\"\\\\\"${pkgver}\\\\\"\"|" "${srcdir}/${_pkgname}/Makefile"
  # sed -i 's|ncursesw/ncurses.h|ncurses.h|' src/io.h
  sed -i '/[^#]/ s/\(^CPPFLAGS += -DCOMPLICATED_CURSES_HEADER.*$\)/#\1/' "${srcdir}/${_pkgname}/Makefile"
}

build() {
  cd ${srcdir}/$_pkgname
  make
}

package() {
  mkdir -p "${pkgdir}/usr/bin" "${pkgdir}/usr/share/man/man1"
  cd ${srcdir}/${_pkgname}
  mv -f cursetag ${pkgdir}/usr/bin
  mv -f cursetag.1 ${pkgdir}/usr/share/man/man1/
}
