# Maintainer: Torleif Skår <torleif.skaar AT gmail DOT com>
# 
_pkgname=fasthenry
pkgname=${_pkgname}-wr
pkgver=3.0wr_031424
pkgrel=1
pkgdesc="Premium inductance solver - Whitley Research Edition w/KLU Solver"
arch=('x86_64')
url="http://www.wrcad.com/freestuff.html"
license=('LicenseRef-Custom')
depends=(
	"glibc"
	"suitesparse"
)
makedepends=(
	"git"
	"make"
	"gcc"
)
optdepends=(
	"octave: Parsing .mat files produced by Fasthenry"
)
conflicts=(
	"fasthenry"
)
source=(
	"http://www.wrcad.com/ftp/pub/${_pkgname}-${pkgver//_/-}.tar.gz"
	"0001-make_misc.patch"
	"0002-fix_make_klu.patch"
	"LICENSE"
)
b2sums=(
	'9fca528ea85abeca1e00acdc228183d9a0045ccb77f25069205adaed0fdfa78a687c481e49aaf9d3cf38e68c670294b5fb59ce2056bce47a7ef4b7ad141fc723'
	'9476b1d2743bab1441d7daf368ed2ac26ead42e16b56cd8634c36e23b537f4f399cb4a69fe7b9b333fc5af9993a5a3220e1b5a850abc1ae2fed25850a006aa28'
	'ee5c5b3cc478383cbf118534a357025143dc81a19ff04daa8f871147162b5d066ad98e8ccc3e5d124f8846fdf47231f53bfd601a0c01d6565fef87d6701ce5d4'
	'0545e36175f464f3cec3af6f73c945653f78a22eb729ec2dc8c9c3742ab478c89e6de6b108185793b194ec60ef8cec890799712aaad4f25ec461b2f74aca5e45'
)
options=(!debug)
_pkg="${_pkgname}-${pkgver//_*/}"
prepare() {
	cd "${_pkg}"

	# Apply patches
	for p in ../*.patch; do
		echo "Applying patch: $p"
		patch -Np1 < $p
	done
}

build() {
	cd "${_pkg}"
	make SOLVER=KLU_SOLVER all
}

check() {
	cd "${_pkg}/examples"
	# Execute all examples to verify that it works:
	./run
	# Compare against previously ran values for comparison
	./cf
}

package() {
	cd "${_pkg}"
	
	install -Dm0755 -t "${pkgdir}/usr/bin/" bin/fasthenry
	# Install all the binaries
	for exe in MakeLcircuit ReadOutput zbuf; do
		install -Dm0755 bin/"${exe}" "${pkgdir}/usr/bin/${exe}" 
	done
	# License
	install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}/" ../LICENSE
	# Documentation
	install -Dm0644 -t "${pkgdir}/usr/share/${pkgname}/doc/" doc/*.pdf
	
}
