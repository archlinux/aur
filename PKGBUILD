# Maintainer: Adam Harvey <aharvey@sourcegraph.com>
pkgname=comby
pkgver=0.18.4
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
sha512sums=('7045373f9ed480afa60065dcf7247d578277151febf70f0d4877ee9418855fb5a673476c31297f85636d855fec7c17f81bf9a8f6044a7e191123f857b7226ef1')
validpgpkeys=()

build() {
	cd "$pkgname-$pkgver"

    # Ensure opam is initialised.
    opam init -n
    eval $(opam env)

    # Ensure we have a switch using the system OCaml. Due to
    # https://github.com/ocaml/opam/issues/3708, the easiest way forward is to
    # remove and recreate it to handle version drift in the underlying Arch
    # packages.
    opam switch remove comby-aur -y || true
    opam switch create comby-aur ocaml-system

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
