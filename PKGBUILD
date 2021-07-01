# Maintainer: Fabien Dubosson <fabien.dubosson@gmail.com>
# Contributor: Adam Harvey <aharvey@sourcegraph.com>
pkgname=comby
pkgver=1.7.0
pkgrel=1
pkgdesc="A tool for structural code search and replace that supports ~every language."
arch=('x86_64')
url="https://comby.dev/"
license=('Apache')
depends=('pkgconf' 'pcre')
makedepends=('opam' 'dune')
source=("https://github.com/comby-tools/$pkgname/archive/$pkgver.tar.gz")
sha256sums=('fd1351d534c905774ceb4b1e908d81e67eeff007c8b9c4a28fe145e85c7c5f5d')

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
