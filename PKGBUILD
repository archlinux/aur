# Maintainer: Manuel Wiesinger <m {you know what belongs here} mmap {and here} at>

_ocamlname=stdcompat
pkgname=ocaml-$_ocamlname
pkgver=19
pkgrel=1
pkgdesc="Compatibility module for OCaml standard library"
url="https://github.com/thierry-martinez/stdcompat"
license=('BSD-2-Clause')
source=(
    "$pkgname-$pkgver.tar.gz::https://github.com/thierry-martinez/stdcompat/archive/refs/tags/v${pkgver}.tar.gz"
    "0001-ocaml-5.2-support.patch::https://github.com/thierry-martinez/stdcompat/commit/05337180c722fbb54fd51aa40db82555f1aef54f.patch"
)
depends=('glibc')
makedepends=('ocaml-findlib')
arch=('x86_64')
b2sums=('4af97c355b98f63366d647a4a375bde43ffbf959a2c02132ab57457db4213b8f98a972bf99667dd53603b28235b4f853470c2117270ce42c6aa579a21dd148fb'
        '39506328f05ad5d6236f18c6e1d0a9d1d2bc6ffd74159a4f67c3da3c11825166ae317fb3598f2cc970683098110cdc31dd28aaa53aff457054dc3fd084936eb2')

prepare() {
    cd "${srcdir}/${_ocamlname}-${pkgver}"
    patch -p1 < ../0001-ocaml-5.2-support.patch
}

OCAMLFIND_DESTDIR="${pkgdir}$(ocamlfind printconf destdir)"

check() {
    cd "${srcdir}/${_ocamlname}-${pkgver}"
    make test
}

build() {
    cd "${srcdir}/${_ocamlname}-${pkgver}"

    make -f Makefile.bootstrap
    ./configure \
        --prefix=/usr \
	--libdir "/usr/lib/ocaml" \
	--docdir "/usr/share/doc"
    make
}

package() {
    cd "${srcdir}/${_ocamlname}-${pkgver}"

    env DESTDIR="${pkgdir}" \
    OCAMLFIND_DESTDIR="$OCAMLFIND_DESTDIR" \
    make install

    install -Dm644 COPYING -t $pkgdir/usr/share/licenses/$pkgname/

    # Fix permissions
    chmod 644 $pkgdir/usr/lib/ocaml/stdcompat/libstdcompat__stubs.a
    chmod 644 $pkgdir/usr/lib/ocaml/stdcompat/stdcompat.a
}
