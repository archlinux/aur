# Maintainer: Rafael Oliveira <rafael.serra.olveira at tecnico dot ulisboa dot pt>
pkgname=librts-co
pkgver=5_202103031636
pkgrel=2
epoch=
pkgdesc="Runtime support for CDK-based languages, used for the CO course of IST university"
arch=('x86_64')
url="https://web.tecnico.ulisboa.pt/~david.matos/w/pt/index.php/Compiladores"
license=('GPL3')
groups=('ist-co')
depends=('yasm>=1.3.0')
makedepends=()
checkdepends=()
_libname="rts"
_pkgname="Lib$_libname${pkgver//_/-}"
_pkgpath="b/be"
source=("$pkgname-$pkgver.tar.gz::https://web.tecnico.ulisboa.pt/~david.matos/w/pt/images/$_pkgpath/$_pkgname.tar.bz2")
sha256sums=('263478b079898b101706eba1863536a918782c874f71022d8886a18b68948d73')

prepare() {
	cd "${_pkgname,,}"

	sed -i '/^ROOT *=/s/^/#/' Makefile # comment out assignments to ROOT
	sed -i 's/ docs$//' Makefile # remove "all:" phony target's dependency on docs
	sed -i 's/^COMMON_FLAGS =.*/& -fno-stack-protector/' Makefile # add missing -fno-stack-protector flag
	# ^ (although supposedly off by default, some Linux distros patch GCC to change the default to on)
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
