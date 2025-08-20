# Maintainer: Manuel Wiesinger <m {you know what belongs here} mmap {and here} at>

_ocamlname=stdcompat
pkgname=ocaml-$_ocamlname
pkgver=21.1
pkgrel=1
pkgdesc="Compatibility module for OCaml standard library"
url="https://github.com/thierry-martinez/stdcompat"
license=('BSD-2-Clause')
source=("$pkgname-$pkgver.tar.gz::https://github.com/thierry-martinez/stdcompat/archive/refs/tags/${pkgver}.tar.gz")
depends=('glibc' 'ocaml<5.4')
makedepends=('ocaml-findlib')
arch=('x86_64')
b2sums=('b351696f0aed268cd067e20a7d0917a5580399b43e5de3e60fce0ab30a8093cd1808eda610d5a20eb721033f77c45f9b5c8dabc6d55862b023c363b212a505e8')

OCAMLFIND_DESTDIR="${pkgdir}$(ocamlfind printconf destdir)"

build() {
    cd "${srcdir}/${_ocamlname}-${pkgver}"

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

    install -Dm644 README.md -t $pkgdir/usr/share/doc/$pkgname/
    install -Dm644 CHANGES.md -t $pkgdir/usr/share/doc/$pkgname/

    # Fix permissions
    chmod 644 $pkgdir/usr/lib/ocaml/stdcompat/libstdcompat__stubs.a
    chmod 644 $pkgdir/usr/lib/ocaml/stdcompat/stdcompat.a
}

check() {
    cd "${srcdir}/${_ocamlname}-${pkgver}"
    make test
}
