# Maintainer: Alexandre Bouvier <contact@amb.tf>
# Contributor: katt <magunasu.b97@gmail.com>
_pkgname=librw
pkgname=$_pkgname-git
pkgver=r551.d2f54a2
pkgrel=1
pkgdesc="A re-implementation of the RenderWare Graphics engine"
arch=('aarch64' 'armv7h' 'i486' 'i686' 'pentium4' 'x86_64')
url="https://github.com/aap/librw"
license=('MIT')
depends=('glfw>=3.3.7')
makedepends=('cmake' 'git')
provides=("$_pkgname=$pkgver" 'librw.so')
conflicts=("$_pkgname")
source=("$_pkgname::git+$url.git")
b2sums=('SKIP')

pkgver() {
	cd $_pkgname
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cmake -S $_pkgname -B build \
		-DBUILD_SHARED_LIBS=ON \
		-DCMAKE_BUILD_TYPE=Release \
		-DCMAKE_C_FLAGS_RELEASE="-DNDEBUG" \
		-DCMAKE_CXX_FLAGS_RELEASE="-DNDEBUG" \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-DLIBRW_GL3_GFXLIB=GLFW \
		-DLIBRW_PLATFORM=GL3 \
		-DLIBRW_TOOLS=OFF \
		-Wno-dev
	cmake --build build
}

package() {
	# shellcheck disable=SC2154
	DESTDIR="$pkgdir" cmake --install build
	install -Dm644 -t "$pkgdir"/usr/share/licenses/$pkgname $_pkgname/LICENSE
}
