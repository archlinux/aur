pkgname=mapbox-gl-native
pkgver=1.6.0
pkgrel=1
arch=("x86_64" "aarch64")
url="https://github.com/mapbox/mapbox-gl-native"
# using source from alpine since submodules aren't included in github tarball
source=("https://dev.alpinelinux.org/archive/mapbox-gl-native/mapbox-gl-native-$pkgver.tar.gz" "fix-compilation.patch" "allow-qt-deprecations.patch" "16591.patch" "arch-include-dir.patch")
sha512sums=("5e70f04fc22854f2208c335e12bd85252432d7939a1b205c5dbaebe27a3de681cd14e2ef88100f04bc4c84b412020670681f2d548e7cdc209ee3aaa70349f025" "SKIP" "SKIP" "SKIP" "SKIP")
depends=("glfw")

prepare() {
	cd "$pkgname"

	patch -p1 -i ../allow-qt-deprecations.patch
	patch -p1 -i ../fix-compilation.patch
	patch -p1 -i ../16591.patch
	patch -p1 -i ../arch-include-dir.patch
}

build() {
	cmake -B build -S "$pkgname" -DCMAKE_INSTALL_PREFIX='/usr' -DMBGL_WITH_QT=ON -DCMAKE_INSTALL_LIBDIR=lib
	make -C build
}

package() {
	DESTDIR="$pkgdir" cmake --install build
}
