# Maintainer: Manuel Wiesinger <m {you know what belongs here} mmap {and here} at>
# Contributor: Omar Sandoval <osandov at osandov dot com>
# Contributor: Roger Zanoni <rogerzanoni@gmail.com>
# Contributor: Sylvain Henry <hsyl20@gmail.com>
# Contributor: Marti Raudsepp <marti@juffo.org>
# Contributor: Dan McGee <dpmcgee@gmail.com>
# Contributor: LeCrayonVert <sunrider@laposte.net>
# Contributor: Lukas Fleischer <archlinux@cryptocrack.de>
# Contributor: Vladimir Kirillov <proger@wilab.org.ua>

_basename=coccinelle
pkgname=$_basename-git
pkgver=1.3.r203.g9e8fb87
pkgrel=1
pkgdesc="C source code matching and transformation engine"
arch=('x86_64')
url="https://coccinelle.lip6.fr"
license=('GPL-2.0-or-later')
makedepends=(
    'ocaml'
    'ocaml-findlib'
    'ocaml-menhir'
    'ocaml-num'
    'ocaml-parmap'
    'ocaml-pcre'
    'ocaml-pyml'
    'ocaml-stdcompat'
)
depends=(
    'glibc'
    'pcre'
    'python'
    'zstd'
)
checkdepends=(
    'ocaml'
)
optdepends=(
    'ocaml: OCaml scripting feature'
    'ocaml-findlib: OCaml scripting feature'
    'python-psycopg2: PostgreSQL support for Python bindings'
)
source=("git+https://gitlab.inria.fr/coccinelle/coccinelle.git")
b2sums=('SKIP')
options=('!strip')
provides=($_basename)
conflicts=($_basename)

pkgver() {
    cd $_basename
    git describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd $_basename

    ./autogen

    ./configure \
	--enable-bytes \
	--enable-dynlink \
	--enable-menihr \
	--enable-ocaml \
	--enable-opt \
	--enable-opt \
	--enable-pcre \
	--enable-pcre-syntax \
	--enable-pyml \
	--enable-python \
	--enable-stdcompat \
	--enable-parmap \
	\
	--prefix=/usr \
	--docdir=/usr/share/doc \
	--libdir=/usr/lib/ocaml \
	--mandir=/usr/share/man \
    make
}

check() {
    cd $_basename
    make check
}

package() {
    cd $_basename

    make DESTDIR="$pkgdir/" MANDIR="/usr/share/man" install

    # Emacs modes
    install -Dm644 editors/emacs/cocci.el -t $pkgdir/usr/share/emacs/site-lisp
    install -Dm644 editors/emacs/cocci-ediff.el -t $pkgdir/usr/share/emacs/site-lisp

    # vim
    install -Dm644 editors/vim/ftdetect/cocci.vim -t $pkgdir/usr/share/vim/vimfiles/ftdetect
    install -Dm644 editors/vim/syntax/cocci.vim -t $pkgdir/usr/share/vim/vimfiles/syntax

    strip \
	$pkgdir/usr/bin/spatch \
	$pkgdir/usr/bin/spgen
}
