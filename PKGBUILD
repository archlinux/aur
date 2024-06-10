# Maintainer: HurricanePootis <hurricanepootis@protonmail.com>

pkgname=soil2-git
pkgver=1.20.r53.g2293246
pkgrel=4
pkgdesc="SOILa tiny C library used primarily for uploading textures into OpenGL."
arch=('x86_64')
url="https://github.com/SpartanJ/SOIL2"
license=('MIT-0')
depends=('glibc' 'gcc-libs' 'libglvnd')
makedepends=('mesa' 'cmake' 'git')
provides=("soil2")
conflicts=("soil2")
options=('staticlibs')
source=("$pkgname::git+$url.git")
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/$pkgname"
	git describe --long --abbrev=7 | sed 's/^release.//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
	cd "$srcdir/$pkgname"
}

build() {
	cd "$srcdir"

	# Compile static
	cmake -B build \
	-S $pkgname \
	-DCMAKE_BUILD_TYPE=None \
	-DCMAKE_INSTALL_PREFIX=/usr \
	-DOpenGL_GL_PREFERENCE=GLVND

	cmake --build build

	# Compile shared
	sed -i 's/add_library(soil2/add_library(soil2\ SHARED/g' "$srcdir/$pkgname/CMakeLists.txt"
	cmake -B buildshared \
	-S $pkgname \
	-DCMAKE_BUILD_TYPE=None \
	-DCMAKE_INSTALL_PREFIX=/usr \
	-DOpenGL_GL_PREFERENCE=GLVND

	cmake --build buildshared
}

package() {
	cd "$srcdir"
	DESTDIR="$pkgdir" cmake --install build
	install -Dm754 "$srcdir/buildshared/libsoil2.so" "$pkgdir/usr/lib/libsoil2.so"
}
