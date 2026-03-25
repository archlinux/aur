# Maintainer: Aren Moynihan <rn+aur@peacevolution.org
# Contributor: amano.kenji <amano.kenji@proton.me>

pkgname=janet-spork
pkgver=1.2.0
pkgrel=1
pkgdesc="Various Janet utility modules - the official \"Contrib\" library."
arch=("x86_64")
url="https://github.com/janet-lang/spork"
license=("MIT")
depends=("glibc" "janet-lang")
makedepends=("git")
options=("staticlibs")
_commit="3bdcf5831001d11dd12a6a311a4ede2b68f31cd2"
source=("git+https://github.com/janet-lang/spork#tag=v${pkgver}")
sha256sums=('9537483848cf9f2a7f60ddac46873a8256b56ea9b083c1d3206ea940b97fe971')

build() {
	cd spork

	# TODO: have jpm read the CFLAGS and LDFLAGS env variables
	# they can't be passed at all because they typically contains commas, and jpm
	# attempts to split these arguments on ","
	jpm build
}

package() {
	cd spork

	_modpath="$(janet -e '(print (dyn :syspath))')"
	mkdir -p "${pkgdir}/usr/share/doc/${pkgname}" \
		"${pkgdir}/${_modpath}" \
		"${pkgdir}/usr/share/man/man1"

	# Install documentatino
	cp -r doc "${pkgdir}/usr/share/doc/${pkgname}"
	install -m644 -t "${pkgdir}/usr/share/doc/${pkgname}" README.md 

	jpm --dest-dir="${pkgdir}" \
		--modpath="${_modpath}" \
		--binpath="/usr/bin" install
}
