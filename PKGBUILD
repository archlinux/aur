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
pkgver=1.3.0.r28.gff57802
pkgrel=1
pkgdesc="C source code matching and transformation engine"
arch=('x86_64')
url="https://coccinelle.lip6.fr"
license=('GPL-2.0-or-later')
makedepends=(
    'ocaml'
    'ocaml-findlib'
    'ocaml-num'
    'ocaml-pcre'
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
)
source=(
    "git+https://gitlab.inria.fr/coccinelle/coccinelle.git"
    "0001-fix-bash-completion.patch"
)
b2sums=('SKIP'
        'be6b5bf866c14a5f0e95bd11472563292a37331d2a81b2e52f65bac6a635c5a48293de6bbabe63e9b63e7fb3fefc4083229bcf961b07c53f13796d8dc061f290')
options=('!strip')

pkgver() {
    cd $_basename
    git describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    cd $_basename
    patch -p1 < ../0001-fix-bash-completion.patch
}

build() {
    cd $_basename

    ./autogen

    ./configure \
	--enable-ocaml \
	--enable-opt \
	--enable-pcre \
	--enable-pcre-syntax \
	--enable-python \
	--enable-stdcompat \
	\
	--prefix=/usr \
	--docdir=/usr/share/doc \
	--libdir=/usr/lib/ocaml \
	--mandir=/usr/share/man \
    # TODO, no package yet
    #  --enable-pyml \

    make
}

check() {
    cd $_basename

    # make check is interactive, so do it manually

    ./spatch.opt --testall --no-update-score-file

    cd cpptests
    ../scripts/cpptests.sh
}

package() {
    cd $_basename

    make DESTDIR="$pkgdir/" MANDIR="/usr/share/man" install

    strip \
	$pkgdir/usr/bin/spatch \
	$pkgdir/usr/bin/spgen \
	$pkgdir/usr/bin/spatch \
	$pkgdir/usr/bin/spgen \
	$pkgdir/usr/lib/ocaml/coccinelle/dllpyml_stubs.so \
	$pkgdir/usr/lib/ocaml/coccinelle/dllpyml_stubs.so
}
