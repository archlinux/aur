# Maintainer: Alexandre Bouvier <contact@amb.tf>
_pkgname=dynarmic
pkgname=$_pkgname-git
pkgver=5.r117.g16979029
pkgrel=1
pkgdesc='An ARM dynamic recompiler'
arch=('x86_64')
url="https://github.com/MerryMage/$_pkgname"
license=('BSD')
makedepends=(
	'boost>=1.57'
	'cmake>=3.8'
	'fmt>=8'
	'git'
	'robin-map>=0.6.2'
	'xbyak>=5.995.r3'
	'zydis>=3.1.0.r78'
)
checkdepends=('catch2>=2.13.1')
provides=("$_pkgname=$pkgver" 'libdynarmic.so')
conflicts=("$_pkgname")
source=(
	"git+$url.git"
	"0005-dynarmic-add-cmake-install-rules.patch::$url/pull/636.patch"
)
b2sums=(
	'SKIP'
	'ee11c1ddb4d0adca53eb7801eb271b20d22c66ee5b0a5aba7519066d01a8e4fc4a8edf9b494102fbc5d024243ad45fe81a6ef392856deed7db455a6876727e19'
)

pkgver() {
	cd $_pkgname
	git describe --long --tags | sed 's/^r//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
	patch -d $_pkgname -Np1 < 0005-dynarmic-add-cmake-install-rules.patch
}

build() {
	cmake -S $_pkgname -B build \
		-DBUILD_SHARED_LIBS=ON \
		-DCMAKE_BUILD_TYPE=None \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-DDYNARMIC_IGNORE_ASSERTS=ON \
		-DDYNARMIC_NO_BUNDLED_CATCH=ON \
		-DDYNARMIC_NO_BUNDLED_FMT=ON \
		-DDYNARMIC_NO_BUNDLED_ROBIN_MAP=ON \
		-DDYNARMIC_NO_BUNDLED_XBYAK=ON \
		-DDYNARMIC_NO_BUNDLED_ZYDIS=ON \
		-DDYNARMIC_TESTS="$CHECKFUNC" \
		-Wno-dev
	cmake --build build
}

check() {
	cmake --build build --target test
}

package() {
	depends+=('libfmt.so' 'libZydis.so')
	# shellcheck disable=SC2154
	DESTDIR="$pkgdir" cmake --install build
	install -Dm644 -t "$pkgdir"/usr/share/licenses/$pkgname $_pkgname/LICENSE.txt
}
