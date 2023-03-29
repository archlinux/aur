# Adopted from https://aur.archlinux.org/packages/mapbox-gl-native

pkgname=mapbox-gl-native-git
_pkgname=mapbox-gl-native
pkgdesc="C++ library that powers customizable vector maps in native applications"
pkgver=r15975.cf734a2fec
pkgrel=3
arch=("x86_64" "aarch64")
url="https://github.com/mapbox/mapbox-gl-native"
source=("$_pkgname::git+https://github.com/mapbox/mapbox-gl-native" "fix-compilation.patch" "allow-qt-deprecations.patch" "16591.patch" "arch-include-dir.patch")
sha512sums=('SKIP'
            '6e7af9079af04eec44ad5b96ddc2d0afd6781ed38215c9c87e77d0360ebc6232c050a9d53eb09c3ef44aa027392e47abe5fdaff8c27cdf8d89cd7f5554b4b29e'
            'b2aa9dffb5b1ea9e5765b02fdae599372ab4133ba001a937b251da05cca176af15d7c82f635ac5156f4dcd13f9fe1fb20b4323a3cfb9e742c52bc4a071407a6b'
            'c21bb4a789e6071e3dba131d03cf40330fae2c1d912673932d2993321a05f3b664c73e820b9048ca75ca3f24b68573729e8172ed37211396a7b0b1f0a342c8cd'
            '9bab06c981056c9b934595862095674d92b11e329a80e2f0b96fc211d12bda34538af25e26038888b1e47cf159af33c34464e52d2e8a9a5e2321c270bcd3e6d5')
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
