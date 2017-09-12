# Maintainer: Ilai Deutel

pkgname=tutch
pkgver=0.53
pkgrel=1
pkgdesc='A tool for checking constructive proofs'
arch=('i686' 'x86_64')
url='http://www.cse.chalmers.se/~abela/tutch/'
license=('custom:Unlicense')
depends=('smlnj')
provides=('tutch')
source=("http://www.cse.chalmers.se/~abela/tutch/${pkgname}-${pkgver}-for-sml-110.45.tar.gz")
sha256sums=('ea8360f9f1556e04a6597a15ade1e84714aa1aefc20a65bb3e430c11d49ad1ea')

prepare() {
	# Add absolute paths for sml and ml-build, in case they are not in PATH
	# Add the absolute path for the installed tutch library
    sed -i "15,16s%= %= /usr/lib/smlnj/bin/%;
		32s%\`pwd\`%/usr/lib/tutch%" \
		"${pkgname}-${pkgver}/Makefile"
}

build() {
	cd "${pkgname}-${pkgver}"
	make
}

package() {
	cd "${pkgname}-${pkgver}"
	_HEAPSUFFIX=`/usr/lib/smlnj/bin/sml @SMLsuffix`
	install -Dm755 "bin/.heap/tutch.$_HEAPSUFFIX" "${pkgdir}/usr/lib/tutch/bin/.heap/tutch.$_HEAPSUFFIX"
	install -Dm755 "bin/tutch" "${pkgdir}/usr/bin/tutch"
	install -Dm755 -d "${pkgdir}/usr/share/doc/tutch"
	cp -dr --no-preserve=ownership "doc/." "${pkgdir}/usr/share/doc/tutch/"
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
