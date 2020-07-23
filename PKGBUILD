# Maintainer: Adam Harvey <aharvey@sourcegraph.com>
pkgname=comby
pkgver=0.17.0
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
sha512sums=('b245e3a92b2aba0d6990df6e24b1d757a9ea99fa16eca3da3037d4c50af204bd959e4d69446fc4dde02084f428e6c0e0f9aa81ebcbd6fa7add72d922aa72d36e')
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
