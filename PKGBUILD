# Maintainer: Alexandre Bouvier <contact@amb.tf>
_pkgname=sirit
pkgname=$_pkgname-git
pkgver=r185.8cfe8ba
pkgrel=3
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
	"0001-sirit-add-cmake-install-rules.patch::$url/pull/28.patch"
	'unbundle-spirv-headers.patch'
)
b2sums=(
	'SKIP'
	'eb2c72c36172e716675a27ad65635971dd17bce8510cff7a01c8e5592e05222f2d0f3d256488f6a781dd9f48300d17d58e19cee9fc857b7f03d78c07edf47a7c'
	'14f068bbf5e4d891078ce141418d30727700d881a0965b5d80ec3d58522b380efaacac880a562f14786169c958fb72283b1bb8a8940f8ae2b2c528d84b69a77a'
)

pkgver() {
	cd $_pkgname
	printf 'r%s.%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd $_pkgname
	patch -Np1 < ../0001-sirit-add-cmake-install-rules.patch
	patch -Np1 < ../unbundle-spirv-headers.patch
}

build() {
	cmake -S $_pkgname -B build \
		-DBUILD_SHARED_LIBS=ON \
		-DCMAKE_BUILD_TYPE=None \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-DSIRIT_TESTS="$CHECKFUNC" \
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
