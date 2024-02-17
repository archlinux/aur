# Maintainer: Fabien Dubosson <fabien.dubosson@gmail.com>
# Contributor: Adam Harvey <aharvey@sourcegraph.com>
pkgname=comby
pkgver=1.8.1
pkgrel=2
pkgdesc="A tool for structural code search and replace that supports ~every language."
arch=('x86_64')
url="https://comby.dev/"
license=('Apache')
depends=('pkgconf' 'pcre' 'glibc' 'libev' 'zlib' 'sqlite')
makedepends=('opam' 'dune' 'ocamlbuild')
source=("https://github.com/comby-tools/$pkgname/archive/$pkgver.tar.gz")
sha256sums=('04d51cf742bbbf5e5fda064a710be44537fac49bff598d0e9762a3a799d666e2')

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

        DESTDIR="${pkgdir}" dune install --prefix "/usr"  --libdir "/usr/lib/ocaml"

        install -dm755 "${pkgdir}/usr/share/"
        mv "${pkgdir}/usr/doc" "${pkgdir}/usr/share/"
}
