# Maintainer: Adam Harvey <aharvey@sourcegraph.com>
pkgname=comby
pkgver=0.15.0
pkgrel=1
epoch=
pkgdesc="A tool for structural code search and replace that supports ~every language"
arch=('x86_64')
url=""
license=('Apache')
groups=()
depends=('pkgconf' 'pcre')
makedepends=('opam')
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
sha512sums=('6973aecdb2e797c5fddbc47849b4c35beee1179ca28e35d33037e2b1ecba0e25dbe81467d724b92b0392bb28bed3bd4aaf32d138f9961551948510e6ed9e3d74')
validpgpkeys=()

build() {
	cd "$pkgname-$pkgver"

    # Ensure opam is initialised.
    opam init -n
    eval $(opam env)

    # Install the OCaml version we're going to use.
    # This has to be 4.09.1 due to a GCC 10 issue with the upstream-recommended
    # 4.09.0: https://github.com/ocaml/ocaml/issues/9144
    if ! opam switch list | grep -q 4.09.1; then
        opam switch create 4.09.1 4.09.1
    fi
    eval $(opam env)

    # Enable the right OCaml version.
    opam switch 4.09.1

    # Install the package dependencies. Some of these exist as AUR packages,
    # but many do not, and some rely on forks of upstream packages. To minimise
    # drift from upstream, let's just build everything.
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
