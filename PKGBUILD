# Contributor: TwoFinger

pkgname=textadept-gtk2
_basename=textadept
pkgver=12.5
pkgrel=2
pkgdesc="Fast, minimalist, and remarkably extensible cross-platform text editor"
arch=(i686 x86_64 aarch64)
url="https://github.com/orbitalquark/textadept"
license=(MIT)
makedepends=(gtk2 ncurses wget unzip cmake)
source=("$url/archive/${_basename}_$pkgver.tar.gz"
		0001_fix-build.patch)
sha256sums=('ff59d2240c8169563c9a39eb19b65788dcde0a4f327c7d028b23dafc9d85a8d4'
            'e919a74e0e6729abc37326edbcfe7f2c0099848b598b9252740fcd79b266292e')

prepare() {
	cd "${_basename}-${_basename}_$pkgver"
	sed -i '/GTK REQUIRED/ {s/-2/-3/; s/-3/-2/}' CMakeLists.txt

	# Compilation failure with GTK2
	# https://github.com/orbitalquark/textadept/issues/584
	patch -Np1 -i "${srcdir}"/0001_fix-build.patch
}

build() {
	cd "${_basename}-${_basename}_$pkgver"
	export LDFLAGS=-Wl,-z,relro,-z,now
	cmake -B build_dir \
		-D CMAKE_INSTALL_PREFIX="$pkgdir"/usr \
		-D CMAKE_BUILD_TYPE=None \
		-D QT=OFF
	cmake --build build_dir -j
}

package_textadept-gtk2() {
	depends=(gtk2 ncurses)
	provides=($pkgname)
	conflicts=(${_basename} ${_basename}-gtk3)

	cd "${_basename}-${_basename}_$pkgver"
	cmake --install build_dir
}
