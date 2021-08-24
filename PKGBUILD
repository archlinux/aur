# Maintainer: Alexandre Bouvier <contact@amb.tf>
_pkgname=sirit
pkgname=$_pkgname-git
pkgver=r185.8cfe8ba
pkgrel=4
pkgdesc='A runtime SPIR-V assembler'
arch=('x86_64')
url="https://github.com/ReinUsesLisp/$_pkgname"
license=('BSD')
depends=('gcc-libs' 'spirv-headers>=1.5.4.raytracing.fixed.r32')
makedepends=('cmake' 'git')
provides=("$_pkgname=$pkgver" 'libsirit.so')
conflicts=("$_pkgname")
source=(
	"git+$url.git"
	"0002-sirit-add-cmake-install-rules.patch::$url/pull/28.patch"
)
b2sums=(
	'SKIP'
	'44274daa676f72637d7a4c3b5644190f642392440d6a5a3fae4be623c24526ac8e6d52655549ec690b597fd109b449bce72d9a00ae7413a2c2d7fdd80f773200'
)

pkgver() {
	cd $_pkgname
	printf 'r%s.%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	patch -d $_pkgname -Np1 < 0002-sirit-add-cmake-install-rules.patch
}

build() {
	cmake -S $_pkgname -B build \
		-DBUILD_SHARED_LIBS=ON \
		-DCMAKE_BUILD_TYPE=None \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-DSIRIT_TESTS="$CHECKFUNC" \
		-DSIRIT_USE_SYSTEM_SPIRV_HEADERS=ON \
		-Wno-dev
	cmake --build build
}

check() {
	cmake --build build --target test
}

package() {
	# shellcheck disable=SC2154
	DESTDIR="$pkgdir" cmake --install build
	install -Dm644 -t "$pkgdir"/usr/share/licenses/$pkgname $_pkgname/LICENSE.txt
}
