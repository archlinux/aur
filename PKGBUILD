# Maintainer: Manuel Wiesinger <m {you know what belongs here} mmap {and here} at>
# Contributor: Omar Sandoval <osandov at osandov dot com>
# Contributor: Roger Zanoni <rogerzanoni@gmail.com>
# Contributor: Sylvain Henry <hsyl20@gmail.com>
# Contributor: Marti Raudsepp <marti@juffo.org>
# Contributor: Dan McGee <dpmcgee@gmail.com>
# Contributor: LeCrayonVert <sunrider@laposte.net>
# Contributor: Lukas Fleischer <archlinux@cryptocrack.de>
# Contributor: Vladimir Kirillov <proger@wilab.org.ua>

pkgname=coccinelle
pkgver=1.3.0
pkgrel=3
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
    'ocaml-findlib: OCaml scripting feature'
    'ocaml: OCaml scripting feature'
    'python-psycopg2: PostgreSQL support for Python bindings'
)
source=(
    "$pkgname-$pkgver.tar.gz::https://github.com/coccinelle/${pkgname}/archive/${pkgver}.tar.gz"
    "0001-fix-bash-completion.patch"
)
b2sums=('f5aa1dfb138a2b9e306fb712294481dcd84042fc0c0f05711be83892b0d567134694ef8e7aad3762fb7d775ec2b02bfc7984b34bbe901b4566811fbaab9ffc5d'
        'be6b5bf866c14a5f0e95bd11472563292a37331d2a81b2e52f65bac6a635c5a48293de6bbabe63e9b63e7fb3fefc4083229bcf961b07c53f13796d8dc061f290')
options=('!strip')

prepare() {
    cd "$pkgname-$pkgver"
    patch -p1 < ../0001-fix-bash-completion.patch
}

build() {
    cd "$pkgname-$pkgver"

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
	--mandir=/usr/share/man

    make
}

check() {
    cd "$pkgname-$pkgver"

    # make check is interactive, so do it manually

    ./spatch.opt --testall --no-update-score-file

    cd cpptests
    ../scripts/cpptests.sh
}

package() {
    cd "$pkgname-$pkgver"

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
