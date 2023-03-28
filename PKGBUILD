# Adopted from https://aur.archlinux.org/packages/mapbox-gl-native

pkgname=mapbox-gl-native-git
_pkgname=mapbox-gl-native
pkgdesc="C++ library that powers customizable vector maps in native applications"
pkgver=r15975.cf734a2fec
pkgrel=2
arch=("x86_64" "aarch64")
url="https://github.com/mapbox/mapbox-gl-native"
source=("$_pkgname::git+https://github.com/mapbox/mapbox-gl-native" "fix-compilation.patch" "allow-qt-deprecations.patch" "16591.patch" "arch-include-dir.patch")
sha512sums=("SKIP" "SKIP" "SKIP" "SKIP" "SKIP")
depends=("glfw")
provides=("mapbox-gl-native")
conflicts=("mapbox-gl-native")

prepare() {
	cd "$srcdir/$_pkgname"
	git submodule update --init --recursive
	patch -p1 -i ../allow-qt-deprecations.patch
	patch -p1 -i ../fix-compilation.patch
	patch -p1 -i ../16591.patch
	patch -p1 -i ../arch-include-dir.patch
}

build() {
	cmake -B build -S "$_pkgname" -DCMAKE_INSTALL_PREFIX='/usr' -DMBGL_WITH_QT=ON -DMBGL_WITH_WERROR=OFF -DCMAKE_INSTALL_LIBDIR=lib
	make -C build
}

pkgver() {
	cd "$srcdir/$_pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	DESTDIR="$pkgdir" cmake --install build
}
