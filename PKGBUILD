# Maintainer: Alad Wenter <alad@archlinux.org>
# Contributor: Earnestly <https://github.com/Earnestly>
pkgname=frama-c-git
pkgver=19.1.r1.g17683929
pkgrel=1
pkgdesc='source-code analysis of c software'
url='http://frama-c.com'
arch=('x86_64')
license=('LGPL')
depends=('glibc' 'ncurses' 'ocaml-findlib' 'ocaml-ocamlgraph' 'ocaml-zarith'
         'ocaml-yojson' 'gtksourceview2')
# Because Arch's lablgtk2 package no longer includes lablgnomecanvas.cmxa we
# can't build the GUI.
makedepends=('git' 'ocaml' 'ocaml-num' 'alt-ergo' 'ltl2ba' 'libxslt' 'jemalloc'
             'why3' 'doxygen')
source=('git+https://github.com/Frama-C/Frama-C-snapshot')
sha256sums=('SKIP')

pkgver() {
    cd Frama-C-snapshot
    git describe --long --tags | sed -r 's/^v//; s/([^-]*-g)/r\1/; s/-/./g'
}

build() {
    cd Frama-C-snapshot
    # Even though frama-c provides a prepared configure script, it seems to
    # have some kind of faulty logic in the Makefile which will run autoconf,
    # regenerating the configure script and running it again.  So to bypass
    # this duplication I just run autoconf initially.
    autoconf

    ./configure --prefix=/usr
    make
}

package() {
    cd Frama-C-snapshot
    make DESTDIR="$pkgdir" install
}
