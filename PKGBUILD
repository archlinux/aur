# Maintainer: Alexandre Bouvier <contact@amb.tf>
_pkgname=sirit
pkgname=$_pkgname-git
pkgver=r185.8cfe8ba
pkgrel=1
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
	"sirit-add-cmake-install-rules.patch::$url/pull/28.patch"
	'unbundle-spirv-headers.patch'
)
b2sums=(
	'SKIP'
	'5f56e767c9ed4cb55741230438f3d8d95478cd7cfa14c0954c39205a1ecfabf3d3e42b7fa0c5f43c54c7a129591e576009f74617dee3aec2564f744184a7bf05'
	'b937242d066614db16211c0e64ab63ac7cfab0696a0dde00ae4ec1e1b06863cbb99e1e102eb3aa5f8d6885a5aa9a73ee998215a33593319077c382c3a664b610'
)

pkgver() {
	cd $_pkgname
	printf 'r%s.%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd $_pkgname
	patch -Np1 < ../sirit-add-cmake-install-rules.patch
	patch -Np1 < ../unbundle-spirv-headers.patch
}

build() {
	cmake -S $_pkgname -B build \
		-DBUILD_SHARED_LIBS=ON \
		-DCMAKE_BUILD_TYPE=None \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-Wno-dev
	cmake --build build
}

package() {
	# shellcheck disable=SC2154
	DESTDIR="$pkgdir" cmake --install build
	install -Dm644 -t "$pkgdir"/usr/share/licenses/$pkgname $_pkgname/LICENSE.txt
}
