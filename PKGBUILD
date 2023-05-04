# Maintainer: Rafael Oliveira <rafael.serra.olveira at tecnico dot ulisboa dot pt>
pkgname=libcdk-co
pkgver=18_202304130000
pkgrel=1
epoch=
pkgdesc="Compiler Development Kit, used for the CO course of IST university"
arch=('x86_64')
url="https://web.tecnico.ulisboa.pt/~david.matos/w/pt/index.php/Compiladores"
license=('GPL3')
groups=('ist-co')
depends=('python>=3')
makedepends=()
checkdepends=()
_libname="cdk"
_pkgname="Lib$_libname${pkgver//_/-}"
_pkgpath="3/39"
source=("$pkgname-$pkgver.tar.gz::https://web.tecnico.ulisboa.pt/~david.matos/w/pt/images/$_pkgpath/$_pkgname.tar.bz2")
sha256sums=('e56e2e6a061f4fe672b632021681b76d7ac23fd811dccb106b7b6c0d7790e011')

prepare() {
	cd "${_pkgname,,}"

	sed -i '/^ROOT *=/s/^/#/' Makefile # comment out assignments to ROOT
	sed -i 's/ docs$//' Makefile # remove "all:" phony target's dependency on docs
}

build() {
	cd "${_pkgname,,}"

	make
}

package() {
	cd "${_pkgname,,}"

	make ROOT="$pkgdir" install

	# created by make but content never added; also remove ancestors if they were created by mkdir -p
	rmdir "$pkgdir/usr/share/doc/packages/$_libname" || true
	rmdir --ignore-fail-on-non-empty {"$pkgdir/usr/share/doc/packages","$pkgdir/usr/share/doc","$pkgdir/usr/share","$pkgdir/usr"}
}
