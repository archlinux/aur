# Maintainer: Michael Alexander <beefsack@gmail.com>
pkgname=hhvm-hack-git
pkgver=3.17.1
pkgrel=1
pkgdesc="HHVM's Hack tools (hh_client, hh_server, hh_format et al.)"
arch=('x86_64')
url="http://hacklang.org/"
license=('PHP')
makedepends=('git' 'ocaml' 'ocamlbuild' 'ocaml-compiler-libs' 'ocaml-ctypes' 'gcc' 'cmake' 'libdwarf')
conflicts=("hhvm")
source=(
	#'https://github.com/facebook/hhvm/commit/2a4d3da.patch'
	"hhvm::git+https://github.com/facebook/hhvm#tag=HHVM-${pkgver}"
)
md5sums=(
	#'a9b12ff007d9590a25d7a945edf590c7'
	'SKIP'
)

prepare() {
	cd "$srcdir/hhvm"
	#git apply "$srcdir/2a4d3da.patch"
}

build() {
	cd "$srcdir/hhvm"
	git submodule update --init --recursive
	cd hphp/hack
	cmake -D CMAKE_MODULE_PATH=../../CMake .
	make
}

package() {
	cd "$srcdir/hhvm/hphp/hack/bin"
	mkdir -p "$pkgdir/usr/bin"
	cp h2tp hh_client hh_emitter hh_format hh_match hh_server hh_single_type_check "$pkgdir/usr/bin/"
}
