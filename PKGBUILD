# Maintainer: Yen Chi Hsuan <yan12125 at gmail.com>
# Contributor: David Stelter <david.stelter@gmail.com>
# Contributor: Francisco Lopes <chico.lopes@gmail.com>

_pkgname=pfff
_github_addr=facebook/pfff
pkgname="$_pkgname-git"
pkgver=v0.28.1.r459.g7edb85d
pkgrel=1
pkgdesc='tools and APIs for code analysis, visualization and transformation'
arch=('x86_64')
url='https://github.com/facebook/pfff'
license=('LGPL2.1')
optdepends=('gtk2: required by codegraph and codemap')
makedepends=('git' 'ocaml' 'ocaml-findlib' 'camlp4')
source=("git+https://github.com/$_github_addr")
options=(!makeflags staticlibs) # parallel build fails, need *.a files
md5sums=('SKIP')
conflicts=(pfff)
provides=(pfff)

pkgver() {
    cd "$srcdir/$_pkgname"
    git describe --long --tags | sed -r 's/([^-]*-g)/r\1/;s/-/./g'
}

build() {
    cd "$srcdir/$_pkgname"
    ./configure --prefix=/usr
    make depend
    make
    make opt
}

package() {
    cd "$srcdir/$_pkgname"
    make DESTDIR=$pkgdir install
    mkdir -p ${pkgdir}/usr/lib/ocaml # ocamlfind won't do this itself...
    make OCAMLFIND_LDCONF=${pkgdir}/tmp/ld.conf OCAMLFIND_DESTDIR=${pkgdir}/usr/lib/ocaml install-findlib
}
