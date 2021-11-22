# Maintainer: Kevin Schoon <kevinschoon@gmail.com>
pkgname=note-ocaml
pkgver=0.6.1
pkgrel=1
pkgdesc="Simple Note Taking CLI"
url="https://github.com/kevinschoon/note"
arch=(x86_64)
license=('AGPL3')
source=("$pkgname-$pkgver.tar.gz::https://github.com/kevinschoon/note/archive/$pkgver/$pkgver.tar.gz")
md5sums=(cf7edc854b85cf349cbc59bde876dd9d)
# depends=(glibc)
makedepends=('ocaml>=4.10.0' 'opam>=2.0.0' 'dune>=2.9.0' "m4" "scdoc" "make")

prepare() {
    cd "note-$pkgver"
    make docs
    # dune subst doesn't work outside of git
    # sed -i "s/%%VERSION%%/$pkgver/g" "$srcdir/note-$pkgver/bin/note.ml"
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
	install -Dm644 note-$pkgver/doc/note-cat.1 -t ${pkgdir}/usr/share/man/man1/
	install -Dm644 note-$pkgver/doc/note-config.1 -t ${pkgdir}/usr/share/man/man1/
	install -Dm644 note-$pkgver/doc/note-delete.1 -t ${pkgdir}/usr/share/man/man1/
	install -Dm644 note-$pkgver/doc/note-edit.1 -t ${pkgdir}/usr/share/man/man1/
	install -Dm644 note-$pkgver/doc/note-ls.1 -t ${pkgdir}/usr/share/man/man1/
	install -Dm644 note-$pkgver/doc/note-sync.1 -t ${pkgdir}/usr/share/man/man1/
	install -Dm644 note-$pkgver/doc/note.5 -t ${pkgdir}/usr/share/man/man5/
}
