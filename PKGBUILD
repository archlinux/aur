# Maintainer: Alexandre Bouvier <contact@amb.tf>
# Contributor: katt <magunasu.b97@gmail.com>
_pkgname=librw
pkgname=$_pkgname-git
pkgver=r569.169a45a
pkgrel=2
pkgdesc="A re-implementation of the RenderWare Graphics engine"
arch=('aarch64' 'armv7h' 'i486' 'i686' 'pentium4' 'x86_64')
url="https://github.com/aap/librw"
license=('MIT')
depends=('gcc-libs' 'glfw>=3.3.7' 'glibc')
makedepends=('cmake' 'git')
provides=("$_pkgname=${pkgver#r}" 'librw.so')
conflicts=("$_pkgname" 'rankwidth')
source=("$_pkgname::git+$url.git")
b2sums=('SKIP')

pkgver() {
	cd $_pkgname
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	local options=(
		-D BUILD_SHARED_LIBS=ON
		-D CMAKE_BUILD_TYPE=Release
		-D CMAKE_C_FLAGS_RELEASE="-DNDEBUG"
		-D CMAKE_CXX_FLAGS_RELEASE="-DNDEBUG"
		-D CMAKE_INSTALL_PREFIX=/usr
		-D LIBRW_GL3_GFXLIB=GLFW
		-D LIBRW_PLATFORM=GL3
		-D LIBRW_TOOLS=OFF
		-Wno-dev
	)
	cmake "${options[@]}" -B build -S $_pkgname
	cmake --build build
}

package() {
	# shellcheck disable=SC2154
	DESTDIR="$pkgdir" cmake --install build
	install -Dm644 -t "$pkgdir"/usr/share/licenses/$pkgname $_pkgname/LICENSE
}
