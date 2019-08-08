# Maintainer: DrZingo <markus at borgelin dot org>
# This package contains man-pages created from txt-files in the source.

pkgname=cgterm-git
_gitname=CGTerm
pkgver=r1.01e35d6
pkgrel=1
pkgdesc="C/G telnet client that lets you connect to C64 telnet BBS"
arch=('i686' 'x86_64')
url="https://github.com/MagerValp/CGTerm"
license=('custom:BSD')
depends=('sdl')
makedepends=('git')
source=( "$pkgname"::'git+https://github.com/MagerValp/CGTerm.git' 'cgterm.1.gz' 'cgchat.1.gz' 'LICENSE' )
md5sums=(
    'SKIP'
    'b3913ae8dfa64f5dfd2fc830c7e62a83'
    '1fa28dc46a84150a4a52184aec1e3146'
    '01f185b2b35869909ccef6332ac369ef'
)

pkgver() {
    cd "${pkgname}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    cd "${pkgname}"
    sed -i -e 's/^PREFIX=.*$/PREFIX=\/usr/g' -e 's/-O3 -Wall /-O3 /g' -e 's/mkdir \$(PREFIX)/mkdir -p \$(PREFIX)/g' Makefile
}

build() {
    cd "${pkgname}"
    make all
}

package() {
    cd "${pkgname}"
    make PREFIX="${pkgdir}/usr" install || return 1
    rmdir $pkgdir/usr/etc || return 1

    install -Dm644 $srcdir/LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE || return 1
    install -Dm644 $srcdir/cgterm.1.gz $pkgdir/usr/share/man/man1/cgterm.1.gz || return 1
    install -Dm644 $srcdir/cgchat.1.gz $pkgdir/usr/share/man/man1/cgchat.1.gz || return 1
}

# vim:set ts=4 sw=4 et:
