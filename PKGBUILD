# Maintainer: xiretza <xiretza+aur@xiretza.xyz>

_pkgname=fasm
pkgname="python-$_pkgname-git"
pkgver=0.0.2.r98.g9a73d70
pkgrel=4
pkgdesc="FPGA Assembly (FASM) Parser and Generation library"
arch=(x86_64)
url="https://github.com/SymbiFlow/fasm"
license=('ISC')
depends=('python' 'python-textx' 'antlr4-runtime')
makedepends=('git' 'python-setuptools' 'cython' 'cmake' 'antlr4')
checkdepends=('gtest' 'python-pytest')
provides=("${pkgname%%-git}=$pkgver")
conflicts=(fasm "${pkgname%%-git}")
_patches=(
	"0001-cmake-install-parse_fasm.so.patch"
	"0002-cmake-install-tags.py-properly.patch"
	"0003-fix-setup.py-compute-install-directory-before-outsid.patch"
	"0004-setup.py-don-t-build-everything-twice.patch"
	"0005-cmake-allow-overriding-ANTLR_EXECUTABLE.patch"
	"0006-cmake-explicitly-link-test-with-gtest.patch"
	"0007-ANTLR4-4.10-compatibility.patch"
	"0008-cmake-use-native-gtest.patch"
	"0009-Use-cmake-directly-instead-of-letting-setup.py-try-t.patch"
)
source=(
	"git+$url.git"
	"FindANTLR.cmake"
	"${_patches[@]}"
)
sha256sums=('SKIP'
            'ff8bb6b28f8e4724aeac01526ea7fa193f4bfa979de24ac99dbae92ee7116488'
            'e9ce35a0a8d36fbc1f136bd80a4a2b1b590bd8020a03ce39fba9101c7ae3511b'
            'b202854f6063fac816f8108ee898fa77b177a065ec73977e23be3088c2c1e40e'
            '19d6200bd03522381d50c5092058bfb875d20e86a30f1e1740ebad266d883c2d'
            '8d17a72da87b324fc3b9cb5b3fff107bfe65320189739bc83a1de3891647ba30'
            '6ce39a0f2d3897985f14c96ea99e0fe549bb70b7b49249b7cccccc8eedd99166'
            '2d467f16e09af1af873d1d2605e8bbf382df9ae437c04f195c7e756bd309e3e3'
            'a21e0f26da7d481399b009e1d29d37c8969fbc73c80eebe20ec3f2f6696b9752'
            '07d774fe24431ad1f3b3bedd596a7f37611fa8a5204aab7c690a7f90f97bd760'
            '58c880e4074c0307f9d2837fdf9de2fbd68c39c472729190f95f28016e2463dc')

pkgver() {
	cd "$_pkgname"

	git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
	cd "$_pkgname"

	for patch in "${_patches[@]}"; do
		patch -p1 < "$srcdir/$patch"
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
