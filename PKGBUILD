# Maintainer: Kevin Schoon <kevinschoon@gmail.com>
pkgname=note-ocaml
pkgver=0.5.6
pkgrel=1
pkgdesc="Simple Note Taking CLI"
url="https://github.com/kevinschoon/note"
arch=(x86_64)
license=('AGPL3')
source=("$pkgname-$pkgver.tar.gz::https://github.com/kevinschoon/note/archive/$pkgver/$pkgver.tar.gz")
md5sums=(87b41c6d119eb0a160ee5fa016c42b6e)
# depends=(glibc)
makedepends=('ocaml>=4.10.0' 'opam>=2.0.0')

prepare() {
    # dune subst doesn't work outside of git
    sed -i "s/%%VERSION%%/$pkgver/g" "$srcdir/note-$pkgver/lib/cmd.ml"
}

build() {
    cd "note-$pkgver"
    opam switch --yes create .
    eval $(opam env --switch=. --set-switch)
    dune build
    opam switch --yes remove .
}

package() {
	install -Dm755 note-$pkgver/_build/default/bin/note.exe -T "${pkgdir}/usr/bin/note"
	install -Dm644 note-$pkgver/completion/note -t ${pkgdir}/usr/share/bash-completion/completions/
	install -Dm644 note-$pkgver/doc/note.1 -t ${pkgdir}/usr/share/man/man1/
	install -Dm644 note-$pkgver/doc/note.5 -t ${pkgdir}/usr/share/man/man5/
}
