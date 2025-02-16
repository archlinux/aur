# Maintainer: Torleif Skår <torleif.skaar AT gmail DOT com>
pkgname=vacask
pkgver=0.2.2
pkgrel=1
pkgdesc="Verilog-A Circuit Analysis Kernel is an analog circuit simulator"
arch=(
	'x86_64'
	'aarch64'
)
url="https://codeberg.org/arpadbuermen/VACASK"
license=('AGPL-3.0-or-later')
depends=(
	'openvaf-r'
	'suitesparse'
	'boost-libs'
	'glibc'
	'gcc-libs'
)
makedepends=(
	'git'
	'gcc'
	'cmake'
	'ninja'
	'boost'
	'bison'
	'flex'
)
checkdepends=(
	'python'
	'python-numpy'
	'python-scipy'
)
optdepends=(
	'python-matplotlib: For plotting the individual tests'
)
options=()
source=(
	"${pkgname}-${pkgver}::git+${url}#tag=_${pkgver}"
	"0000-numpy_2v0_types.patch"
	"0001-no_install_openvaf-r.patch"
)
b2sums=(
	'5da6f52b58ac1f59b5341ca198f7190dbb292720cb8a6396a7d265a001d2206060be400b8eb8abe313ff39fc9f5184a52ae3acbbaa82280edef5d93bed42a510'
	'a2be740d9956a518665ed01a711ad85ff25020bbbcc139a31af37f95d47f17399c301f445847d0ac63141f3680e6f17628fe3b940703059eda9a7dceafa74b41'
	'c8458db954ab4cd3132244b3da49538f3c33f2f7779f3b858b9bbe7e31ccd7b35552c79a087d68e5eb6895d95fb15035fbc8d34355e69c5db73b3bdf3aad449a'
)

prepare() {
	cd "${pkgname}-${pkgver}"

	# Fixup numpy 2.0 types
	patch -Np1 < "../0000-numpy_2v0_types.patch"
	# Avoid installing openvaf-r it should be installed already from openvaf-reloaded
	patch -Np1 < "../0001-no_install_openvaf-r.patch"
}

build() {
	cmake -B build -S "${pkgname}-${pkgver}" \
		-DCMAKE_BUILD_TYPE='None' \
		-DCMAKE_INSTALL_PREFIX='/usr/' \
		-Wno-dev
	cmake --build build
}

check() {
	ctest --test-dir build --output-on-failure
}

package() {
	DESTDIR="${pkgdir}" cmake --install build
}
