# Maintainer: Michael Alexander <beefsack@gmail.com>
pkgname=hhvm-hack-git
pkgver=3.15.2
pkgrel=1
pkgdesc="HHVM's Hack tools (hh_client, hh_server, hh_format et al.)"
arch=('x86_64')
url="http://hacklang.org/"
license=('PHP')
makedepends=('git' 'ocaml' 'ocamlbuild' 'ocaml-compiler-libs' 'ocaml-ctypes' 'gcc' 'cmake')
conflicts=("hhvm")
source=(
	"https://github.com/facebook/hhvm/commit/7f556de.patch"
	"hhvm::git+https://github.com/facebook/hhvm#tag=HHVM-${pkgver}"
)
md5sums=(
	'5cc6f0e19f1d8948136e06fe84ed5f2d'
	'SKIP'
)

prepare() {
	cd "$srcdir/hhvm"
	git apply "$srcdir/7f556de.patch"
}

build() {
	cd "$srcdir/hhvm"
	git submodule update --init --recursive
	cd hphp/hack
	cmake .
	make
}

package() {
	cd "$srcdir/hhvm/hphp/hack/bin"
	mkdir -p "$pkgdir/usr/bin"
	cp h2tp hh_client hh_emitter hh_format hh_match hh_server hh_single_type_check "$pkgdir/usr/bin/"
}
