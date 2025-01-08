# Contributor: TwoFinger

pkgname=textadept-gtk2
_basename=textadept
pkgver=12.5
pkgrel=1
pkgdesc="Fast, minimalist, and remarkably extensible cross-platform text editor"
arch=(i686 x86_64 aarch64)
url="https://github.com/orbitalquark/textadept"
license=(MIT)
makedepends=(gtk2 ncurses wget unzip cmake)
source=("$url/archive/${_basename}_$pkgver.tar.gz")
sha256sums=('ff59d2240c8169563c9a39eb19b65788dcde0a4f327c7d028b23dafc9d85a8d4')

prepare() {
	cd "${_basename}-${_basename}_$pkgver"
	sed -i '/GTK REQUIRED/ {s/-2/-3/; s/-3/-2/}' CMakeLists.txt
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
