# Maintainer: Adam Harvey <aharvey@sourcegraph.com>
pkgname=comby
pkgver=0.18.3
pkgrel=1
epoch=
pkgdesc="A tool for structural code search and replace that supports ~every language"
arch=('x86_64')
url=""
license=('Apache')
groups=()
depends=('pkgconf' 'pcre')
makedepends=('ocaml>=4.10.0' 'opam')
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("https://github.com/comby-tools/$pkgname/archive/$pkgver.tar.gz")
noextract=()
sha512sums=('7940d2435ec529d3b568c5ded0d746c3494e30f887bdb3ef953a543facb8a9aa9f67cbbdc1f653bce82e6a48db9b52efb64011d7f487cd6b280be86c639f6e41')
validpgpkeys=()

build() {
	cd "$pkgname-$pkgver"

    # Ensure opam is initialised.
    opam init -n
    eval $(opam env)

    # Ensure we have a switch using the system OCaml.
    if ! opam switch list | grep -q comby-aur; then
        opam switch create comby-aur ocaml-system
    fi

    # Enable the right OCaml switch.
    eval $(opam env --switch=comby-aur --set-switch)

    # Install the package dependencies. Some of these exist as AUR packages,
    # but many do not, and some rely on forks of upstream packages. To minimise
    # drift from upstream, let's just build everything.
    opam update
    opam upgrade -y
    opam install . --deps-only -y

    # Actually build comby.
    make release
}

check() {
	cd "$pkgname-$pkgver"
    make test
}

package() {
	cd "$pkgname-$pkgver"

    # There's an install rule in the Makefile, but we need to be able to change
    # the prefix.
    dune install --prefix="$pkgdir/usr/"

    # We get a /usr/bin/benchmark, which feels far too generic, so we'll get
    # rid of it for now.
    rm "$pkgdir/usr/bin/benchmark"

    # Documentation is installed to /usr/doc with this setup, but we need it in
    # /usr/share/doc, so let's patch that up here.
    mkdir -p "$pkgdir/usr/share/doc/$pkgname"
    pushd "$pkgdir/usr/doc/$pkgname"
    mv * "$pkgdir/usr/share/doc/$pkgname/"
    popd

    # The rmdirs are ugly, but ensure that we moved everything as expected.
    rmdir "$pkgdir/usr/doc/$pkgname"
    rmdir "$pkgdir/usr/doc"
}
