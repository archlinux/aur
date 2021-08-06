# Maintainer: Alexandre Bouvier <contact@amb.tf>
# Contributor: katt <magunasu.b97@gmail.com>
_pkgname=librw
pkgname=$_pkgname-git
pkgver=r520.4c4b199
pkgrel=1
pkgdesc="A re-implementation of the RenderWare Graphics engine"
arch=('i686' 'x86_64')
url="https://github.com/aap/$_pkgname"
license=('MIT')
depends=('glfw')
makedepends=('cmake' 'git')
provides=("$_pkgname=$pkgver" 'librw.so' 'librw_skeleton.so')
conflicts=("$_pkgname")
source=("git+$url.git")
b2sums=('SKIP')

pkgver() {
	cd $_pkgname
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cmake -S $_pkgname -B build \
		-DBUILD_SHARED_LIBS=ON \
		-DCMAKE_BUILD_TYPE=None \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-DLIBRW_GL3_GFXLIB=GLFW \
		-DLIBRW_INSTALL=ON \
		-DLIBRW_PLATFORM=GL3 \
		-Wno-dev
	cmake --build build
}

package() {
	# shellcheck disable=SC2154
	DESTDIR="$pkgdir" cmake --install build
	install -Dm644 -t "$pkgdir"/usr/share/licenses/$pkgname $_pkgname/LICENSE
}
