# Maintainer: xiretza <xiretza+aur@xiretza.xyz>

_pkgname=fasm
pkgname="python-$_pkgname-git"
pkgver=0.0.2.r98.g9a73d70
pkgrel=2
pkgdesc="FPGA Assembly (FASM) Parser and Generation library"
arch=(x86_64)
url="https://github.com/SymbiFlow/fasm"
license=('ISC')
depends=('python' 'python-textx' 'antlr4-runtime')
makedepends=('git' 'python-setuptools' 'cython' 'cmake' 'antlr4')
checkdepends=('gtest' 'python-pytest')
provides=("${pkgname%%-git}=$pkgver")
conflicts=(fasm "${pkgname%%-git}")
source=(
	"git+$url.git"
	"FindANTLR.cmake"
	"0001-ANTLR4-4.10-compatibility.patch"
	"0002-cmake-use-native-gtest.patch"
	"0003-cmake-use-native-antlr.patch"
	"0004-cmake-install-parse_fasm.so.patch"
	"0005-fix-cmake-fix-missing-gtest-linker-argument.patch"
	"0006-Use-cmake-directly-instead-of-letting-setup.py-try-t.patch"
	"0007-cmake-install-tags.py-properly.patch"
)
sha256sums=('SKIP'
            'ff8bb6b28f8e4724aeac01526ea7fa193f4bfa979de24ac99dbae92ee7116488'
            'd70b631453501e731e63cfa21d24c12386a2e3343631b5e4e7edbba2f4dc7ace'
            '66404ae75ab1e761bcf22de598e76882cc52cad57a95368e751b8a078ecca9ce'
            '8c973830b1309fa636e101ce520d7d617adf09364ca86b5c8a5111b1597fb57f'
            'aff2f899aa8bc8b9b93d48430c63d97012c1d53b41106b2f4294e8dbcacb0110'
            '6be3cebb42c8f40359c7b0d5bbbaba0434920ba21276ee78dc362e7084739d03'
            '24b86a0575317b2349ec4ae488592f949995d5e9cabbf0bc41b2d133a91c6591'
            '8f4b57b2bbbfa601b53003489a786ee889db00b92f67a34356e7efcaa7b83683')

pkgver() {
	cd "$_pkgname"

	git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
	cd "$_pkgname"

	for patch in "$srcdir"/*.patch; do
		patch -p1 < "$patch"
	done
}

build() {
	local python_version=$(python -c 'import sys; print(".".join(map(str, sys.version_info[:2])))')

	cmake -S "$_pkgname/src" -B cmake_builddir \
		-DCMAKE_MODULE_PATH="$srcdir" \
		-DANTLR_EXECUTABLE=/usr/share/java/antlr-complete.jar \
		-DCMAKE_INSTALL_PREFIX="$srcdir/$_pkgname/build" \
		-DCMAKE_INSTALL_LIBDIR="lib.linux-$CARCH-$python_version/fasm/parser" \
		-DCMAKE_BUILD_TYPE=None
	make -C cmake_builddir
	make -C cmake_builddir install

	cd "$_pkgname"

	python setup.py build
}

check() {
	: broken
	#local python_version=$(python -c 'import sys; print(".".join(map(str, sys.version_info[:2])))')
	#PYTHONPATH="$srcdir/$_pkgname/build/lib.linux-$CARCH-$python_version" pytest "$_pkgname/tests"
}

package() {
	cd "$_pkgname"

	python setup.py install --root="$pkgdir" --optimize=1 --skip-build

	install -Dm 644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
