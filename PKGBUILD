# Contributor: TwoFinger

pkgname=textadept-gtk2
_basename=textadept
pkgver=12.9
pkgrel=2
pkgdesc="Fast, minimalist, and remarkably extensible cross-platform text editor"
arch=(i686 x86_64 aarch64)
url="https://github.com/orbitalquark/textadept"
license=(MIT)
depends=(gtk2 ncurses)
makedepends=(wget unzip cmake)
provides=($pkgname)
conflicts=(${_basename} ${_basename}-gtk3)
source=("$url/archive/${_basename}_$pkgver.tar.gz")
sha256sums=('b675549ea3a77638f7bc02cf0f065c35eb2b3eb8ea721c40ea4539752a14b08b')

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
	cd "${_basename}-${_basename}_$pkgver"
	cmake --install build_dir
}
