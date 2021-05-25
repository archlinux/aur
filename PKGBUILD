# Maintainer: Fabien Dubosson <fabien.dubosson@gmail.com>
# Contributor: Adam Harvey <aharvey@sourcegraph.com>
pkgname=comby
pkgver=1.6.0
pkgrel=1
pkgdesc="A tool for structural code search and replace that supports ~every language."
arch=('x86_64')
url="https://comby.dev/"
license=('Apache')
depends=('pkgconf' 'pcre')
makedepends=('opam' 'dune')
source=("https://github.com/comby-tools/$pkgname/archive/$pkgver.tar.gz")
sha256sums=('bd288ff606f972f9bf2bfb14d967731ff5dd8358d4f2bba7ab4cdc65273cd7bb')

build() {
        cd "$srcdir/$pkgname-$pkgver"

        opam init -n
        eval $(opam env)

        opam update
        opam install . --deps-only -y

        make release
}

check() {
        cd "$srcdir/$pkgname-$pkgver"
        make test
}

package() {
        cd "$srcdir/$pkgname-$pkgver"

        DESTDIR="${pkgdir}" dune install --prefix "/usr" --libdir "lib/ocaml"

        install -dm755 "${pkgdir}/usr/share/"
        mv "${pkgdir}/usr/doc" "${pkgdir}/usr/share/"
}
